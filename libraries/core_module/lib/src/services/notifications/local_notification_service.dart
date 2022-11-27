import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.max,
  );

  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  LocalNotificationService() {
    _configureAndroid().then((value) {
      _flutterLocalNotificationsPlugin = value;
      _initializedNotifications();
    });
  }

  void _initializedNotifications() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const iOS = DarwinInitializationSettings();

    _flutterLocalNotificationsPlugin.initialize(const InitializationSettings(android: android, iOS: iOS));
  }

  Future<FlutterLocalNotificationsPlugin> _configureAndroid() async {
    final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    return flutterLocalNotificationPlugin;
  }

  void androidNotification(RemoteNotification remoteNotification, AndroidNotification androidNotification) {
    _flutterLocalNotificationsPlugin.show(
      remoteNotification.hashCode,
      remoteNotification.title,
      remoteNotification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          icon: androidNotification.smallIcon,
        ),
      ),
    );
  }
}
