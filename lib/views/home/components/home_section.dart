part of './home_components.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    required String title,
    required Widget body,
    Key? key,
  })  : _title = title,
        _body = body,
        super(key: key);

  final String _title;
  final Widget _body;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _body,
      ],
    );
  }
}
