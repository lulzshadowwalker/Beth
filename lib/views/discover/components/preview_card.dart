part of './discover_components.dart';

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({
    required int index,
    required EntryContent entryContent,
    Key? key,
  })  : _index = index,
        _entryContent = entryContent,
        super(key: key);

  final int _index;
  final EntryContent _entryContent;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ScaleController(),
      tag: const Uuid().v4(),
      builder: (ScaleController _) => BethAnimatedScale(
        scale: _.scale,
        index: _index,
        child: Bounceable(
          onTap: () => Get.to(_DetailedView(entryContent: _entryContent)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 25, 30),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    /// TODO add Hero
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: BethColors.lightPrimary1,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            _entryContent.previewImage ?? BethImages.travel,
                          ),
                        ),
                      ),
                    ),
                    const ShadowMask(),
                    Positioned(
                      right: 25,
                      left: 25,
                      bottom: 45,
                      child: Text(
                        _entryContent.title ?? BethTranslations.discover.tr,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: BethColors.lightPrimary1,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
