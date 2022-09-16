part of './components/password_reset_components.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleField(
        title: BethTranslations.enterYourEmailAddress.tr,
        buttonText: BethTranslations.sendPasswordResetEmail.tr,
        onTap: _onTap,
        formField: BethEmailField(onSaved: _onSaved));
  }

  void _onTap() async {
    Get.find<AuthController>().sendPasswordResetEmail();
  }

  void _onSaved(String? value) {
    Get.find<CredentialsController>().userData.email = value!;
  }
}
