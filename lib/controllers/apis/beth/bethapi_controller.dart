import 'dart:convert' as convert;

import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/local/beth_local.dart';
import 'package:beth/models/bethapi.dart';
import 'package:beth/models/phiona.dart';
import 'package:http/http.dart' as http;

class BethapiController {
  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _kClassName = 'BethapiController';
  static const String _kBaseUrl =
      'https://api.future.phiona.com/api/v1/63202daf8e8cc4aa02f42636/0f929b918a5754b6610c3303c8ebb771/';
  static const String _kSamplesEndPoint = '/sample';
  static const String _kApiKeyHeader = 'x-phiona-api-key';
  /* -------------------------------------------------------------------------- */

  final _log = BethUtils.getLogger(_kClassName);

  /// feteches the data related to [Discover]
  Future<List<Bethapi>?> fetchData() async {
    try {
      final uri = Uri.parse('$_kBaseUrl$_kSamplesEndPoint');

      _log.v('requesting from endpoint: $uri');
      final response =
          await http.get(uri, headers: {_kApiKeyHeader: BethLocal.bethApiKey});

      if (response.statusCode != 200) {
        throw Exception('Status code: ${response.statusCode}');
      }

      final phionaJson = convert.jsonDecode(response.body);
      final phiona = Phiona.fromJson(phionaJson);

      final bethJson = convert.jsonDecode(phiona.data?[0].body ?? '');

      List<Bethapi> output = [];
      for (var i in bethJson) {
        output.add(Bethapi.fromJson(i));
      }

      _log.v('fetched data successfully');
      return output;
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
      return null;
    }
  }
}
