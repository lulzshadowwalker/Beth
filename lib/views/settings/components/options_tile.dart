part of './settings_components.dart';

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    Widget? trailing,
    required String title,
    String? value,
    VoidCallback? onTap,
    Key? key,
  })  : _trailing = trailing,
        _title = title,
        _value = value,
        _onTap = onTap,
        super(key: key);

  final Widget? _trailing;
  final String _title;
  final String? _value;
  final VoidCallback? _onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(children: [
          Text(_title, style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(width: 30),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Text(
              _value ?? '',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: BethColors.muted, overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 10),
          _trailing ??
              FaIcon(
                BethUtils.isLtr
                    ? FontAwesomeIcons.angleRight
                    : FontAwesomeIcons.angleLeft,
                size: 14,
              )
        ]),
      ),
    );
  }
}
