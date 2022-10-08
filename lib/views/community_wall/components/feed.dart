part of 'community_wall_components.dart';

class Feed extends StatelessWidget {
  const Feed({
    Key? key,
    int? itemCount,
  })  : _itemCount = itemCount,
        super(key: key);

  final int? _itemCount;

  @override
  Widget build(BuildContext context) {
    // not listening the posts stream in the [_PostsGridView] if I were to implement
    //  different feeds with different sorting e.g. 'popular', 'recent', or etc...
    return GetX(
      init: PostsController(),
      builder: (PostsController _) {
        final posts = _.posts;
        return _PostsGridView(
          posts: posts,
          itemCount: _itemCount,
        );
      },
    );
  }
}
