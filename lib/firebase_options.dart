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
    apiKey: 'AIzaSyCPR2Zeyjjy388n7CT38dopaIu6yfUyJPQ',
    appId: '1:410935031541:web:ccb148a8ecf4b28e7937bc',
    messagingSenderId: '410935031541',
    projectId: 'clone-2-43296',
    authDomain: 'clone-2-43296.firebaseapp.com',
    storageBucket: 'clone-2-43296.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbaaJYA4zOobYsuILst_3VTo3-mKzTgtQ',
    appId: '1:410935031541:android:8a8ba967068e93397937bc',
    messagingSenderId: '410935031541',
    projectId: 'clone-2-43296',
    storageBucket: 'clone-2-43296.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_jVh5JbNqJrOeIs_p42HEvf-hQoDW-8o',
    appId: '1:410935031541:ios:38280518505a725d7937bc',
    messagingSenderId: '410935031541',
    projectId: 'clone-2-43296',
    storageBucket: 'clone-2-43296.appspot.com',
    iosBundleId: 'com.eagas.mobxremindersCourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_jVh5JbNqJrOeIs_p42HEvf-hQoDW-8o',
    appId: '1:410935031541:ios:475e3b100b78cfa47937bc',
    messagingSenderId: '410935031541',
    projectId: 'clone-2-43296',
    storageBucket: 'clone-2-43296.appspot.com',
    iosBundleId: 'com.eagas.mobxremindersCourse.RunnerTests',
  );
}