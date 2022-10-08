import 'package:beth/controllers/auth/auth_controller.dart';
import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/notifications/notifications_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(AuthController(), permanent: true);
    Get.put(CredentialsController());

    await NotificationsController().init();
  } 
}
