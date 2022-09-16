import 'package:flutter/material.dart';

class BethTile extends StatelessWidget {
  const BethTile({
    required Widget leading,
    required String title,
    VoidCallback? onTap,
    TextStyle? style,
    Key? key,
  })  : _leading = leading,
        _title = title,
        _onTap = onTap,
        _style = style,
        super(key: key);

  final Widget _leading;
  final String _title;
  final VoidCallback? _onTap;
  final TextStyle? _style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        children: [
          _leading,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: _style ?? Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
