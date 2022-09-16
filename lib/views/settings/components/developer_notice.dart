part of './settings_components.dart';

class _DeveloperNotice extends StatelessWidget {
  const _DeveloperNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SettingsSection(
      sectionHeader: BethTranslations.developerNotice.tr,
      options: [
        /// attributions
        _OptionTile(title: BethTranslations.attributions.tr, onTap: () {}),

        /// bug report
        _OptionTile(
          title: BethTranslations.bugReport.tr,
          onTap: () => Get.to(() => const BugReport()),
        ),
      ],
    );
  }
}
