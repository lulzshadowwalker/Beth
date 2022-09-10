part of './sign_up_components.dart';

class SignUpAddPfp extends StatelessWidget {
  const SignUpAddPfp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 150,
            maxHeight: double.infinity,
            maxWidth: 550,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const _Avatar(),
                        Positioned(
                          bottom: -10,
                          right: -12,
                          child: IconButton(
                            onPressed: _selectImage,
                            icon: const FaIcon(FontAwesomeIcons.circlePlus),
                          ),
                        )
                      ],
                    ),
                    _Name(),
                    const SizedBox(height: 55),
                    BethElevatedButton(
                      onTap: _onTap,
                      text: BethTranslations.signUp.tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() async {
    await Get.find<AuthController>().signUpWithEmailAndPassword();

    Get.find<CredentialsController>().getOffAll(const Home());
  }

  void _selectImage() async {
    final selectedImage = await BethUtils.selectImage();
    final credentials = Get.find<CredentialsController>();

    credentials.userData.profilePicture = selectedImage;
    Get.find<ImageController>().setImage = selectedImage;
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ImageController(),
      builder: (ImageController _) {
        return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BethColors.primary2,
            ),
            width: 128,
            height: 128,
            child: _.getImage == null
                ? GetX(
                    init: CounterController(
                        maxValue: BethImages.doodleAvatar.length - 1),
                    builder: (CounterController _) => SvgPicture.asset(
                      BethImages.doodleAvatar[_.count],
                      alignment: Alignment.topCenter,
                      // width: 64,
                    ),
                  )
                : Image.memory(_.getImage!, fit: BoxFit.cover));
      },
    );
  }
}

class _Name extends StatelessWidget {
  _Name({Key? key}) : super(key: key);
  final _credentials = Get.find<CredentialsController>();

  @override
  Widget build(BuildContext context) {
    return Text(
      _credentials.userData.name!,
      style: Get.textTheme.headlineMedium?.copyWith(
        shadows: [
          const Shadow(
            blurRadius: 7.0,
            color: BethColors.white,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
