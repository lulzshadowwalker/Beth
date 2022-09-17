part of './community_wall_components.dart';

class _Feed extends StatelessWidget {
  const _Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PostsController(),
      builder: (PostsController _) {
        final posts = _.posts;
        return _PostsGridView(posts: posts);
      },
    );
  }
}
