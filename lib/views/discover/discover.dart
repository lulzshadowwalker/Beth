import 'package:flutter/material.dart';

import '../../controllers/active_tag/active_tag_controller.dart';
import '../shared/beth_scaffold/components/beth_scaffold_components.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Discover.tag;
  }

  @override
  Widget build(BuildContext context) {
    return const BethScaffold(
      body: Center(
        child: Text('Discover'),
      ),
    );
  }
}
