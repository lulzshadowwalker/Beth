import 'package:flutter/material.dart';

import '../../controllers/active_tag/active_tag_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Home.tag;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
