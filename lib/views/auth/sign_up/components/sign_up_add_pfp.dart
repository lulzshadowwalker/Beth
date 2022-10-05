part of './sign_up_components.dart';

class SignUpAddPfp extends StatelessWidget {
  const SignUpAddPfp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChooseAvatar(
      nameText: Get.find<CredentialsController>().userData.name ??
          BethConst.nameFallBack,
      buttonText: BethTranslations.signUp.tr,
      onPressed: _onPressed,
    );
  }

  void _onPressed(Uint8List? file) async {
    if (file != null) {
      final credentials = Get.find<CredentialsController>();
      credentials.userData.profilePicture = file;
    }

    await Get.find<AuthController>().signUpWithEmailAndPassword();
  }
}
