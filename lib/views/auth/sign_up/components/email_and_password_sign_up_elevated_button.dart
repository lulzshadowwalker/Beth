part of './sign_up_components.dart';

class _EmailAndPasswordSignUpElevatedButton extends StatelessWidget {
  const _EmailAndPasswordSignUpElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BethElevatedButton(
      onTap: () async {
        final isValidForm =
            Get.find<FormController>(tag: BethConst.signUpForm).validate();
        if (isValidForm && await _isAuthenticEmail()) {
          // without resetting [CredentialController]
          Get.to(const SignUpAddPfp());
        }
      },
      text: BethTranslations.step2of2.tr,
    );
  }

  Future<bool> _isAuthenticEmail() async {
    final credentials = Get.find<CredentialsController>();
    final isAuthenticEmail =
        await EvaApiController().verifyEmail(credentials.userData.email);

    if (!isAuthenticEmail) {
      BethUtils.showSnackBar(
        title: 'Unauthentic email',
        message: BethTranslations.unauthenticEmail.tr,
        alertType: AlertType.error,
      );
    }
    return isAuthenticEmail;
  }
}
