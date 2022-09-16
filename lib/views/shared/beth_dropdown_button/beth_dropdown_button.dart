import 'package:flutter/material.dart';

import '../../../themes/beth_colors.dart';

class BethDropDownButton extends StatelessWidget {
  const BethDropDownButton({
    required Object value,
    Widget? icon,
    required void Function(Object?) onChanged,
    required List<DropdownMenuItem<Object>>? items,
    Key? key,
  })  : _items = items,
        _value = value,
        _icon = icon,
        _onChanged = onChanged,
        super(key: key);

  final List<DropdownMenuItem<Object>>? _items;
  final void Function(Object?) _onChanged;
  final Object _value;
  final Widget? _icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _items,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: BethColors.muted,
            overflow: TextOverflow.ellipsis,
          ),
      onChanged: _onChanged,
      value: _value,
      borderRadius: BorderRadius.circular(25),
      underline: Container(),
      alignment: AlignmentDirectional.centerEnd,
      icon: _icon,
    );
  }
}
