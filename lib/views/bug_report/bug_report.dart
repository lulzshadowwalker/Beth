part of './components/bug_report_components.dart';

class BugReport extends StatefulWidget {
  const BugReport({Key? key}) : super(key: key);
  static const String tag = 'bugReport';

  @override
  State<BugReport> createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {
  @override
  Widget build(BuildContext context) {
    return BethScaffold(
      title: BethTranslations.bugReport.tr,
      body: SingleChildScrollView(
        child: BethConstrainedBox(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Form(
              key: _formController.formKey,
              child: Column(
                children: [
                  /// header
                  BethAnimatedHeader(
                    text: BethTranslations.submitABug.tr,
                  ),

                  /// subject
                  BethTextFormField(
                    hintText: BethTranslations.subject.tr,
                    validator: _subjectValidator,
                    controller: _subjectController,
                  ),

                  /// description
                  BethTextFormField(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    maxLines: 10,
                    hintText: BethTranslations.descriptionOptional.tr,
                    labelText: BethTranslations.description.tr,
                    controller: _descriptionController,
                  ),
                  const SizedBox(height: 50),

                  Row(
                    children: [
                      /// image button
                      Expanded(
                        child: BethElevatedButton(
                          onTap: _pickImage,
                          text: BethTranslations.attachScreenshot.tr,
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// image preview
                      const _ImagePreview()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarConstrainedBox(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 65),
            child: BethElevatedButton(
                onTap: _submit, text: BethTranslations.submit.tr)),
      ),
    );
  }

  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formController = FormController();
  final _imageController =
      Get.put(ImageController(), tag: _kPreviewImageControllerTag);
  static const String _kPreviewImageControllerTag =
      '_kPreviewImageControllerTag';

  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = BugReport.tag;
  }

  @override
  void dispose() {
    super.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
  }

  String? _subjectValidator(String? value) {
    value ??= '';
    return value.isBlank! ? BethTranslations.subjectMustBeProvided.tr : null;
  }

  void _pickImage() async =>
      _imageController.setImage = await BethUtils.selectImage();

  Future<void> _submit() async {
    if (_formController.validate()) {
      final image = _imageController.getImage;
      if (image == null) {
        BethUtils.showSnackBar(
          message: BethTranslations.noImageSelected.tr,
          alertType: AlertType.error,
        );
        return;
      }

      final attachmentUrl = await RemoteStorageController()
          .upload(file: image, childName: 'bugReports');

      await RemoteDbController().bugReport(
        subject: _subjectController.text.trim(),
        description: _descriptionController.text.trim(),
        attachment: attachmentUrl!,
      );

      _subjectController.clear();
      _descriptionController.clear();
      _imageController.clear();
    }
  }
}
