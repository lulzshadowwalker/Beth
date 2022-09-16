part of './bug_report_components.dart';

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ImageController _) => _.getImage == null
          ? FaIcon(
              FontAwesomeIcons.fileImage,
              color: BethColors.accent2,
            )
          : PhysicalModel(
              color: Colors.black,
              shadowColor: Colors.black,
              elevation: 8,
              child: Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: DecorationImage(
                    image: MemoryImage(_.getImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }
}
