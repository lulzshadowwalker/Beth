import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/bookmarks/components/bookmarks_components.dart';
import '../../views/community_wall/components/community_wall_components.dart';
import '../../views/home/home.dart';

class BottomNavBarController extends GetxController {
  BottomNavBarController({
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex.obs;

  final RxInt _selectedIndex;

  final Map<Widget, DotNavigationBarItem> _items = {
    const Bookmarks(): DotNavigationBarItem(
      icon: const Icon(Icons.bookmark),
    ),
    const Home(): DotNavigationBarItem(
      icon: const Icon(Icons.home),
    ),
    const CommunityWall(): DotNavigationBarItem(
      icon: const Icon(Icons.group),
    ),
  };

  Map<Widget, DotNavigationBarItem> get items => _items;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int selectedIndex) => _selectedIndex.value = selectedIndex;
}
