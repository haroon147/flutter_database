// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import "package:firebase_core/firebase_core.dart" show FirebaseOptions;
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
        return macos;
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
    apiKey: 'AIzaSyCUaTSkgq4tyBKtDsZ9YmYeCaCjYCiYCnI',
    appId: '1:469807269179:web:4de2acb7959abf8d87631e',
    messagingSenderId: '469807269179',
    projectId: 'fir-series-flutter-d8d0f',
    authDomain: 'fir-series-flutter-d8d0f.firebaseapp.com',
    storageBucket: 'fir-series-flutter-d8d0f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADnKxAlbp1psZJ3Cc5Nt-MoRWv10f63-g',
    appId: '1:469807269179:android:234d3e78927ddba987631e',
    messagingSenderId: '469807269179',
    projectId: 'fir-series-flutter-d8d0f',
    storageBucket: 'fir-series-flutter-d8d0f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8JBiyl9cfnWIoBWMh7mtuByaXScLFljA',
    appId: '1:469807269179:ios:9b3ca9394cfe65b487631e',
    messagingSenderId: '469807269179',
    projectId: 'fir-series-flutter-d8d0f',
    storageBucket: 'fir-series-flutter-d8d0f.firebasestorage.app',
    iosBundleId: 'com.example.flutterDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8JBiyl9cfnWIoBWMh7mtuByaXScLFljA',
    appId: '1:469807269179:ios:9b3ca9394cfe65b487631e',
    messagingSenderId: '469807269179',
    projectId: 'fir-series-flutter-d8d0f',
    storageBucket: 'fir-series-flutter-d8d0f.firebasestorage.app',
    iosBundleId: 'com.example.flutterDatabase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUaTSkgq4tyBKtDsZ9YmYeCaCjYCiYCnI',
    appId: '1:469807269179:web:17c0bc534a20e52387631e',
    messagingSenderId: '469807269179',
    projectId: 'fir-series-flutter-d8d0f',
    authDomain: 'fir-series-flutter-d8d0f.firebaseapp.com',
    storageBucket: 'fir-series-flutter-d8d0f.firebasestorage.app',
  );

}