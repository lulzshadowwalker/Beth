part of './password_reset_components.dart';

class _PasswordResetHeader extends StatelessWidget {
  const _PasswordResetHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: <AnimatedText>[
        TypewriterAnimatedText(BethTranslations.enterYourEmailAddress.tr,
            // textAlign: TextAlign.center,
            textStyle: Get.textTheme.headline5,
            speed: const Duration(milliseconds: 100))
      ],
      totalRepeatCount: 1,
    );
  }
}
