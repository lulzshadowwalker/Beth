part of './sign_up_components.dart';

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BethTextFormField(
      labelText: BethTranslations.name.tr,
      hintText: 'test@example.com',
      prefixIcon: const Icon(Icons.person),
      keyboardType: TextInputType.name,
      validator: (value) {
        return GetUtils.isLengthBetween(value ?? '', 3, 12)
            ? null
            : BethTranslations.nameInvalid.tr;
      },
      onSaved: (value) =>
          Get.find<CredentialsController>().userData.name = value!,
    );
  }
}
