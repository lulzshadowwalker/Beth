import 'package:flutter/material.dart';

import '../../controllers/active_tag/active_tag_controller.dart';
import '../shared/beth_scaffold/components/beth_scaffold_components.dart';

class CommunityWall extends StatefulWidget {
  const CommunityWall({Key? key}) : super(key: key);
  static const String tag = 'bookmarks';

  @override
  State<CommunityWall> createState() => _CommunityWallState();
}

class _CommunityWallState extends State<CommunityWall> {

    @override
  void initState() {
    super.initState();
    ActiveTagController.tag = CommunityWall.tag;
  }

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Community Wall'),
      ),
    );
  }
}
