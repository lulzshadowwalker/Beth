part of './components/community_wall_components.dart';

class CommunityWall extends StatefulWidget {
  const CommunityWall({Key? key}) : super(key: key);
  static const String tag = 'bookmarks';

  @override
  State<CommunityWall> createState() => _CommunityWallState();
}

class _CommunityWallState extends State<CommunityWall>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = CommunityWall.tag;
  }

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      floatingActionButton: const _AddPostFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Column(
          children: [
            BethAnimatedHeader(text: BethTranslations.communityWall.tr),
            const SizedBox(height: 100),

            /// tabbar
            _CommunityWallTabBar(tabController: tabController),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: const [_PopularPosts(), _Feed()]),
            )
          ],
        ),
      ),
    );
  }
}
