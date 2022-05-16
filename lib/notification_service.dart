import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:test/View/HomScreen.dart';

import 'View/Notification.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          importance: Importance.max, icon: "@mipmap/ic_launcher"),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    BuildContext? context,
  }) async {
    await _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
    if (payload == 'loggedin') {
      print('logged in');
      // Navigator.of(context!).push(MaterialPageRoute(
      //     builder: (context) => Notif(
      //           isLogin: true,
      //         )));
      Navigator.of(context!)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else if (payload == 'booked') {
      Navigator.of(context!).push(MaterialPageRoute(
          builder: (context) => Notif(
                isBooking: true,
              )));
    } else if (payload == 'expired') {
      Navigator.of(context!).push(MaterialPageRoute(
          builder: (context) => Notif(
                isExpired: true,
              )));
    } else if (payload == 'purchased') {
      Navigator.of(context!).push(MaterialPageRoute(
          builder: (context) => Notif(
                isPurchased: true,
              )));
    }
  }
}
