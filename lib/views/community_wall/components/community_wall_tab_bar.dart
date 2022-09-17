part of './community_wall_components.dart';

class _CommunityWallTabBar extends StatelessWidget {
  const _CommunityWallTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Directionality.of(context) == TextDirection.ltr
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        labelStyle: Theme.of(context).textTheme.headline6,
        labelColor: BethColors.secondary2,
        labelPadding: const EdgeInsets.only(right: 50, bottom: 8),
        unselectedLabelColor: BethColors.neutral1,
        padding: const EdgeInsets.only(bottom: 30),
        indicator:
            BethCircleTabIndicator(color: BethColors.secondary2, radius: 5),
        controller: tabController,
        isScrollable: true,
        tabs: [
          Text(BethTranslations.popular.tr),
          Text(BethTranslations.feed.tr),
        ],
      ),
    );
  }
}
