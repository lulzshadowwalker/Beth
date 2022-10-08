part of './community_wall_components.dart';

class _PostsGridView extends StatelessWidget {
  const _PostsGridView({
    Key? key,
    required this.posts,
    int? itemCount,
  })  : _itemCount = itemCount,
        super(key: key);

  final List<BethPost> posts;
  final int? _itemCount;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: _itemCount ?? posts.length,
      crossAxisCount: BethUtils.screenWidth >= BethConst.tabletWidth ? 3 : 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Post(
        postData: posts.isNotEmpty ? posts[index] : null,
        index: index,
      ),
    );
  }
}
