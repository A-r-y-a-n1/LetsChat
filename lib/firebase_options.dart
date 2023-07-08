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
    apiKey: 'AIzaSyAs7lYyzWmi1I8ISYyTA7XGikxOhoL7Smo',
    appId: '1:226202253292:android:161ed6d54b26d39236f2c9',
    messagingSenderId: '226202253292',
    projectId: 'we-chat-49c64',
    storageBucket: 'we-chat-49c64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAD231OIGQ8AZULFxYA7YX98UKmPjzdVU',
    appId: '1:226202253292:ios:3c6d913d2151624d36f2c9',
    messagingSenderId: '226202253292',
    projectId: 'we-chat-49c64',
    storageBucket: 'we-chat-49c64.appspot.com',
    androidClientId: '226202253292-slbnv16vnotilc5s8p6eq1jfag76cngk.apps.googleusercontent.com',
    iosClientId: '226202253292-dcafiol0l5nfdglooouk85n5l1ct9jf5.apps.googleusercontent.com',
    iosBundleId: 'com.example.weChat',
  );
}