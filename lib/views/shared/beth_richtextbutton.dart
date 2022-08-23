import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/beth_colors.dart';

class BethRichTextButton extends StatelessWidget {
  const BethRichTextButton({
    Key? key,
    required String textCTA,
    required String text,
    required void Function() onTap,
    Color? color,
  })  : _text = text,
        _textCTA = textCTA,
        _color = color,
        _onTap = onTap,
        super(key: key);
  final String _text;
  final String _textCTA;
  final Color? _color;
  final void Function() _onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 35),
      child: RichText(
        text: TextSpan(style: Get.textTheme.caption, children: <TextSpan>[
          TextSpan(text: _text),
          TextSpan(
            text: ' $_textCTA',
            style: Get.textTheme.caption
                ?.copyWith(color: _color ?? BethColors.accent2),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          ),
        ]),
      ),
    );
  }
}
