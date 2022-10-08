import 'package:beth/controllers/active_tag/active_tag_controller.dart';
import 'package:beth/controllers/current_user/current_user_controller.dart';
import 'package:beth/helpers/beth_const.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/home/components/home_components.dart';
import 'package:beth/views/shared/beth_tile/beth_tile.dart';
import 'package:beth/views/shared/user_avatar/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../beth_home/components/beth_home_components.dart';
import '../../bug_report/components/bug_report_components.dart';
import '../../discover/components/discover_components.dart';
import '../../profile/components/profile_components.dart';
import '../../settings/components/settings_components.dart';
import '../components/beth_drawer_components.dart';

class BethDrawerController extends GetxController {
  bool _closed = true;

  final _sideMenuKey = GlobalKey<SideMenuState>();

  GlobalKey<SideMenuState> get key => _sideMenuKey;

  List<Widget> get section1 => List.unmodifiable(_section1);
  List<Widget> get section2 => List.unmodifiable(_section2);
  List<Widget> get section3 => List.unmodifiable(_section3);

  Widget get icon => IconButton(
        onPressed: _toggle,
        icon: FaIcon(
          _closed ? FontAwesomeIcons.barsStaggered : FontAwesomeIcons.xmark,
        ),
        padding: EdgeInsets.only(left: 32, top: _closed ? 0 : 32),
        iconSize: 26,
      );

  Widget get lightIcon => IconButton(
        onPressed: _toggle,
        icon: FaIcon(
          _closed ? FontAwesomeIcons.barsStaggered : FontAwesomeIcons.xmark,
          color: BethColors.lightPrimary1,
        ),
        padding: EdgeInsets.only(left: 32, top: _closed ? 0 : 32),
        iconSize: 26,
      );

  void _toggle() {
    final state = _sideMenuKey.currentState;

    state!.isOpened ? state.closeSideMenu() : state.openSideMenu();

    _closed = !_closed;
    update();
  }

  final List<Widget> _section1 = [
    GetX(
      init: UserController(),
      builder: (UserController _) => BethTile(
        leading: const UserAvatar(
          radius: 52,
        ),
        title: _.data.name ?? BethConst.nameFallBack,
        style: Get.textTheme.headline5?.copyWith(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          color: ActiveTagController.tag == Profile.tag
              ? BethColors.secondary2
              : BethColors.lightPrimary1,
        ),
      ),
    ),
  ];

  final List<Widget> _section2 = [
    BethDrawerTile(
      iconData: FontAwesomeIcons.houseUser,
      title: BethTranslations.home.tr,
      color: ActiveTagController.tag == BethHome.tag
          ? BethColors.secondary2
          : null,
      onTap: () => Get.to(() => const BethHome()),
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.compass,
      title: BethTranslations.discover.tr,
      color: ActiveTagController.tag == Home.tag ? BethColors.secondary2 : null,
      onTap: () => Get.to(() => const Discover()),
    ),
  ];

  final List<Widget> _section3 = [
    BethDrawerTile(
      iconData: FontAwesomeIcons.gears,
      title: BethTranslations.settings.tr,
      color: ActiveTagController.tag == Settings.tag
          ? BethColors.secondary2
          : null,
      onTap: () => Get.to(() => const Settings()),
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.bug,
      title: BethTranslations.bugReport.tr,
      color: ActiveTagController.tag == BugReport.tag
          ? BethColors.secondary2
          : null,
      onTap: () => Get.to(() => const BugReport()),
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.arrowRightFromBracket,
      title: BethTranslations.logout.tr,
      onTap: () => Get.find<AuthController>().signOut(),
    ),
  ];
}
