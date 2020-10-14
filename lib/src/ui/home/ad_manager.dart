import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_admob/firebase_admob.dart';

class AdManager {
  static VoidCallback onAdClosed;
  static InterstitialAd interstitialAd;
  static BannerAd bannerAd;
  static bool adIsLoaded = false;
  static bool adIsReadyToShow = false;


  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
   // keywords: <String>['flutterio', 'beautiful apps'],
    nonPersonalizedAds: true,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1535161646056530~2907941230";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_ADMOB_APP_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8691691433";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_REWARDED_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static void initAdMob() {
   FirebaseAdMob.instance.initialize(appId: appId);
    interstitialAd = AdManager.buildAd()..load()
        .catchError((value) => print("adEvent"+value.toString()));
    //bannerAd = buildBannerAd()..load();

  }

  static BannerAd buildBannerAd(){
    return BannerAd(
      adUnitId: bannerAdUnitId,
      targetingInfo: targetingInfo,
      size: AdSize.banner,
    listener: (MobileAdEvent event){
      if(event == MobileAdEvent.loaded)
        bannerAd.show();
      if(event == MobileAdEvent.failedToLoad)
        bannerAd..load();

      print("adEventBanner" + event.toString());

    }
    );
  }

  static InterstitialAd buildAd() {
    return InterstitialAd(
        adUnitId: interstitialAdUnitId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded)
            adIsLoaded = true;
          else if (event == MobileAdEvent.failedToLoad)
            interstitialAd = buildAd()..load();
          else if (event == MobileAdEvent.closed){
            onAdClosed.call();
            interstitialAd = buildAd()..load();
          }
          else if (event == MobileAdEvent.opened)
            adIsLoaded = false;

          print("adEventInterst" + event.toString());
        })..load();
  }
}
