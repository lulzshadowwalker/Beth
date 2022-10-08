import 'package:beth/views/discover/components/discover_components.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/bookmarks/components/bookmarks_components.dart';
import '../../views/community_wall/components/community_wall_components.dart';
import '../../views/home/components/home_components.dart';
import '../../views/profile/components/profile_components.dart';

class BottomNavBarController extends GetxController {
  BottomNavBarController({
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex.obs;

  final RxInt _selectedIndex;

  final Map<Widget, DotNavigationBarItem> _items = {
    const Bookmarks(): DotNavigationBarItem(
      icon: const Icon(Icons.bookmark),
    ),
    const CommunityWall(): DotNavigationBarItem(
      icon: const Icon(Icons.group),
    ),
    const Profile(): DotNavigationBarItem(
      icon: const Icon(Icons.account_circle_rounded),
    ),
  };

  Map<Widget, DotNavigationBarItem> get items => _items;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int selectedIndex) => _selectedIndex.value = selectedIndex;
}
