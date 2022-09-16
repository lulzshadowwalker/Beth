part of './components/beth_scaffold_components.dart';

class BethScaffold extends StatelessWidget {
  const BethScaffold({
    required Widget body,
    Widget? bottomNavbigationBar,
    List<Widget>? actions,
    String? title,
    Key? key,
  })  : _body = body,
        _bottomNavigationBar = bottomNavbigationBar,
        _actions = actions,
        _title = title,
        super(key: key);

  final Widget _body;
  final Widget? _bottomNavigationBar;
  final List<Widget>? _actions;
  final String? _title;
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
            resizeToAvoidBottomInset: false,
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
          ),
        ),
      ),
    );
  }
}
