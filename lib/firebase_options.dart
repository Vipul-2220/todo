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
    apiKey: 'AIzaSyDqeZVnVDOhlVthBLxE8z_EsJJhX_luhBE',
    appId: '1:151389745993:web:60def17ba214c317316098',
    messagingSenderId: '151389745993',
    projectId: 'todo-ed08e',
    authDomain: 'todo-ed08e.firebaseapp.com',
    storageBucket: 'todo-ed08e.appspot.com',
    measurementId: 'G-CE8SNTT788',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuCvffK0mn3TqgcLXDjuHwzgcrgozsZE4',
    appId: '1:151389745993:android:cbb39c6583810801316098',
    messagingSenderId: '151389745993',
    projectId: 'todo-ed08e',
    storageBucket: 'todo-ed08e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBREWENqcA6RsD0k9GLYe4NEhxuzkwVCbY',
    appId: '1:151389745993:ios:b5be91b525a2e7d4316098',
    messagingSenderId: '151389745993',
    projectId: 'todo-ed08e',
    storageBucket: 'todo-ed08e.appspot.com',
    iosClientId: '151389745993-dp98sq57mrkjiltmi6aah0cuh39p93vo.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBREWENqcA6RsD0k9GLYe4NEhxuzkwVCbY',
    appId: '1:151389745993:ios:b5be91b525a2e7d4316098',
    messagingSenderId: '151389745993',
    projectId: 'todo-ed08e',
    storageBucket: 'todo-ed08e.appspot.com',
    iosClientId: '151389745993-dp98sq57mrkjiltmi6aah0cuh39p93vo.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}