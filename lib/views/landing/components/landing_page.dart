part of './landing_components.dart';

class _LandingPage extends StatelessWidget {
  const _LandingPage({
    required String animationAsset,
    required Widget child,
    required Color color,
    required bool isLast,
    Key? key,
  })  : _animationAsset = animationAsset,
        _child = child,
        _color = color,
        _isLast = isLast,
        super(key: key);

  final String _animationAsset;
  final Widget _child;
  final Color _color;
  final bool _isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      padding: EdgeInsets.only(right: Get.width * 0.2, left: 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(
                BethAnimations.background,
                height: Get.height * 0.4,
              ),
              Lottie.asset(
                _animationAsset,
                height: Get.height * 0.4,
              ),
            ],
          ),
          _child,
          const Spacer(),
          if (_isLast)
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: BethElevatedButton(
                onTap: () {
                  GetStorage().write(BethConst.isFirstLaunch, false);
                  Get.put(AuthController(), permanent: true);
                },
                color: BethColors.accent1,
                text: BethTranslations.continueToBeth.tr,
                foregroundColor: BethColors.lightPrimary1,
                borderless: false,
              ),
            ),
        ],
      ),
    );
  }
}
