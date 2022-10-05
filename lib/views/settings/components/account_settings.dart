part of './settings_components.dart';

class _AccountSettings extends StatefulWidget {
  const _AccountSettings({Key? key}) : super(key: key);

  @override
  State<_AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<_AccountSettings> {
  static final _nameController = TextEditingController();
  static final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: CurrentUserController(),
      builder: (CurrentUserController _) => _SettingsSection(
        sectionHeader: BethTranslations.accountSettings.tr,
        options: [
          /// name
          _OptionTile(
            title: BethTranslations.name.tr,
            value: _.data.name,
            onTap: _onTapName,
          ),

          /// email
          _OptionTile(
            title: BethTranslations.email.tr,
            value: _.data.email,
            onTap: _onTapEmail,
          ),

          /// profile picture
          _OptionTile(
            title: BethTranslations.profilePicture.tr,
            onTap: _onTapProfilePicture,
          ),
        ],
      ),
    );
  }

  void _onTapName() async {
    Get.bottomSheet(
      SingleField(
        title: BethTranslations.enterYourNewName.tr,
        buttonText: BethTranslations.applyChanges.tr,
        onTap: () async {
          await RemoteDbController()
              .updateUserDisplayName(_nameController.value.text.trim());
          _nameController.clear();
        },
        formField: BethNameField(controller: _nameController),
      ),
    );
  }

  void _onTapEmail() async {
    Get.bottomSheet(
      SingleField(
        title: BethTranslations.enterYourNewEmailAddress.tr,
        buttonText: BethTranslations.applyChanges.tr,
        onTap: () async {
          await Get.find<AuthController>()
              .updateEmail(_emailController.value.text.trim());

          _emailController.clear();
          Get.back();
        },
        formField: BethEmailField(controller: _emailController),
      ),
    );
  }

  void _onTapProfilePicture() {
    Get.bottomSheet(
      GetX(
        builder: (CurrentUserController _) => ChooseAvatar(
          nameText: _.data.name ?? BethConst.nameFallBack,
          buttonText: BethTranslations.applyChanges.tr,
          onPressed: (file) async {
            if (file == null) {
              BethUtils.showSnackBar(
                message: BethTranslations.noImageSelected.tr,
                alertType: AlertType.warning,
              );

              return;
            }

            final downloadUrl = await RemoteStorageController()
                .upload(file: file, childName: 'profilePicture');

            await RemoteDbController().updateProfilePicture(downloadUrl!);

            Get.to(() => const Settings());
          },
        ),
      ),
    );
  }
}
