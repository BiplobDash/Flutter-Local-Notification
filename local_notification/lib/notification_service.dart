// Top-Level function for handling background notification
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void backgroundNotificationResponseHandler(
    NotificationResponse notificationResponse) async {
  // ignore: avoid_print
  print("Received background notification service: $notificationResponse");
}

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // Android Setting
    const AndroidInitializationSettings initializationAndroidSettings = AndroidInitializationSettings('logo');

    // IOS Setting
    final DarwinInitializationSettings initializationSettingIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      defaultPresentSound: true,
      defaultPresentAlert: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // ignore: avoid_print
        print('Received local notification: $id, $title, $body, $payload');
      },
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationAndroidSettings,
      iOS: initializationSettingIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: backgroundNotificationResponseHandler,
    );
  }

    Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    // ignore: avoid_print
    print('Showing notification: $id, $title, $body, $payload');
    await notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payload,
    );
  }

  Future<NotificationDetails> notificationDetails() async {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}
