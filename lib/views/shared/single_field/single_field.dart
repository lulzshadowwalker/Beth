part of '../../shared/single_field/components/single_field_components.dart';

class SingleField extends StatelessWidget {
  SingleField({
    required String title,
    required String buttonText,
    required void Function() onTap,
    required Widget formField,
    Key? key,
  })  : _title = title,
        _buttonText = buttonText,
        _onTap = onTap,
        _formField = formField,
        super(key: key);

  final _formKey = GlobalKey<FormState>();
  final String _title;
  final String _buttonText;
  final void Function() _onTap;
  final Widget _formField;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BethColors.neutral2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: BethConstrainedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // handle
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: BethColors.neutral1,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 60,
                height: 5,
              ),
            ),

            const Spacer(),

            //
            _SingleFieldHeader(title: _title),

            //
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 80),
              child: Form(key: _formKey, child: _formField),
            ),

            //
            BethElevatedButton(
              onTap: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  _onTap();
                }
              },
              text: _buttonText,
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
