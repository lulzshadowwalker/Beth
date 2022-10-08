import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/controllers/storage/remote_storage/remote_storage_controller.dart';
import 'package:beth/helpers/beth_animations.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/views/beth_home/components/beth_home_components.dart';
import 'package:beth/views/shared/beth_animated_header/beth_animated_header.dart';
import 'package:beth/views/shared/beth_constrained_box/beth_constrained_box.dart';
import 'package:beth/views/shared/beth_elevated_button/beth_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/image/image_controller.dart';
import '../../helpers/beth_utils.dart';
import '../../models/alert_type.dart';
import '../shared/bottom_nav_bar_constrained_box/bottom_nav_bar_constrained_box.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      extendBody: true,
      bottomNavigationBar: BottomNavBarConstrainedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 65),
          child: BethElevatedButton(
            borderless: false,
            onTap: _post,
            text: BethTranslations.post.tr,
          ),
        ),
      ),
      body: BethConstrainedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 35),
          child: Column(
            children: [
              /// header
              BethAnimatedHeader(
                text: BethTranslations.postToCommunity.tr,
              ),

              /// image
              GetBuilder(
                builder: (ImageController _) => Expanded(
                  flex: 0,
                  child: _.getImage == null
                      ? Bounceable(
                          onTap: _pickImage,
                          child: Lottie.asset(BethAnimations.uploadField),
                        )
                      : InteractiveViewer(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 8,
                            child: Image.memory(
                              _.getImage!,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  final _imageController = Get.put(ImageController());

  void _pickImage() async =>
      _imageController.setImage = await BethUtils.selectImage();

  void _post() async {
    final image = _imageController.getImage;
    if (image == null) {
      BethUtils.showSnackBar(
        message: BethTranslations.noImageSelected.tr,
        alertType: AlertType.error,
      );
      return;
    }
    final imageUrl =
        await RemoteStorageController().upload(file: image, childName: 'posts');

    await RemoteDbController().addPost(imageUrl: imageUrl!);

    _imageController.clear();

    Get.off(() => const BethHome());
  }
}
