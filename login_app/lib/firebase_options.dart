// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD72VmO4rP3sRPOYe46SxgAnJnMUWYaSqc',
    appId: '1:94976884411:android:9f7429709d81959579f39e',
    messagingSenderId: '94976884411',
    projectId: 'login-app-8a728',
    storageBucket: 'login-app-8a728.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQwA5GTeoSwYN03GVK_aGMw8pGFAnOtPs',
    appId: '1:94976884411:ios:e73823294a1f468179f39e',
    messagingSenderId: '94976884411',
    projectId: 'login-app-8a728',
    storageBucket: 'login-app-8a728.appspot.com',
    androidClientId: '94976884411-af453d9p2b0bdg3u8t7ift1cgundfsic.apps.googleusercontent.com',
    iosClientId: '94976884411-m70nntqcktp5ljtiu033qmk0vek8gf4m.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginApp',
  );
}
