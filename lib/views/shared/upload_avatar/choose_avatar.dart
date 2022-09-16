part of './components/upload_avatar_components.dart';

// ignore: must_be_immutable
class ChooseAvatar extends StatelessWidget {
  ChooseAvatar({
    required String buttonText,
    required void Function(Uint8List? file) onPressed,
    required String nameText,
    Key? key,
  })  : _buttonText = buttonText,
        _onPressed = onPressed,
        _nameText = nameText,
        super(key: key);

  Uint8List? _file;
  final String _buttonText;
  final void Function(Uint8List? file) _onPressed;
  final String _nameText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 150,
            maxHeight: double.infinity,
            maxWidth: 550,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const _Avatar(),
                        Positioned(
                          bottom: -10,
                          right: -12,
                          child: IconButton(
                            onPressed: _selectImage,
                            icon: const FaIcon(FontAwesomeIcons.circlePlus),
                          ),
                        )
                      ],
                    ),
                    _Name(text: _nameText),
                    const SizedBox(height: 55),
                    BethElevatedButton(
                      onTap: _onTap,
                      text: _buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {

    _onPressed(_file);

    Get.back();
  }

  void _selectImage() async {
    _file = await BethUtils.selectImage();

    Get.find<ImageController>().setImage = _file;
  }
}
