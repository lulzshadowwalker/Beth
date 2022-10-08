part of './components/bookmarks_components.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

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
              builder: (CurrentUserController _) => _.bookmarks.isNotEmpty
                  ? Section(sectionContent: _.bookmarks)
                  : const _EmptyState(),
            ),
          ),
        ],
      ),
    );
  }
}
