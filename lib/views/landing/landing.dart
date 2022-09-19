part of './components/landing_components.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BethElevatedButton(
            onTap: () {
              GetStorage().write(BethConst.isFirstLaunch, false);
             Get.put(AuthController());
            },
            text: 'go to auth'),
      ),
    );
  }
}
