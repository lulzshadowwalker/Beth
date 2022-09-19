part of './discover_components.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// header
          BethAnimatedHeader(
            text: BethTranslations.discover.tr.capitalizeFirst!,
            color: BethColors.lightPrimary1,
          ),

          /// subtitle
          Text(
            BethTranslations.bethWonders.tr,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: BethColors.lightPrimary1,
                ),
          ),
        ],
      ),
    );
  }
}
