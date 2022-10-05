import 'package:get/get.dart';

class LoadingController extends GetxController {
  LoadingController({bool isLoading = true}) : _isLoading = isLoading;
  
  bool _isLoading;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }
}
