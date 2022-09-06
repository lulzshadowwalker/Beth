part of './beth_drawer_components.dart';

class BethDrawerTile extends StatelessWidget {
  const BethDrawerTile({
    Key? key,
    required IconData iconData,
    required String title,
    required VoidCallback onTap,
    Color? color,
  })  : _iconData = iconData,
        _title = title,
        _onTap = onTap,
        _color = color,
        super(key: key);

  final IconData _iconData;
  final String _title;
  final VoidCallback _onTap;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: BethTile(
        leading: FaIcon(_iconData, size: 28, color: _color),
        title: _title,
        style: Get.textTheme.headline6?.copyWith(color: _color),
        onTap: _onTap,
      ),
    );
  }
}
