import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);
  static const String tag = 'bookmarks';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Bookmarks')),
    );
  }
}
