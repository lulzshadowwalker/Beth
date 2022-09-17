part of './components/settings_components.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const String tag = 'settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Settings.tag;
  }


  @override
  Widget build(BuildContext context) {
    return BethScaffold(
      title: BethTranslations.settings.tr,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
        child: BethConstrainedBox(
          child: Center(
            child: Column(children: [
              const _UserTile(),
              ..._sections,
            ]),
          ),
        ),
      ),
    );
  }

  final List _sections = [
    const _AccountSettings(),
    const _AppSettings(),
    const _DeveloperNotice(),
  ];
}
