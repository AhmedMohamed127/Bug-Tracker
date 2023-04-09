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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAj2o99UCVAW1uRVc4f1Ex6Wmso-hBqt7g',
    appId: '1:420703077648:web:66ae282e166eeb6ad7d195',
    messagingSenderId: '420703077648',
    projectId: 'blabla-bdc98',
    authDomain: 'blabla-bdc98.firebaseapp.com',
    storageBucket: 'blabla-bdc98.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGxRbLsOzFEfJvHWjoliJ4aWKC5TkSZDQ',
    appId: '1:420703077648:android:769c118e4ca9dfa9d7d195',
    messagingSenderId: '420703077648',
    projectId: 'blabla-bdc98',
    storageBucket: 'blabla-bdc98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHSL_BfvFMGNk-qtH-NrmzVYe8RaP-VO0',
    appId: '1:420703077648:ios:f9177dd028674934d7d195',
    messagingSenderId: '420703077648',
    projectId: 'blabla-bdc98',
    storageBucket: 'blabla-bdc98.appspot.com',
    iosClientId: '420703077648-u5puc8nmopfpv0soldpq1e0tj6v8ucgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );
}
