import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/src/features/admin/dashboard/admin_dashboard.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_binding.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:login_app/src/utils/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    );
  }
}
