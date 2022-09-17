part of 'beth_home_components.dart';

class _BethBottomNavigationBar extends StatelessWidget {
  const _BethBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (BottomNavBarController _) => BottomNavBarConstrainedBox(
        child: DotNavigationBar(
          currentIndex: _.selectedIndex,
          onTap: (index) => _.selectedIndex = index,
          dotIndicatorColor: BethColors.accent1,
          unselectedItemColor: BethColors.lightPrimary1,
          selectedItemColor: BethColors.secondary2,
          backgroundColor: BethColors.secondary1,
          enablePaddingAnimation: true,
          marginR: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          paddingR: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          items: <DotNavigationBarItem>[..._.items.values.toList()],
        ),
      ),
    );
  }
}
