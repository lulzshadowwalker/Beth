import 'package:flutter/material.dart';

import '../shared/beth_scaffold.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const tag = 'profile';

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
