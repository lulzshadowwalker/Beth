part of './components/community_wall_components.dart';

class CommunityWall extends StatefulWidget {
  const CommunityWall({Key? key}) : super(key: key);
  static const String tag = 'CommunityWall';

  @override
  State<CommunityWall> createState() => _CommunityWallState();
}

class _CommunityWallState extends State<CommunityWall> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = CommunityWall.tag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _AddPostFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Column(
          children: [
            BethAnimatedHeader(text: BethTranslations.communityWall.tr),
            const SizedBox(height: 100),
            const Expanded(child: _Feed())
          ],
        ),
      ),
    );
  }
}
