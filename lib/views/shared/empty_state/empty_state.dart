
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required Widget body,
    required String text,
    Key? key,
  }) : 
  _body = body,
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
        Text(
          _text,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}

