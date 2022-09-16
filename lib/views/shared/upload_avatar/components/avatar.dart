part of './upload_avatar_components.dart';

class _Avatar extends StatelessWidget {
  const _Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ImageController(),
      builder: (ImageController _) {
        return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BethColors.primary2,
            ),
            width: 128,
            height: 128,
            child: _.getImage == null
                ? GetX(
                    init: CounterController(
                        maxValue: BethImages.doodleAvatar.length - 1),
                    builder: (CounterController _) => SvgPicture.asset(
                      BethImages.doodleAvatar[_.count],
                      alignment: Alignment.topCenter,
                      // width: 64,
                    ),
                  )
                : Image.memory(_.getImage!, fit: BoxFit.cover));
      },
    );
  }
}
