part of './settings_components.dart';

class _AppSettings extends StatelessWidget {
  const _AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SettingsSection(
      sectionHeader: BethTranslations.appSettings.tr,
      options: [
        /// language
        _OptionTile(
            title: BethTranslations.language.tr,
            trailing: GetBuilder(
              init: LanguageOptionsController(),
              builder: (LanguageOptionsController _) => BethDropDownButton(
                value: _.value,
                onChanged: (value) {
                  _.value = value as String;
                },
                items: _.dropdownMenuItems,
                icon: _.icon,
              ),
            )),

        ///  theme
        _OptionTile(
          title: BethTranslations.theme.tr,
          trailing: GetBuilder(
              init: ThemeModeController(),
              builder: (ThemeModeController _) => BethDropDownButton(
                    value: _.value,
                    onChanged: (value) {
                      _.value = value as String;
                    },
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                          value: BethConst.systemDefault,
                          child: Text(BethConst.systemDefault.tr)),
                      DropdownMenuItem(
                          value: BethConst.light,
                          child: Text(BethConst.light.tr)),
                      DropdownMenuItem(
                          value: BethConst.dark,
                          child: Text(BethConst.dark.tr)),
                    ],
                    icon: _.icon,
                  )),
        )
      ],
    );
  }
}