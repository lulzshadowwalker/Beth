part of './landing_components.dart';

class _BethArbel extends StatelessWidget {
  _BethArbel({
    Key? key,
  }) : super(key: key);

  final TextStyle? _textStyle = Get.textTheme.headline4?.copyWith(
    fontWeight: FontWeight.bold,
    color: BethColors.lightPrimary1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Text(BethTranslations.discover.tr, style: _textStyle),
              const SizedBox(width: 10),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    BethTranslations.bethArbel.tr,
                    textStyle: _textStyle,
                  ),
                  RotateAnimatedText(
                    BethTranslations.arabella.tr,
                    textStyle: _textStyle,
                  ),
                  RotateAnimatedText(
                    BethTranslations.irbid.tr,
                    textStyle: _textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        BethHeaderText(
          text: BethTranslations.beautyAndCulture.tr,
          textStyle: Get.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
