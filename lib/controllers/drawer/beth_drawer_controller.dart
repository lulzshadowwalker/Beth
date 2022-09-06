import 'package:beth/controllers/current_user/current_user_controller.dart';
import 'package:beth/helpers/beth_images.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/bookmarks/bookmarks.dart';
import 'package:beth/views/discover/discover.dart';
import 'package:beth/views/home/home.dart';
import 'package:beth/views/profile/profile.dart';
import 'package:beth/views/settings/settings.dart';
import 'package:beth/views/shared/beth_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../views/drawer/components/beth_drawer_components.dart';
import '../auth/auth_controller.dart';

class BethDrawerController extends GetxController {
  bool _closed = true;

  final _sideMenuKey = GlobalKey<SideMenuState>();

  GlobalKey<SideMenuState> get key => _sideMenuKey;

  List<Widget> get section1 => List.unmodifiable(_section1);
  List<Widget> get section2 => List.unmodifiable(_section2);
  List<Widget> get section3 => List.unmodifiable(_section3);

  static String _activeTag = 'home';

  Widget get icon => IconButton(
        onPressed: _toggle,
        icon: FaIcon(_closed ? FontAwesomeIcons.bars : FontAwesomeIcons.xmark),
        padding: const EdgeInsets.all(32),
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
      init: CurrentUserController(),
      builder: (CurrentUserController _) => BethTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(_.currentUserData.profilePicture ??
                BethImages.unknownProfilePicture),
          ),
          title: _.currentUserData.name ?? '..',
          style:
              Get.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.user,
      title: 'Profile',
      color: _activeTag == Profile.tag ? BethColors.accent1 : null,
      onTap: () {
        _activeTag = Profile.tag;
        Get.to(const Profile());
      },
    ),
  ];

  final List<Widget> _section2 = [
    BethDrawerTile(
      iconData: FontAwesomeIcons.house,
      title: 'home',
      color: _activeTag == Home.tag ? BethColors.accent1 : null,
      onTap: () {
        _activeTag = Home.tag;
        Get.to(() => const Home());
      },
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.compass,
      title: 'discover',
      color: _activeTag == Discover.tag ? BethColors.accent1 : null,
      onTap: () {
        _activeTag = Discover.tag;
        Get.to(() => const Discover());
      },
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.bookmark,
      title: 'bookmarks',
      color: _activeTag == Bookmarks.tag ? BethColors.accent1 : null,
      onTap: () {
        _activeTag = Bookmarks.tag;
        Get.to(() => const Bookmarks());
      },
    ),
  ];

  final List<Widget> _section3 = [
    BethDrawerTile(
      iconData: FontAwesomeIcons.gear,
      title: 'settings',
      onTap: () {
        _activeTag = Settings.tag;
        Get.to(() => const Settings());
      },
    ),
    BethDrawerTile(
      iconData: FontAwesomeIcons.arrowRightFromBracket,
      title: 'logout',
      onTap: () {
        Get.find<AuthController>().signOut();
      },
    ),
  ];
}
