import 'package:flutter/material.dart';

import '../shared/beth_scaffold.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Discover'),
      ),
    );
  }
}
