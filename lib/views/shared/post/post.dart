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
    final String? reactionPreview = _reactionPreview();

    return Bounceable(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: (_data?.imageUrl ?? '').isNotEmpty
            ? Stack(
                children: [
                  GetBuilder(
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
                  ),

                  /// reaction corner preview
                  if (reactionPreview != null)
                    PositionedDirectional(
                      end: 5,
                      bottom: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.35),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              offset: const Offset(0, 3),
                              blurRadius: 3,
                            )
                          ],
                        ),
                        child: _reactionsController.reactions
                            .firstWhere(
                                (value) => value.value == reactionPreview)
                            .previewIcon,
                      ),
                    )
                ],
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

  String? _reactionPreview() {
    final uid = Get.find<AuthController>().getUserId;

    for (Map e in _data!.likes!) {
      if (e['likedBy'] == uid) {
        return e['reactionType'];
      }
    }
    return null;
  }

  void _onReactionChanged(String? value) async {
    _reactionsController.selectedReaction = value;

    if (value != null) {
      await RemoteDbController().reactToPost(
        data: _data!,
        reactionType: value,
      );
    }
  }
}
