part of './discover_components.dart';

class _BethTab extends StatelessWidget {
  const _BethTab({
    required String text,
    Key? key,
  })  : _text = text,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }
}
