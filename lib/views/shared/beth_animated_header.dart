import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BethAnimatedHeader extends StatelessWidget {
  const BethAnimatedHeader({
    required String text,
    TextStyle? textStyle,
    Key? key,
  })  : _text = text,
        _textStyle = textStyle,
        super(key: key);

  final String _text;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: <AnimatedText>[
        TypewriterAnimatedText(
          _text,
          textStyle: _textStyle ?? Get.textTheme.headline3,
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
    );
  }
}
