import 'package:beth/views/shared/beth_scaffold.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const tag = 'home';

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
