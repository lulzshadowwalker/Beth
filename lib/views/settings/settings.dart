import 'package:flutter/material.dart';

import '../shared/beth_scaffold.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  static const String tag = 'settings';

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
