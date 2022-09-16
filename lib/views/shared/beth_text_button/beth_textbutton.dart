import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';

class BethTextButton extends StatelessWidget {
  const BethTextButton({
    Key? key,
    required void Function() onTap,
    required String text,
    Color? color,
    TextAlign? textAlign,
    EdgeInsets? padding,
  })  : _onTap = onTap,
        _color = color,
        _textAlign = textAlign,
        _text = text,
        _padding = padding,
        super(key: key);

  final void Function() _onTap;

  final String _text;

  final Color? _color;
  final TextAlign? _textAlign;
  final EdgeInsets? _padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      width: double.infinity,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: _onTap,
        child: Text(
          _text,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: _color ?? BethColors.accent2,
              ),
          textAlign: _textAlign,
        ),
      ),
    );
  }
}
