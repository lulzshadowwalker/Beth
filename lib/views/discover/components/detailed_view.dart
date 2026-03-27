part of './discover_components.dart';

class _DetailedView extends StatelessWidget {
  const _DetailedView({
    required EntryContent entryContent,
    Key? key,
  })  : _entryContent = entryContent,
        super(key: key);

  final EntryContent _entryContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _entryContent.geoLocation?.latitude != null
          ? LaunchMapButton(
              location: _entryContent.geoLocation!,
              locationTitle:
                  _entryContent.title ?? BethTranslations.discover.tr,
            )
          : null,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: BethColors.lightPrimary1,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: BethColors.secondary1Dimmed,
        foregroundColor: BethColors.lightPrimary1,
        actions: [
          GetX(
            builder: (UserController _) {
              bool isBookmarked = _.bookmarks.firstWhereOrNull(
                          (e) => e.title == _entryContent.title) !=
                      null
                  ? true
                  : false;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Bounceable(
                  onTap: () async {
                    isBookmarked
                        ? await RemoteDbController()
                            .removeBookmark(_entryContent)
                        : await RemoteDbController().addBookmark(_entryContent);
                  },
                  child: Icon(
                    isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border_rounded,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Hero(
          tag: _entryContent.title ?? const Uuid().v4(),
          child: Column(
            children: [
              /// header image
              ClipPath(
                clipper: _HeaderCustomClipper(),
                child: SizedBox(
                  height: Get.height * 0.35,
                  width: double.infinity,
                  child: BethSlideShow(
                    pages: List.generate(
                      _entryContent.headerImages!.length,
                      (index) => CachedNetworkImage(
                        imageUrl: _entryContent.headerImages?[index] ??
                            BethImages.travel,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ),
                ),
              ),

              /// body
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                child: Column(
                  children: [
                    /// title
                    BethAnimatedHeader(text: _entryContent.title!),
                    const SizedBox(height: 30),

                    /// links
                    ...List.generate(
                      _entryContent.links?.length ?? 0,
                      (index) {
                        BethLink linkData = _entryContent.links![index];
                        return _LinkCard(
                          text: linkData.linkName!,
                          link: linkData.url!,
                        );
                      },
                    )
                  ],
                ),
              ),

              /// markdown
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: BethMarkdownBody(data: _entryContent.markdown!)),

              SizedBox(height: Get.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
