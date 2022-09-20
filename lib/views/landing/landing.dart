part of './components/landing_components.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LandingController(),
        builder: (LandingController _) => LiquidSwipe(
          enableLoop: false,
          ignoreUserGestureWhileAnimating: true,
          enableSideReveal: true,
          slideIconWidget: _.activeIndex != _.length - 1
              ? RotatedBox(
                  quarterTurns: 1,
                  child: Lottie.asset(
                    BethAnimations.bottomArrow,
                    width: 64,
                    height: 64,
                  ),
                )
              : null,
          onPageChangeCallback: ((activePageIndex) =>
              _.activeIndex = activePageIndex),
          pages: List.generate(
            _.length,
            (i) => _LandingPage(
              animationAsset: _.pageData.values.elementAt(i),
              color: _.colors[i],
              isLast: i == _.length - 1,
              child: _.pageData.keys.elementAt(i),
            ),
          ),
        ),
      ),
    );
  }
}
