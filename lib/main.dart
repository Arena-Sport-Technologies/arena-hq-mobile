import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {

  log('Flavor $appFlavor');

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  
  log("Initialising Firebase");
  FirebaseOptions fbOpt = F.firebaseOptions;

  WidgetsFlutterBinding.ensureInitialized();

  log('Got Firebase Options for ${fbOpt.appId}');
  await Firebase.initializeApp(options: F.firebaseOptions);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  log('Firebase initialised!');
  runApp(const App());
}
