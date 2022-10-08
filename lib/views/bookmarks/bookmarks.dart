part of './components/bookmarks_components.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = BethHome.tag;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 75),
      child: Column(
        children: [
          BethAnimatedHeader(text: BethTranslations.cBookmarks.tr),
          const SizedBox(height: 50),
          Expanded(
            child: GetX(
              builder: (UserController _) => _.bookmarks.isNotEmpty
                  ? DiscoverSection(sectionContent: _.bookmarks)
                  : EmptyState(
                      body: Lottie.asset(BethAnimations.emptyBox),
                      text: BethTranslations.haventAddedItems.tr,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
