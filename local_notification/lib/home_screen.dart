import 'package:flutter/material.dart';
import 'package:local_notification/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final notificationService = NotificationService();
                  notificationService.showNotification(
                    id: 1,
                    body: 'This is a new notification',
                    title: 'Local Notification',
                    payload: 'Notification Max',
                  );
                },
                child: const Text('Notification')),
          ],
        ),
      ),
    );
  }
}
