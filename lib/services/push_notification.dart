import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialize() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },

      // Called when the app is completely closed and it's opened
      onLaunch: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },

      // Called when the app is in background and it's opened
      onResume: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
    );
  }

  void getToken() {
    _fcm.getToken().then((token) {
      print('Token = $token');
    });
  }
}