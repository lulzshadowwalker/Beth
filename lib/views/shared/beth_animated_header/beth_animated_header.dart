import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:flutter/material.dart';

class BethAnimatedHeader extends StatelessWidget {
  const BethAnimatedHeader({
    required String text,
    TextStyle? textStyle,
    Color? color,
    Key? key,
  })  : _text = text,
        _textStyle = textStyle,
        _color = color,
        super(key: key);

  final String _text;
  final TextStyle? _textStyle;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: BethUtils.isLtr ? Alignment.centerLeft : Alignment.centerRight,
      child: AnimatedTextKit(
        animatedTexts: <AnimatedText>[
          TypewriterAnimatedText(
            _text,
            textStyle: _textStyle ??
                Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _color,
                    ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
      ),
    );
  }
}
