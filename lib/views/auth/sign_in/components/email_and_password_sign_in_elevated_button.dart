part of './sign_in_components.dart';

class _EmailAndPasswordSignInElevatedButton extends StatelessWidget {
  const _EmailAndPasswordSignInElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BethElevatedButton(
      onTap: () async {
        if (Get.find<FormController>(tag: BethConst.signInForm).validate()) {
          await Get.find<AuthController>().signInWithEmailAndPassword();
        }

        BethUtils.selectImage();
      },
      text: BethTranslations.signIn.tr,
    );
  }
}
