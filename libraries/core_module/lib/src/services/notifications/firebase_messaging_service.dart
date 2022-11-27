import 'package:core_module/core.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseMessagingService {
  final LocalNotificationService _customLocalNotification;

  const FirebaseMessagingService._internal(this._customLocalNotification);

  static final FirebaseMessagingService instance = FirebaseMessagingService._internal(LocalNotificationService());

  factory FirebaseMessagingService() => instance;

  Future<void> initialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        _customLocalNotification.androidNotification(notification, android);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['goTO'] != null) {
        Modular.to.pushNamed(message.data['goTO']);
      }
    });
  }

  Future<void> getFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();

    debugPrint(token);
  }
}
