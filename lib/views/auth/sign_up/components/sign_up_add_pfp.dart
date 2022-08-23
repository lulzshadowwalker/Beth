part of './sign_up_components.dart';

class SignUpAddPfp extends StatelessWidget {
  SignUpAddPfp({Key? key}) : super(key: key);

  final _credentials = Get.find<CredentialsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    GetBuilder(
                      init: ImageController(),
                      builder: (ImageController _) => Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BethColors.primary2,
                          ),
                          width: 128,
                          height: 128,
                          child: _.getImage == null
                              ? SvgPicture.asset(
                                  BethImages.doodleAvatar[2],
                                  alignment: Alignment.topCenter,
                                  // width: 64,
                                )
                              : Image.memory(_.getImage!, fit: BoxFit.cover)),
                    ),
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
                Text(
                  _credentials.userData.name!,
                  style: Get.textTheme.headline4?.copyWith(
                    shadows: [
                      const Shadow(
                        blurRadius: 7.0,
                        color: BethColors.white,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                BethElevatedButton(
                    onTap: () async {
                      await Get.find<AuthController>()
                          .signUpWithEmailAndPassword();
                    },
                    text: 'Create an account')
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage() async {
    final selectedImage = await BethUtils.selectImage();

    _credentials.userData.profilePicture = selectedImage;
    Get.find<ImageController>().setImage = selectedImage;
  }
}
