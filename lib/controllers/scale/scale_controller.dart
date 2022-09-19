import 'dart:async';

import 'package:get/get.dart';

class ScaleController extends GetxController {
  double _scale = 0.5;

  double get scale => _scale;

  void _scaleUp() {
    _scale = 1;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(milliseconds: 50), () => _scaleUp());
  }
}
