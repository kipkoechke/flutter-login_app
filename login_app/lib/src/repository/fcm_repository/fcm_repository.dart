import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class FCMController extends GetxController {
  static FCMController get to => Get.find();
  final userRepo = Get.put(UserRepository());
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  late String? deviceToken;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    requestPermissions();
    getToken();
    initInfo();
    setupInteractedMessage();
    listenToForegroundMessages();
    //handleNotificationInteraction();
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse response) async {
      try {
        // Handle notification selection and navigate accordingly
        if (response.payload != null && response.payload!.isNotEmpty) {
          // Handle notification payload and navigate accordingly
          print('Notification payload: ${response.payload}');
        } else {
          // Handle notification without payload and navigate accordingly
        }
      } catch (e) {
        //Handle catch errors
      }
      return;
    });
  }

  Future<void> requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> getToken() async {
    deviceToken = await messaging.getToken();
    print('Device Token: $deviceToken');
    // Save or send the device token to your server for targeted notifications
    // userRepo.saveDeviceToken(deviceToken!);
  }

  listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'login_app',
        'login_app',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: false,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  // void handleNotificationInteraction() {
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('Message opened from terminated state!');
  //     print('Message data: ${message.data}');

  //     if (message.notification != null) {
  //       print('Message also contained a notification: ${message.notification}');
  //       navigateToScreen(message);
  //     }
  //   });
  // }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.notification != null) {
      if (message.data['type'] == 'approved') {
        Get.to(() => ApplicationStatusScreen());
      } else if (message.data['type'] == 'declined') {
        Get.to(() => ApplicationStatusScreen());
      } else if (message.data['type'] == 'allocated') {
        Get.to(() => ApplicationStatusScreen());
      } else {}
    } else {
      return;
    }
  }

  Future<void> sendPushMessage(
      String deviceToken, String title, String body, String type) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAFh0QPrs:APA91bEG9OC5uv3cJ5oI2HpaQlCB8dA4vyEJ9wHV7MqN32t6vykmPLdZnHTgwOF4_S7zxwqFzYsHdwb_exFd6ZeKV_Jvm4C-ublMFVesSkfSq7UYZ5H45yBryK_2AlRR7vfQlDwHUsUA'
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'title': title,
              'body': body,
              'type': type,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": ""
            }
          }));
    } catch (e) {
      if (kDebugMode) {
        print('Error Push Notification');
      }
    }
  }

  Future<void> sendApplicationApprovedNotification(String deviceToken) async {
    const title = 'Application Approved';
    const body = 'Your application has been approved';

    await sendPushMessage(deviceToken, title, body, 'approved');
  }

  Future<void> sendApplicationDeclinedNotification(String deviceToken) async {
    const title = 'Application Declined';
    const body = 'Your application has been declined';

    await sendPushMessage(deviceToken, title, body, 'declined');
  }

  Future<void> sendFundsAllocatedNotification(String deviceToken) async {
    const title = 'Funds Allocated';
    const body = 'Funds have been allocated to your application';

    await sendPushMessage(deviceToken, title, body, 'allocated');
  }
}
