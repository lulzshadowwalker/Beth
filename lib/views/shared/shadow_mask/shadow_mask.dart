import 'package:flutter/material.dart';

class ShadowMask extends StatelessWidget {
  const ShadowMask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(189, 0, 0, 0),
          Color.fromARGB(0, 0, 0, 0),
        ],
        stops: [0, 0.5],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
    );
  }
}
