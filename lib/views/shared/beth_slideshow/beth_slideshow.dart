import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BethSlideShow extends StatelessWidget {
  const BethSlideShow({
    required List<Widget> pages,
    double width = double.infinity,
    double height = double.infinity,
    Key? key,
  })  : _pages = pages,
        _width = width,
        _height = height,
        super(key: key);

  final List<Widget> _pages;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: _width,
      height: _height,
      indicatorColor: BethColors.accent1,
      isLoop: true,
      autoPlayInterval: 2000,
      children: _pages,
    );
  }
}
