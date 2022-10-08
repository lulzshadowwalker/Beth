import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// ! must be a top level function [read more](https://firebase.flutter.dev/docs/messaging/usage#:~:text=Handling%20messages%20whilst,which%20requires%20initialization).)
Future<void> _handleFcmBackgroundMessage(RemoteMessage message) async {
  final RemoteNotification? notif = message.notification;
  if (notif != null) {
    NotificationsController().show(
      id: DateTime.now().second,
      title: notif.title ?? BethTranslations.cDiscover.tr,
      body: notif.body ?? BethTranslations.moreToDiscover.tr,
    );
  }
}

class NotificationsController {
  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = 'NotificationsController';
  /* -------------------------------------------------------------------------- */
  final _log = BethUtils.getLogger(_className);
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  NotificationsController._internal();

  static final _notificationsController = NotificationsController._internal();

  factory NotificationsController() => _notificationsController;

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    final localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTimeZone));

    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    _log.v('✅ NotificationsController has been initialized');

    showScheduledDaily(
      id: DateTime.now().second,
      title: BethTranslations.cDiscover.tr,
      body: BethTranslations.moreToDiscover.tr,
      time: const Time(12, 58),
    );

    await _initCloudMessaging();
  }

  Future<void> show({
    required int id,
    required String title,
    required String body,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        //
        android: AndroidNotificationDetails(
          'main_channel',
          'General',
          importance: Importance.max,
          priority: Priority.max,
          color: BethColors.secondary1,
        ),

        //
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );

    _log.v('''✅ notification has been shown
        title: $title
        body: $body''');
  }

  Future<void> showScheduledDaily({
    required int id,
    required String title,
    required String body,
    required Time time,
  }) async {
    final scheduledTime = _scheduleDaily(time);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      const NotificationDetails(
        //
        android: AndroidNotificationDetails(
          'main_channel',
          'General',
          importance: Importance.max,
          priority: Priority.max,
        ),

        //
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),

      //
      matchDateTimeComponents: DateTimeComponents.time,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    _log.v(
        '''✅ notification has been scheduled to be shown daily @ ${scheduledTime.toString()}
        title: $title
        body: $body''');
  }

  tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;
  }

  Future<void> cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();

    _log.v('✅ all notifications have been cancelled');
  }

  Future<void> _initCloudMessaging() async {
    if (GetPlatform.isIOS) {
      final settings = await _messaging.requestPermission();

      _log.v(
          'ℹ️ user\'s notifications permission status: ${settings.authorizationStatus}');
    }

    FirebaseMessaging.onMessage.listen((message) {
      final RemoteNotification? notif = message.notification;
      if (notif != null) {
        show(
          id: DateTime.now().second,
          title: notif.title ?? BethTranslations.cDiscover.tr,
          body: notif.body ?? BethTranslations.moreToDiscover.tr,
        );
      }
    });

    FirebaseMessaging.onBackgroundMessage(_handleFcmBackgroundMessage);

    _log.v('✅ Firebase Cloud-Messaging has been initialized');
  }
}
