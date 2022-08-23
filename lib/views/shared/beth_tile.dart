import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BethTile extends StatelessWidget {
  const BethTile(
      {required Widget leading,
      required String title,
      VoidCallback? onTap,
      Key? key})
      : _leading = leading,
        _title = title,
        _onTap = onTap,
        super(key: key);

  final Widget _leading;
  final String _title;
  final VoidCallback? _onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Row(
        children: [
          _leading,
          const SizedBox(width: 10),
          Text(
            _title,
            style: Get.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
