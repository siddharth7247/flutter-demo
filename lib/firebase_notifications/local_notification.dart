import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const _channel = AndroidNotificationChannel(
      'Local_Channel', 'Local_Notification',
      importance: Importance.high);

  static Future initLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) => null,
    );
  }

  static Future showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  static Future showActionNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(_channel.id, _channel.name,
            channelDescription: _channel.description,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            actions: [
          const AndroidNotificationAction('1', "yes"),
          const AndroidNotificationAction('2', "No")
        ]);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  static Future showBigTextNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(''),
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  static Future<void> showProgressNotification() async {
    int id = 1;
    id++;
    final int progressId = id;
    const int maxProgress = 5;
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(
        const Duration(seconds: 1),
        () async {
          final AndroidNotificationDetails androidNotificationDetails =
              AndroidNotificationDetails(_channel.id, _channel.name,
                  channelDescription: _channel.description,
                  channelShowBadge: false,
                  importance: Importance.max,
                  priority: Priority.high,
                  onlyAlertOnce: true,
                  showProgress: true,
                  maxProgress: maxProgress,
                  progress: i);
          final NotificationDetails notificationDetails =
              NotificationDetails(android: androidNotificationDetails);
          await _flutterLocalNotificationsPlugin.show(
              progressId,
              'progress notification title',
              'progress notification body',
              notificationDetails,
              payload: 'item x');
        },
      );
    }
  }

  static Future showScheduleNotification({
    required String title,
    required String body,
    required String payload,
    required DateTime time,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(_channel.id, _channel.name,
            channelDescription: _channel.description,
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    NotificationDetails schedulenotificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    final String currentTimeZone = DateTime.now().toUtc().timeZoneName;
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log("Date Time : $time");
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          title,
          body,
          tz.TZDateTime.from(time.add(Duration(seconds: 1)), tz.local),
          schedulenotificationDetails,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      log("Notification Schedule sccessfully");
    } catch (e) {
      log("Exception occure : $e");
    }
  }
}
