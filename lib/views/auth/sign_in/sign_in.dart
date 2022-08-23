part of './components/sign_in_components.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final _formController = Get.put(FormController(), tag: BethConst.signInForm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 150,
              minHeight: 150,
              maxHeight: double.infinity,
              maxWidth: 550,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),

                BethAnimatedHeader(text: BethTranslations.signIn.tr),

                const Spacer(),
                Form(
                  key: _formController.formKey,
                  child: Column(
                    children: const [
                      BethEmailField(),
                      BethPasswordField(),
                    ],
                  ),
                ),

                const _ForgotPasswordTextButton(),

                const _EmailAndPasswordSignInElevatedButton(),

                BethDivider(
                    child: Text(BethTranslations.or.tr,
                        style: Get.textTheme.caption)),

                const GoogleAuthElevatedButton(isSignIn: true),

                const Spacer(flex: 2),

                BethRichTextButton(
                    text: BethTranslations.dontHaveAnAccount.tr,
                    textCTA: BethTranslations.signUp.tr,
                    onTap: _dontHaveAnAccount)
                // footer
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _dontHaveAnAccount() {
  Get.find<CredentialsController>().getOff(SignUp());
}
