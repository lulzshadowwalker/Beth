import 'package:beth/controllers/button/button_controller.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/shared/beth_loading_indicator/beth_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class BethElevatedButton extends StatelessWidget {
  const BethElevatedButton({
    Key? key,
    required void Function() onTap,
    Color? color,
    required String text,
    bool borderless = true,
    Widget? leading,
  })  : _onTap = onTap,
        _color = color,
        _text = text,
        _borderless = borderless,
        _leading = leading,
        super(key: key);

  final void Function() _onTap;
  final Color? _color;
  final String _text;
  final bool _borderless;
  final Widget? _leading;
  static const double _borderRadius = 50;

  static double get borderRadius => _borderRadius;
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ButtonController(),
      tag: const Uuid().v4(),
      builder: (ButtonController _) => Bounceable(
          onTap: () => _.onPressed(_onTap),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _color ?? BethColors.accent2,
              border: Border.fromBorderSide(
                  _borderless ? BorderSide.none : const BorderSide(width: 1)),
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: _.isLoading
                ? const BethLoadingIndicator(color: BethColors.black)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.ltr,
                    children: [
                      if (_leading != null)
                        Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: _leading),
                      Text(
                        _text,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: BethColors.black),
                      )
                    ],
                  ),
          )),
    );
  }
}
