import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
    return Align(
      alignment: Directionality.of(context) == TextDirection.ltr
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: AnimatedTextKit(
        animatedTexts: <AnimatedText>[
          TypewriterAnimatedText(
            _text,
            textStyle: _textStyle ??
                Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
      ),
    );
  }
}
