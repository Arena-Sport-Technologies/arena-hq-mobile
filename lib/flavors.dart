import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:arenahq_mobile/firebase_options_dev.dart' as dev;
import 'package:arenahq_mobile/firebase_options_stg.dart' as stg;
import 'package:arenahq_mobile/firebase_options_prod.dart' as prd;

enum Flavor { dev, stg, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    log('Get title  for $appFlavor');

    switch (appFlavor) {
      case Flavor.dev:
        return 'Arena HQ Development';
      case Flavor.stg:
        return 'Arena HQ Staging';
      case Flavor.prod:
        return 'Arena HQ Production';
    }
  }

  static FirebaseOptions get firebaseOptions {
    log('Get Firebase options for $appFlavor');

    switch (appFlavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.stg:
        return stg.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prd.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
