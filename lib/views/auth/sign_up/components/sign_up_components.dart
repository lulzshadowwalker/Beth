import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/form/form_controller.dart';
import 'package:beth/helpers/beth_const.dart';
import 'package:beth/views/auth/sign_in/components/sign_in_components.dart';
import 'package:beth/views/shared/beth_animated_header/beth_animated_header.dart';
import 'package:beth/views/shared/google_auth_elevated_button/google_auth_elevated_button.dart';
import 'package:beth/views/shared/upload_avatar/components/upload_avatar_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/auth_controller.dart';
import '../../../../locale/beth_translations.dart';
import '../../../beth_home/components/beth_home_components.dart';
import '../../../shared/beth_divider/beth_divider.dart';
import '../../../shared/beth_elevated_button/beth_elevatedbutton.dart';
import '../../../shared/beth_email_field/beth_email_field.dart';
import '../../../shared/beth_password_field/beth_password_field.dart';
import '../../../shared/beth_rich_text_button/beth_richtextbutton.dart';
import '../../../shared/name_field/name_field.dart';

part './email_and_password_sign_up_elevated_button.dart';
part '../sign_up.dart';
part 'sign_up_add_pfp.dart';
