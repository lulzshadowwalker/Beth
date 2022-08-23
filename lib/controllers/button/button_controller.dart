import 'package:get/get.dart';

class ButtonController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void onPressed(Function function) async {
    if (!_isLoading.value) {
      _isLoading.value = true;
      await function();

      _isLoading.value = false;
    }
  }
}
