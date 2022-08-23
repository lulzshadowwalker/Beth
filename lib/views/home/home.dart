import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Show Toast'),
          onPressed: () => MotionToast.delete(
            title: const Text("Warning Motion Toast"),
            description: const Text("This is a Warning"),
            enableAnimation: false,
            toastDuration: const Duration(seconds: 3),
          ).show(Get.context!),
        ),
      ),
    );
  }
}
