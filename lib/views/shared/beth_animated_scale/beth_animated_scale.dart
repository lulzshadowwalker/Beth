import 'package:flutter/material.dart';

class BethAnimatedScale extends StatelessWidget {
  const BethAnimatedScale({
    required int index,
    required double scale,
    required Widget child,
    Key? key,
  })  : _index = index,
        _scale = scale,
        _child = child,
        super(key: key);

  final double _scale;
  final Widget _child;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      curve: Curves.easeInCubic,
      duration: Duration(milliseconds: 150 * _index + 400),
      child: _child,
    );
  }
}
