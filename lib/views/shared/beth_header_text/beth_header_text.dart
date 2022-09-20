import 'package:flutter/material.dart';

class BethHeaderText extends StatelessWidget {
  const BethHeaderText({
    required String text,
    TextStyle? textStyle,
    TextAlign? textAlign,
    Color? color,
    Key? key,
  })  : _text = text,
        _textStyle = textStyle,
        _textAlign = textAlign,
        _color = color,
        super(key: key);

  final String _text;
  final TextStyle? _textStyle;
  final TextAlign? _textAlign;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign ?? TextAlign.start,
      style: _textStyle ??
          Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                color: _color,
              ),
    );
  }
}
