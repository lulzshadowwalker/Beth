import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/form/form_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/models/beth_user_credentials.dart';
import 'package:beth/views/auth/password_reset/components/password_reset_components.dart';
import 'package:beth/views/auth/sign_up/components/sign_up_components.dart';
import 'package:beth/views/shared/beth_animated_header.dart';
import 'package:beth/views/shared/beth_elevatedbutton.dart';
import 'package:beth/views/shared/beth_richtextbutton.dart';
import 'package:beth/views/shared/beth_textbutton.dart';
import 'package:beth/views/shared/google_auth_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/auth_controller.dart';
import '../../../../helpers/beth_const.dart';
import '../../../../locale/beth_translations.dart';
import '../../../shared/beth_divider.dart';
import '../../../shared/beth_email_field.dart';
import '../../../shared/beth_password_field.dart';

part './forgot_password_text_button.dart';
part '../sign_in.dart';
part 'email_and_password_sign_in_elevated_button.dart';
