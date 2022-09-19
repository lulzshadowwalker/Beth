part of './components/beth_home_components.dart';

class BethHome extends StatefulWidget {
  /// represents the appbar and navbar for the "home" view of the app
  /// ..
  /// navbar holds the [BethHome], [Bookmarks] and [AddPost] views.
  /// note that [BethHome] and [BethHome] are not the same.
  const BethHome({Key? key}) : super(key: key);
  static const String tag = 'home';

  @override
  State<BethHome> createState() => _BethHomeState();
}

class _BethHomeState extends State<BethHome> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = BethHome.tag;
    Get.put(BottomNavBarController(selectedIndex: 2));
  }

  @override
  Widget build(BuildContext context) {
    return BethScaffold(
        bottomNavigationBar: const _BethBottomNavigationBar(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 32.0),
            child: UserAvatar(),
          ),
        ],
        body: GetX(
          builder: (BottomNavBarController _) =>
              _.items.keys.elementAt(_.selectedIndex),
        ));
  }
}
