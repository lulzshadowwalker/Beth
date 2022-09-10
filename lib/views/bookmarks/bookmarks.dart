import 'package:flutter/material.dart';

import '../shared/beth_scaffold.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);
  static const String tag = 'bookmarks';

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Bookmarks'),
      ),
    );
  }
}
