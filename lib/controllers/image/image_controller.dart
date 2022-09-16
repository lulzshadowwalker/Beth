import 'package:get/get.dart';

import 'dart:typed_data';

class ImageController extends GetxController {
  Uint8List? _image;

  Uint8List? get getImage => _image;

  set setImage(Uint8List? image) {
    _image = image;

    update();
  }

  void clear() {
    _image = null;
    update();
  }
}
