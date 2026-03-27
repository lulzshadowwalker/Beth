import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required Widget body,
    required String text,
    Key? key,
  })  : _body = body,
        _text = text,
        super(key: key);

  final Widget _body;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _body,
        const SizedBox(height: 50),
        AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            FlickerAnimatedText(
              _text,
              speed: const Duration(milliseconds: 3000),
              textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w600,
                color: BethColors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: BethColors.neutral1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        const Spacer()
      ],
    );
  }
}
