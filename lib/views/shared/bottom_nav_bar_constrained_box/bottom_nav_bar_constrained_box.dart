import 'package:flutter/material.dart';

class BottomNavBarConstrainedBox extends StatelessWidget {
  const BottomNavBarConstrainedBox({
    required Widget child,
    Key? key,
  })  : _child = child,
        super(key: key);

  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 150,
          maxWidth: 550,
        ),
        child: _child,
      ),
    );
  }
}
