import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7766966289151730~5394369664";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7766966289151730/5202797971";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7766966289151730/9180188547";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5550910872727485/4593365834";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}