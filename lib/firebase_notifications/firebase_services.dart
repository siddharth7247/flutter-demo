import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseServicesApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _channel = const AndroidNotificationChannel(
      'Notification_Channel', 'Local_Notification',
      importance: Importance.high);
  final _loacalNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    log("Token : $fcmToken");
    FirebaseMessaging.onBackgroundMessage(BackgroundMessageHandler);
    FirebaseMessaging.onMessage.listen(
      (message) {
        final notification = message.notification;
        if (notification == null) {
          return;
        } else {
          log("Message Revived");
          _loacalNotifications.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(_channel.id, _channel.name,
                    channelDescription: _channel.description,
                    icon: '@drawable/ic_launcher'),
              ),
              payload: jsonEncode(message.toMap()));
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> BackgroundMessageHandler(RemoteMessage message) async {
    log("Title : ${message.notification?.title}");
    log("Body : ${message.notification?.body}");
    log("PayLoad : ${message.data}");
  }
}
