import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/add_post.dart/add_post.dart';
import '../../views/bookmarks/bookmarks.dart';
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
    const AddPost(): DotNavigationBarItem(
      icon: const Icon(Icons.add_box_rounded),
    ),
  };

  Map<Widget, DotNavigationBarItem> get items => _items;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int selectedIndex) => _selectedIndex.value = selectedIndex;
}
