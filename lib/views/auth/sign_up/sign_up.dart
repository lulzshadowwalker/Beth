part of './components/sign_up_components.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _formController = Get.put(FormController(), tag: BethConst.signUpForm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          
                BethAnimatedHeader(text: BethTranslations.signUp.tr),
                const Spacer(),
                Form(
                  key: _formController.formKey,
                  child: Column(
                    children: [
                      BethNameField(
                        onSaved: (value) => Get.find<CredentialsController>()
                            .userData
                            .name = value!,
                      ),
                      BethEmailField(onSaved: _onSaved),
                      const BethPasswordField(),
                    ],
                  ),
                ),
          
                const SizedBox(height: 30),
                const _EmailAndPasswordSignUpElevatedButton(),
          
                BethDivider(
                    child: Text(BethTranslations.or.tr,
                        style: Theme.of(context).textTheme.bodySmall)),
          
                const GoogleAuthElevatedButton(isSignIn: false),
          
                const Spacer(flex: 2),
          
                BethRichTextButton(
                  text: BethTranslations.alreadyHaveAnAccount.tr,
                  textCTA: BethTranslations.signIn.tr,
                  onTap: _alreadyHaveAnAccount,
                )
                // footer
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _alreadyHaveAnAccount() {
    Get.find<CredentialsController>().getOff(SignIn());
  }

  void _onSaved(String? value) {
    Get.find<CredentialsController>().userData.email = value!;
  }
}
