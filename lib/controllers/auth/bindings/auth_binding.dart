import 'package:beth/controllers/auth/auth_controller.dart';
import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(CredentialsController());
  }
}
