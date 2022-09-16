part of './sign_in_components.dart';

class _ForgotPasswordTextButton extends StatelessWidget {
  const _ForgotPasswordTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BethTextButton(
      onTap: _onTap,
      text: BethTranslations.forgotPassword.tr,
      textAlign: TextAlign.end,
      padding: const EdgeInsets.only(top: 10, bottom: 25),
    );
  }
}

void _onTap() => Get.find<CredentialsController>().getTo(const PasswordReset());
