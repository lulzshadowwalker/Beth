part of './community_wall_components.dart';

class _PostsGridView extends StatelessWidget {
  const _PostsGridView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<BethPost> posts;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: posts.length,
      crossAxisCount: BethUtils.screenWidth >= BethConst.tabletWidth ? 3 : 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemBuilder: (context, index) => Post(postData: posts[index]),
    );
  }
}
