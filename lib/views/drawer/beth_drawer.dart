part of './components/beth_drawer_components.dart';

class BethDrawer extends StatelessWidget {
  const BethDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Center(
        child: Column(children: [
          const Spacer(),
          ...BethDrawerController().section1,
          const SizedBox(height: 45),
          ...BethDrawerController().section2,
          const Spacer(flex: 4),
          ...BethDrawerController().section3,
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
