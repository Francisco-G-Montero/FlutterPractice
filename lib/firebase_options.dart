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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQUxUmHpjtE0FpgKumMxJ3LqCYhFIXPgw',
    appId: '1:163174194805:android:82511562e1a9ab13ee623c',
    messagingSenderId: '163174194805',
    projectId: 'misapps-f221b',
    databaseURL: 'https://misapps-f221b-default-rtdb.firebaseio.com',
    storageBucket: 'misapps-f221b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5Y7c6CfAQAAZ2_iy-cOBo-PAOZEq-5NY',
    appId: '1:163174194805:ios:2fefbe320755f81bee623c',
    messagingSenderId: '163174194805',
    projectId: 'misapps-f221b',
    databaseURL: 'https://misapps-f221b-default-rtdb.firebaseio.com',
    storageBucket: 'misapps-f221b.appspot.com',
    androidClientId: '163174194805-9av2dgei591eho5raqbevt88lbhge5mk.apps.googleusercontent.com',
    iosClientId: '163174194805-2urin4uranubtthbm4kb9pp2cudrrbr5.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutter',
  );
}
