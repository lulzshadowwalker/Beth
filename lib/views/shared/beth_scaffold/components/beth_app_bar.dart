part of './beth_scaffold_components.dart';

class _BethAppBar extends StatelessWidget with PreferredSizeWidget {
  const _BethAppBar(
      {Key? key, List<Widget>? actions, Widget? leading, String? title})
      : _actions = actions,
        _leading = leading,
        _title = title,
        super(key: key);

  final List<Widget>? _actions;
  final Widget? _leading;
  final String? _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: _leading,
        actions: _actions,
        title: Text(
          _title ?? '',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
