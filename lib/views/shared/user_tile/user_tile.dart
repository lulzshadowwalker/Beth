import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/current_user/current_user_controller.dart';
import '../../../helpers/beth_const.dart';
import '../user_avatar/user_avatar.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const UserAvatar(radius: 64),
      const SizedBox(width: 20),
      GetX(
        init: UserController(),
        builder: (UserController _) => Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _.data.name ?? BethConst.nameFallBack,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                _.data.email ?? BethConst.nameFallBack,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
