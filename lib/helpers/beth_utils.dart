import 'dart:math' as math;
import 'dart:math';
import 'dart:typed_data';

import 'package:beth/helpers/beth_log_printer.dart';
import 'package:beth/views/shared/beth_image_source/beth_image_source_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:motion_toast/motion_toast.dart';

import '../locale/beth_translations.dart';
import '../models/alert_type.dart';

class BethUtils {
  static final _log = getLogger(_className);

  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = 'BethUtils';
  /* -------------------------------------------------------------------------- */

  /// Instantiate a [Logger] instance with the neseccary boilerplate code
  static Logger getLogger(String className) =>
      Logger(printer: BethLogPrinter(className));

  /// Shows a custom snack bar using the [MotionToast] package instead of
  ///  making a custom [GetX] snack bar
  static void showSnackBar({
    String? title,
    required String message,
    required AlertType alertType,
  }) {
    const bool enableAnimation = false;

    final Map<AlertType, String> title = {
      AlertType.error: BethTranslations.error.tr,
      AlertType.warning: BethTranslations.warning.tr,
      AlertType.success: BethTranslations.success.tr,
      AlertType.info: BethTranslations.info.tr,
    };

    const Duration toastDuration = Duration(seconds: 3);
    final textStyle = Get.textTheme.titleMedium;
    switch (alertType) {
      case AlertType.error:
        MotionToast.error(
          title: Text(title[alertType]!,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          description: Text(
            message,
            style: textStyle,
          ),
          enableAnimation: enableAnimation,
          toastDuration: toastDuration,
        ).show(Get.context!);
        break;
      case AlertType.success:
        MotionToast.success(
          title: Text(title[alertType]!,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          description: Text(
            message,
            style: textStyle,
          ),
          enableAnimation: enableAnimation,
          toastDuration: toastDuration,
        ).show(Get.context!);
        break;
      case AlertType.warning:
        MotionToast.warning(
          title: Text(title[alertType]!,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          description: Text(
            message,
            style: textStyle,
          ),
          enableAnimation: enableAnimation,
          toastDuration: toastDuration,
        ).show(Get.context!);
        break;
      case AlertType.info:
        MotionToast.info(
          title: Text(title[alertType]!,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          description: Text(
            message,
            style: textStyle,
          ),
          enableAnimation: enableAnimation,
          toastDuration: toastDuration,
        ).show(Get.context!);
        break;
      case AlertType.delete:
        MotionToast.delete(
          title: Text(title[alertType]!,
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          description: Text(
            message,
            style: textStyle,
          ),
          enableAnimation: enableAnimation,
          toastDuration: toastDuration,
        ).show(Get.context!);
        break;
    }
  }

  /// switches between english and arabic locale
  static void flipLocale() => Get.updateLocale(
        Get.locale == const Locale('en')
            ? const Locale('ar')
            : const Locale('en'),
      );

  static void handleSocketException(Logger logger) {
    logger.e('SocketExcepetion, check internet connection.');

    BethUtils.showSnackBar(
      message: BethTranslations.checkInternetConnection.tr,
      alertType: AlertType.error,
    );
  }

  static void handleUnkownError(Object e, Logger logger) {
    logger.e(e.toString());

    BethUtils.showSnackBar(
      message: BethTranslations.unkownError.tr,
      alertType: AlertType.error,
    );
  }

  static Future<Uint8List?> selectImage() async {
    try {
      late ImageSource imageSource;

      // as of right now, [Get.bottomSheet] doesn't support constraints
      await showModalBottomSheet(
        context: Get.context!,
        builder: (_) => BethImageSourceBottomSheet(
          onItemSelected: (source) => imageSource = source,
        ),
        backgroundColor: Colors.transparent,
        constraints: const BoxConstraints(maxWidth: 500),
      );

      XFile? image = await ImagePicker().pickImage(
        source: imageSource,
        maxHeight: 400,
        maxWidth: 400,
      );

      if (image == null) {
        throw Exception('Image picking proccess terminated by the user');
      }

      return image.readAsBytes();
    } catch (e) {
      _log.e(e.toString());
      return null;
    }
  }

  static int randomNumberInRange({int min = 0, required int max}) {
    return math.Random().nextInt(max - min) + min;
  }

  static int get screenWidth =>

      ///  ..
      ///  As far as I can tell, [Get.width] returns the relative width of the
      ///  screen depending on the orientation when launching the aplication.
      min(Get.width.toInt(), Get.height.toInt());
}
