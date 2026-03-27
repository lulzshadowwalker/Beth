

import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  String _data = '';

  String get data => _data;

  @override
  void onInit() {
    super.onInit();
    _fetch();
  }

  void _fetch() async {
    _data = await RemoteDbController().fetchAbout() ?? '';
    update();
  }
}
