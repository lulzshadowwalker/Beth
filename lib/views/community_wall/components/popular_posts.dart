part of './community_wall_components.dart';

class _PopularPosts extends StatelessWidget {
  const _PopularPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PostsController(),
      builder: (PostsController _) {
        final posts = _.posts;
        posts.sort((v1, v2) => v2.likes!.length.compareTo(v1.likes!.length));

        return _PostsGridView(posts: posts);
      },
    );
  }
}
