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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqUC0p3VyXRsovZsZdvPIfvm-KwiVrsxM',
    appId: '1:715302823125:web:22d0af0e5b0ef996786e5c',
    messagingSenderId: '715302823125',
    projectId: 'asuku-notes',
    authDomain: 'asuku-notes.firebaseapp.com',
    storageBucket: 'asuku-notes.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCB8hK9R36pabKtHyD-HoWGKw0Q58kuB4',
    appId: '1:715302823125:android:c5a7874ad783db84786e5c',
    messagingSenderId: '715302823125',
    projectId: 'asuku-notes',
    storageBucket: 'asuku-notes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTcPRUKKv4DzLBqI1BTzvHxKXENnN8wbM',
    appId: '1:715302823125:ios:007c500b4aed4c4e786e5c',
    messagingSenderId: '715302823125',
    projectId: 'asuku-notes',
    storageBucket: 'asuku-notes.appspot.com',
    iosClientId: '715302823125-n38ojr6v81ti056qokf21pgisp91on4t.apps.googleusercontent.com',
    iosBundleId: 'me.asuku.mynotes',
  );
}
