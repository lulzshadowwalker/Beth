import 'package:beth/locale/beth_translations.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/shared/beth_elevated_button/beth_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BethImageSourceBottomSheet extends StatelessWidget {
  const BethImageSourceBottomSheet({
    required Function(ImageSource) onItemSelected,
    Key? key,
  })  : _onItemSelected = onItemSelected,
        super(key: key);

  final Function(ImageSource) _onItemSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // gallery option
          BethElevatedButton(
            onTap: () => _onTap(ImageSource.gallery),
            leading: FaIcon(
              FontAwesomeIcons.image,
              color: BethColors.darkPrimary1,
              size: 16,
            ),
            text: BethTranslations.gallery.tr,
          ),
          const SizedBox(height: 20),

          //  camera option
          BethElevatedButton(
            onTap: () => _onTap(ImageSource.camera),
            leading: FaIcon(
              FontAwesomeIcons.camera,
              color: BethColors.darkPrimary1,
              size: 16,
            ),
            text: BethTranslations.camera.tr,
          ),

          const SizedBox(height: 20),
          BethElevatedButton(
            onTap: () => Get.back(),
            text: BethTranslations.cancel.tr,
            color: Colors.transparent,
            borderless: false,
            foregroundColor: BethColors.lightPrimary1,
          ),
        ],
      ),
    );
  }

  void _onTap(ImageSource imageSource) {
    _onItemSelected(imageSource);

    Get.back();
  }
}
