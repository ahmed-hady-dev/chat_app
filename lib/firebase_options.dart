// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCO7UgGZ5GDH9-Hi_uUbV2t7lD3kx-Qa0U',
    appId: '1:686363269770:android:da9ea480555e63e224eb73',
    messagingSenderId: '686363269770',
    projectId: 'chat-app-27367',
    storageBucket: 'chat-app-27367.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDizb1_73FJuOg8Mobqg5j1X6PrqZXXYIg',
    appId: '1:686363269770:ios:b6c2d1d97e9beb1e24eb73',
    messagingSenderId: '686363269770',
    projectId: 'chat-app-27367',
    storageBucket: 'chat-app-27367.appspot.com',
    iosClientId: '686363269770-q7vaa7i9513s2qd4lfm9vop69n1eq4tl.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
