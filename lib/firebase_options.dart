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
    apiKey: 'AIzaSyAitjH6iwPCGpxUmrsVDBXtFLZcAO3U_TY',
    appId: '1:57511358083:web:4120811e2638da678c35b6',
    messagingSenderId: '57511358083',
    projectId: 'authandauth7890',
    authDomain: 'authandauth7890.firebaseapp.com',
    storageBucket: 'authandauth7890.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEATI-_39YtRiyDiJl2PFPUnablCB2j0k',
    appId: '1:57511358083:android:53bff93a350941088c35b6',
    messagingSenderId: '57511358083',
    projectId: 'authandauth7890',
    storageBucket: 'authandauth7890.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHrZ61rHH8DCM_BuSMkd1bTEuzf9xxjXM',
    appId: '1:57511358083:ios:944e7b7c001590258c35b6',
    messagingSenderId: '57511358083',
    projectId: 'authandauth7890',
    storageBucket: 'authandauth7890.appspot.com',
    iosClientId: '57511358083-gas8737qh7sfud7ik93ba2l4nb172gof.apps.googleusercontent.com',
    iosBundleId: 'com.example.twentyfive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHrZ61rHH8DCM_BuSMkd1bTEuzf9xxjXM',
    appId: '1:57511358083:ios:944e7b7c001590258c35b6',
    messagingSenderId: '57511358083',
    projectId: 'authandauth7890',
    storageBucket: 'authandauth7890.appspot.com',
    iosClientId: '57511358083-gas8737qh7sfud7ik93ba2l4nb172gof.apps.googleusercontent.com',
    iosBundleId: 'com.example.twentyfive',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAitjH6iwPCGpxUmrsVDBXtFLZcAO3U_TY',
    appId: '1:57511358083:web:c9ac05ab04e7c0ac8c35b6',
    messagingSenderId: '57511358083',
    projectId: 'authandauth7890',
    authDomain: 'authandauth7890.firebaseapp.com',
    storageBucket: 'authandauth7890.appspot.com',
  );
}
