import 'package:flutter/material.dart';
import 'package:flutter_demo/firebase_notifications/local_notification.dart';

class LocalNotificationScreen extends StatelessWidget {
  const LocalNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                LocalNotification.showNotification(
                    title: "Simple Notification",
                    body: "Simple Notification",
                    payload: "Simple notification");
              },
              child: const Text("simple Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                LocalNotification.showActionNotification(
                    title: "Simple  Action Notification",
                    body: "Simple Action Notification",
                    payload: "Simple notification");
              },
              child: const Text("Action Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
