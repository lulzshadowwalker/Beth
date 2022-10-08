import 'package:get/get.dart';

import '../../current_user/current_user_controller.dart';
import '../../notifications/notifications_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(() => UserController(), permanent: true);

    await NotificationsController().init();
  }
}
