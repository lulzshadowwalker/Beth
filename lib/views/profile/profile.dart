import 'package:flutter/material.dart';

import '../../controllers/active_tag/active_tag_controller.dart';
import '../shared/beth_scaffold/components/beth_scaffold_components.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const  tag = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Profile.tag;
  }

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
