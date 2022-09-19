part of './components/post_components.dart';

class Post extends StatelessWidget {
  Post({
    required BethPost? postData,
    required int index,
    Key? key,
  })  : _data = postData,
        _index = index,
        super(key: key);

  final BethPost? _data;
  static final _controllerTag = const Uuid().v4();
  final _reactionsController =
      Get.put(ReactionsController(), tag: _controllerTag);
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: (_data?.imageUrl ?? '').isNotEmpty
            ? GetBuilder(
                init: ScaleController(),
                tag: const Uuid().v4(),
                builder: (ScaleController scaleController) => GetBuilder(
                  tag: _controllerTag,
                  builder: (ReactionsController reactionController) =>
                      BethAnimatedScale(
                    scale: scaleController.scale,
                    index: _index,
                    child: ReactionContainer(
                      boxColor: BethColors.primary.withOpacity(0.5),
                      onReactionChanged: _onReactionChanged,
                      reactions: ReactionsController().reactions,
                      child: CachedNetworkImage(imageUrl: _data!.imageUrl!),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                height: 220,
                child: Lottie.asset(
                  BethAnimations.notFound,
                ),
              ),
      ),
    );
  }

  void _onReactionChanged(String? value) async {
    _reactionsController.selectedReaction = value;

    if (value != null) {
      final uid = Get.find<AuthController>().getUserId;

      /// prevent the user from reacting to the same post more than once
      for (Map e in _data!.likes!) {
        if (e['likedBy'] == uid) return;
      }

      await RemoteDbController().likePost(_data!.postId!, value);
    }
  }
}
