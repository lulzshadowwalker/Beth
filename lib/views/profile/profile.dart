part of './components/profile_components.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const tag = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = BethHome.tag;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: GetX(
        builder: (UserController _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _.data.name ?? BethConst.nameFallBack,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  _.data.email ?? BethConst.nameFallBack,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(height: 70),
            _.posts.isNotEmpty
                ? Expanded(
                    child: MasonryGridView.count(
                      itemCount: _.posts.length,
                      crossAxisCount:
                          BethUtils.screenWidth >= BethConst.tabletWidth
                              ? 3
                              : 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Post(
                        postData: _.posts[index],
                        index: index,
                      ),
                    ),
                  )
                : Expanded(
                    child: EmptyState(
                        body:
                            Lottie.asset(BethAnimations.camera, repeat: false),
                        text: BethTranslations.addFirstPost.tr)),
          ],
        ),
      ),
    );
  }
}
