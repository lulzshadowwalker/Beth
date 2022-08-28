part of './sign_up_components.dart';

class _EmailAndPasswordSignUpElevatedButton extends StatelessWidget {
  const _EmailAndPasswordSignUpElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BethElevatedButton(
      onTap: () async {
        if (Get.find<FormController>(tag: BethConst.signUpForm).validate()) {
          // without resetting [CredentialController]
          Get.to(const SignUpAddPfp());
        }
      },
      text: BethTranslations.step2of2 .tr,
    );
  }
}
