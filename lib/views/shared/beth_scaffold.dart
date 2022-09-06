import 'package:beth/controllers/drawer/beth_drawer_controller.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../drawer/components/beth_drawer_components.dart';

class BethScaffold extends StatelessWidget {
  const BethScaffold({
    required Widget body,
    Key? key,
  })  : _body = body,
        super(key: key);

  final Widget _body;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BethDrawerController(),
      builder: (BethDrawerController _) => SideMenu(
        key: _.key,
        menu: BethDrawer(),
        type: SideMenuType.slideNRotate,
        closeIcon: null,
        background: Get.theme.brightness == Brightness.dark
            ? BethColors.black
            : BethColors.white,
        child: Scaffold(
          appBar: AppBar(leading: _.icon),
          body: _body,
        ),
      ),
    );
  }
}
