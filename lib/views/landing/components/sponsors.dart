part of './landing_components.dart';

class _Sponsors extends StatelessWidget {
  const _Sponsors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          BethImages.sponsors,
          width: Get.width * 0.3,
        ),
      ),
    );
  }
}
