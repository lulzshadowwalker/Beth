import 'package:beth/locale/beth_translations.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/shared/beth_animated_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'beth_tile.dart';

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
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 75),

      /// decoration
      decoration: BoxDecoration(
        color: BethColors.secondary1,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),

      /// content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                color: BethColors().neutral1,
                borderRadius: BorderRadius.circular(50),
              ),
              width: 60,
              height: 5,
            ),
          ),

          // Heacer text
          Text(
            BethTranslations.pickImage.tr,
            style:
                Get.textTheme.headline4?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30),

          // gallery option
          BethTile(
            onTap: () => _onTap(ImageSource.gallery),
            leading:
                FaIcon(FontAwesomeIcons.image, color: BethColors().neutral1),
            title: BethTranslations.gallery.tr,
          ),
          const SizedBox(height: 30),

          //  camera option
          BethTile(
            onTap: () => _onTap(ImageSource.camera),
            leading:
                FaIcon(FontAwesomeIcons.camera, color: BethColors().neutral1),
            title: BethTranslations.camera.tr,
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
