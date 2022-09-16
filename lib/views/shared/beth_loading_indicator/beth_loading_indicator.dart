import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BethLoadingIndicator extends StatelessWidget {
  const BethLoadingIndicator({
    Color? color,
    Key? key,
  })  : _color = color,
        super(key: key);

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: _color ?? BethColors.neutral1,
      size: 22,
    );
  }
}
