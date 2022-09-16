part of './upload_avatar_components.dart';

class _Name extends StatelessWidget {
  const _Name({
    required String text,
    Key? key,
  })  : _text = text,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        shadows: [
          const Shadow(
            blurRadius: 7.0,
            color: BethColors.white,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
