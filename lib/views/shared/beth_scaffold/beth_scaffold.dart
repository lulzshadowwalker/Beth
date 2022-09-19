part of './components/beth_scaffold_components.dart';

class BethScaffold extends StatelessWidget {
  const BethScaffold({
    required Widget body,
    Widget? bottomNavigationBar,
    Widget? persistentFooterButtons,
    List<Widget>? actions,
    String? title,
    bool resizeToAvoidBottomInset = false,
    Color? backgroundColor,
    Key? key,
  })  : _body = body,
        _bottomNavigationBar = bottomNavigationBar,
        _persistentFooterButtons = persistentFooterButtons,
        _actions = actions,
        _title = title,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _backgroundColor = backgroundColor,
        super(key: key);

  final Widget _body;
  final Widget? _bottomNavigationBar;
  final Widget? _persistentFooterButtons;
  final List<Widget>? _actions;
  final String? _title;
  final bool _resizeToAvoidBottomInset;
  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BethDrawerController(),
      tag: const Uuid().v4(),
      builder: (BethDrawerController _) => Directionality(
        textDirection: TextDirection.ltr,
        child: SideMenu(
          key: _.key,
          menu: const BethDrawer(),
          type: SideMenuType.slideNRotate,
          closeIcon: null,
          background: BethColors.secondary1,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
            backgroundColor: _backgroundColor,
            appBar: _BethAppBar(
              actions: _actions,
              leading: _.icon,
              title: _title,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Directionality(
                      textDirection: Directionality.of(context), child: _body),
                ),
              ],
            ),
            bottomNavigationBar: _bottomNavigationBar,
            persistentFooterButtons: _persistentFooterButtons != null
                ? [
                    BottomNavBarConstrainedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 45.0
                        ),
                        child: _persistentFooterButtons,
                      ),
                    )
                  ]
                : null,
          ),
        ),
      ),
    );
  }
}
