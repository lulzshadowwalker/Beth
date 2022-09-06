import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Discover')),
    );
  }
}
