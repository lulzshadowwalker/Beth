part of './settings_components.dart';

class _SettingsSection extends StatelessWidget {
  const _SettingsSection(
      {required String sectionHeader,
      required List<_OptionTile> options,
      Key? key})
      : _sectionHeader = sectionHeader,
        _options = options,
        super(key: key);

  final String _sectionHeader;
  final List<_OptionTile> _options;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _sectionHeader,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: BethTheme.isLight
                      ? BethColors.secondary1
                      : BethColors.secondary2,
                ),
          ),
          const SizedBox(height: 5),
          ..._options,
        ],
      ),
    );
  }
}
