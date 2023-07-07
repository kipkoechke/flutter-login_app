import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/src/features/admin/dashboard/admin_dashboard.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_binding.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:login_app/src/utils/theme/theme.dart';

// Listening to the background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

FirebaseMessaging messaging = FirebaseMessaging.instance;
// RxString deviceToken = RxString('');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    messaging.getInitialMessage();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    Get.put(AuthenticationRepository());
  });

  // try {
  //   deviceToken.value = (await messaging.getToken())!;
  //   print('Device Token: ${deviceToken.value}');
  // } catch (e) {
  //   print('Error retrieving device token: $e');
  // }

  runApp(const MyApp());
}

// class InitialBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.put(AuthenticationRepository());
//     Get.put(deviceToken, permanent: true);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const AdminDashboardScreen(),
          binding: ApplicationStatusBinding(),
        ),
      ],
      // initialBinding: InitialBinding(),
    );
  }
}
