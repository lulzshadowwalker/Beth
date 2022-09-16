part of 'beth_home_components.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (BottomNavBarController _) => DotNavigationBar(
        currentIndex: _.selectedIndex,
        onTap: (index) => _.selectedIndex = index,
        dotIndicatorColor: BethColors.accent1,
        unselectedItemColor: BethColors.lightPrimary1,
        selectedItemColor: BethColors.secondary2,
        backgroundColor: BethColors.secondary1,
        enablePaddingAnimation: true,
        marginR: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
        paddingR:
            const EdgeInsets.only(bottom: 10, top: 10, right: 25, left: 25),
        items: <DotNavigationBarItem>[..._.items.values.toList()],
      ),
    );
  }
}
