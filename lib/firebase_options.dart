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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4kuR_TpsOl3x77SEkOb7i4gmhXH6KQ3c',
    appId: '1:775073450454:android:97b7dcda6d27090e9bbc77',
    messagingSenderId: '775073450454',
    projectId: 'myteacherapplicatonadilayoub',
    storageBucket: 'myteacherapplicatonadilayoub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATJfSiRbHy5drGGAxKTXRHRIoQ4IJSLhg',
    appId: '1:775073450454:ios:8e37166b37ff34cf9bbc77',
    messagingSenderId: '775073450454',
    projectId: 'myteacherapplicatonadilayoub',
    storageBucket: 'myteacherapplicatonadilayoub.appspot.com',
    iosClientId: '775073450454-dl8fg5q26ope8gmh6jv3ol43qred4i3j.apps.googleusercontent.com',
    iosBundleId: 'com.adilayoub.myteacher',
  );
}
