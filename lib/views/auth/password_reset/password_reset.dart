part of './components/password_reset_components.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        extendBody: true,
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
                  //
                  const _PasswordResetHeader(),

                  //
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 80),
                    child: Form(key: _formKey, child: const BethEmailField()),
                  ),

                  //
                  BethElevatedButton(
                    onTap: _onTap,
                    text: BethTranslations.sendPasswordResetEmail.tr,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onTap() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Get.find<AuthController>().sendPasswordResetEmail();
    }
  }
}
