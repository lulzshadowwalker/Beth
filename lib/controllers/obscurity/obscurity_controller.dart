import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ObscurityController extends GetxController {
  FaIcon _icon = const FaIcon(FontAwesomeIcons.eye);
  bool _isObscure = true;

  FaIcon get icon => _icon;
  bool get isObscure => _isObscure;

  void flip() {
    _isObscure = !_isObscure;

    _icon = _isObscure
        ? const FaIcon(FontAwesomeIcons.eye)
        : const FaIcon(FontAwesomeIcons.eyeSlash);

    update();
  }
}
