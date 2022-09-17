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
          child: BethConstrainedBox(
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
                    children: [
                      BethEmailField(onSaved: _onSaved),
                      const BethPasswordField(),
                    ],
                  ),
                ),
          
                const _ForgotPasswordTextButton(),
          
                const _EmailAndPasswordSignInElevatedButton(),
          
                BethDivider(
                    child: Text(BethTranslations.or.tr,
                        style: Theme.of(context).textTheme.caption)),
          
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

  void _dontHaveAnAccount() {
    Get.find<CredentialsController>().getOff(SignUp());
  }

  void _onSaved(String? value) {
    Get.find<CredentialsController>().userData.email = value!;
  }
}
