import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/models/beth_user.dart';
import 'package:get/get.dart';

class CurrentUserController extends GetxController {
  final _user = BethUser.empty().obs;

  BethUser get currentUserData => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(RemoteDbController().getCurrentUserData());
  }
}
