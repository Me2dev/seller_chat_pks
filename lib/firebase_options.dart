// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAZMmC10GfVCxRtZsDD3xBrRUaR4MCNmA8',
    appId: '1:661883036242:web:5c6fc36f2887cff92ef58b',
    messagingSenderId: '661883036242',
    projectId: 'pks-shop-8e9b2',
    authDomain: 'pks-shop-8e9b2.firebaseapp.com',
    storageBucket: 'pks-shop-8e9b2.firebasestorage.app',
    measurementId: 'G-DY7JRHX1BG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUnlwuTVBXL7qSEVnrEnftrIvLoLV9eLw',
    appId: '1:661883036242:android:b3966bccbf7464002ef58b',
    messagingSenderId: '661883036242',
    projectId: 'pks-shop-8e9b2',
    storageBucket: 'pks-shop-8e9b2.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZMmC10GfVCxRtZsDD3xBrRUaR4MCNmA8',
    appId: '1:661883036242:web:561a8debd22dd0f32ef58b',
    messagingSenderId: '661883036242',
    projectId: 'pks-shop-8e9b2',
    authDomain: 'pks-shop-8e9b2.firebaseapp.com',
    storageBucket: 'pks-shop-8e9b2.firebasestorage.app',
    measurementId: 'G-LZ2DW07E4L',
  );
}
