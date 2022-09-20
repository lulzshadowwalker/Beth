part of '../components/landing_components.dart';

class LandingController extends GetxController {
  final Map<Widget, String> _pageData = {
    _BethArbel(): BethAnimations.historic,

    //
    BethHeaderText(
      text: BethTranslations.exploreBethWonders.tr,
      color: BethColors.lightPrimary1,
    ): BethAnimations.explore,

    //
    BethHeaderText(
      text: BethTranslations.joinTheCommunity.tr,
      color: BethColors.lightPrimary1,
    ): BethAnimations.community,

    //
    BethHeaderText(
      text: BethTranslations.accessBookmarksAnywhere.tr,
      color: BethColors.lightPrimary1,
    ): BethAnimations.bookmark,
  };

  Map<Widget, String> get pageData => _pageData;

  int get length => _pageData.length;

  final List<Color> _color = [
    Colors.orange,
    Colors.pink,
    Colors.deepPurpleAccent,
    Colors.blueAccent,
  ];

  List<Color> get colors => List.unmodifiable(_color);

  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  set activeIndex(int activeIndex) {
    _activeIndex = activeIndex;
    update();
  }
}
