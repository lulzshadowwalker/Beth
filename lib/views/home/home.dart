import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/controllers/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              await NotificationsController().show(
                id: 1,
                title: 'title',
                body: 'body',
              );
            },
            child: const Text('show scheduled notification')),
      ),
    );
  }
}
