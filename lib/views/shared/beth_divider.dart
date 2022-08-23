import 'package:flutter/material.dart';

class BethDivider extends StatelessWidget {
  const BethDivider({
    required Widget child,
    Key? key,
  })  : _child = child,
        super(key: key);

  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // one padding ([height]) is sufficient
        const Expanded(child: Divider(height: 65)),
        _child,
        const Expanded(child: Divider()),
      ],
    );
  }
}
