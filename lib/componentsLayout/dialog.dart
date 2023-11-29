import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogEvents {
  
  static void showToast(BuildContext context,String msg) {
    HapticFeedback.vibrate();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(msg),
    ));
  }
  static   Future<void> showNotificationDialog(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Set up local notifications
      // const AndroidInitializationSettings initializationSettingsAndroid =
      //     AndroidInitializationSettings('@mipmap/ic_launcher');
      // final InitializationSettings initializationSettings =
      //     InitializationSettings(android: initializationSettingsAndroid);
      // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      // Schedule the notification
      await _scheduleNotification(selectedTime);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notification Scheduled'),
            content: Text('Notification set for ${selectedTime.format(context)}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  static Future<void> _scheduleNotification(TimeOfDay time) async {
    final DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      // If the selected time is in the past, schedule it for the next day
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    // final int notificationId = scheduledDate.millisecondsSinceEpoch ~/ 1000;

    // const AndroidNotificationDetails androidPlatformChannelSpecifics =
    //     AndroidNotificationDetails(
    //   'your_channel_id', // Change this channel ID
    //   'Scheduled Notification',
    //   'Scheduled notification description',
    //   importance: Importance.high,
    //   priority: Priority.high,
    // );
    // const NotificationDetails platformChannelSpecifics =
    //     NotificationDetails(android: androidPlatformChannelSpecifics);

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   notificationId,
    //   'Scheduled Notification',
    //   'This is your scheduled notification',
    //   scheduledDate,
    //   const NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'your_channel_id', // Change this channel ID
    //       'Scheduled Notification',
    //       'Scheduled notification description',
    //       importance: Importance.high,
    //       priority: Priority.high,
    //     ),
    //   ),
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   androidAllowWhileIdle: true,
    //   payload: 'Scheduled Notification Payload',
    // );
  }
}