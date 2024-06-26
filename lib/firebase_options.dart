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
        return macos;
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
    apiKey: 'AIzaSyCM_pGt9RNz1IlObzVl3mUwTMnK8SqmXxg',
    appId: '1:311730437136:web:85f1b0b129330f99085e95',
    messagingSenderId: '311730437136',
    projectId: 'gatch-20a05',
    authDomain: 'gatch-20a05.firebaseapp.com',
    storageBucket: 'gatch-20a05.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfdNNwCFPv5xdzl-CN0OYKuY2KtJ7Fwr4',
    appId: '1:311730437136:android:17d02d2391aad1c0085e95',
    messagingSenderId: '311730437136',
    projectId: 'gatch-20a05',
    storageBucket: 'gatch-20a05.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZcGt4G2t8jKqSpvKJixo_c5spXmSI50I',
    appId: '1:311730437136:ios:a78f9895e42077ae085e95',
    messagingSenderId: '311730437136',
    projectId: 'gatch-20a05',
    storageBucket: 'gatch-20a05.appspot.com',
    iosClientId: '311730437136-8h7tl7oraf7iejvthtip2r5m5alnjkbr.apps.googleusercontent.com',
    iosBundleId: 'com.example.tinderGamer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZcGt4G2t8jKqSpvKJixo_c5spXmSI50I',
    appId: '1:311730437136:ios:a78f9895e42077ae085e95',
    messagingSenderId: '311730437136',
    projectId: 'gatch-20a05',
    storageBucket: 'gatch-20a05.appspot.com',
    iosClientId: '311730437136-8h7tl7oraf7iejvthtip2r5m5alnjkbr.apps.googleusercontent.com',
    iosBundleId: 'com.example.tinderGamer',
  );
}
