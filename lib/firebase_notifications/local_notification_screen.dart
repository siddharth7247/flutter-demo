import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_demo/firebase_notifications/local_notification.dart';

class LocalNotificationScreen extends StatelessWidget {
  LocalNotificationScreen({super.key});
  DateTime scheduleTime = DateTime.now();
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
            TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) => scheduleTime = date,
                  onConfirm: (date) {},
                );
              },
              child: Text('Select Time'),
            ),
            ElevatedButton(
              onPressed: () {
                LocalNotification.showScheduleNotification(
                    title: "Schedule Notification",
                    body: "Schedule Notification Body",
                    payload: " Schedule notification",
                    time: scheduleTime);
               
              },
              child: const Text("Shedule Notification"),
            ),
             ElevatedButton(
              onPressed: () {
                LocalNotification.showNotification(
                    title: "Big Text Notification",
                    body: "Big Text Notification",
                    payload: "Big Text notification");
              },
              child: const Text("Big Text Notification"),
            ),
             ElevatedButton(
              onPressed: () {
                LocalNotification.showProgressNotification();
              },
              child: const Text("Progress Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
