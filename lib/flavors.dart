enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Arena HQ Development';
      case Flavor.stg:
        return 'Arena HQ Staging';
      case Flavor.prod:
        return 'Arena HQ Production';
    }
  }

}
