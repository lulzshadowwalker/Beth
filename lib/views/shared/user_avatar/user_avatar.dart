import 'package:beth/themes/beth_colors.dart';
import 'package:beth/themes/beth_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/current_user/current_user_controller.dart';
import '../../../helpers/beth_images.dart';
import '../../profile/profile.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({double? radius, Key? key})
      : _radius = radius,
        super(key: key);

  final double? _radius;

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: CurrentUserController(),
        builder: (CurrentUserController _) => InkWell(
              child: Container(
                width: _radius ?? 40,
                height: _radius ?? 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: BethTheme.isLight
                        ? BethColors.secondary1
                        : BethColors.secondary2,
                    width: 2,
                  ),
                  color: BethColors.lightPrimary1,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      _.data.profilePicture ?? BethImages.unknownProfilePicture,
                    ),
                  ),
                ),
              ),
              onTap: () => Get.to(() => const Profile()),
            ));
  }
}
