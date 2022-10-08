part of './bookmarks_components.dart';

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(BethAnimations.emptyBox),
        const SizedBox(height: 50),
        Text(
          BethTranslations.haventAddedItems.tr,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}
