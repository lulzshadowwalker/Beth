import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/models/eva.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// email authenticity checking api ( https://eva.pingutil.com )
class EvaApiController {
  /* STRING CONSTANTS --------------------------------------------------------- */
  static const _kBaseUrl = 'https://api.eva.pingutil.com/email?email=';
  static const String _kClassName = 'EvaApiController';
  /* -------------------------------------------------------------------------- */

  final _log = BethUtils.getLogger(_kClassName);

  /// verifies email authenticity
  Future<bool> verifyEmail(String email) async {
    try {
      final uri = Uri.parse('$_kBaseUrl+$email');

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Status code: ${response.statusCode}');
      }

      final json = convert.jsonDecode(response.body);
      final data = Eva.fromJson(json).data;

      if (!data!.disposable! && !data.spam! && data.deliverable!) {
        _log.v('authentic email');
        return true;
      } else {
        _log.v('unauthentic email');
        return false;
      }
    } catch (e) {
      _log.v(e.toString());
      // i don't want the user to get stuck on the sign in screen if anything
      //  goes wrong with the api
      return true;
    }
  }
}
