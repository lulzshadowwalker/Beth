part of 'single_field_components.dart';

class _SingleFieldHeader extends StatelessWidget {
  const _SingleFieldHeader({
    required String title,
    Key? key,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: <AnimatedText>[
        TypewriterAnimatedText(
          _title,
          textStyle: Theme.of(context).textTheme.headline5,
          speed: const Duration(milliseconds: 100),
        )
      ],
      totalRepeatCount: 1,
    );
  }
}
