import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  /// ضع هنا معرف إعلان فتح التطبيق من AdMob
  final String adUnitId = 'ca-app-pub-8081293973220877/3843434636';

  void loadAd() {
    AppOpenAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          print('✅ AppOpenAd loaded');
        },
        onAdFailedToLoad: (error) {
          print('❌ Failed to load AppOpenAd: $error');
        },
      ),
    );
  }

  void showAdIfAvailable() {
    if (_appOpenAd == null) {
      print('🚫 Tried to show ad before it was available.');
      loadAd();
      return;
    }

    if (_isShowingAd) {
      print('⚠ Already showing an ad.');
      return;
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('📺 Ad showed');
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        _appOpenAd = null;
        print('✅ Ad dismissed');
        loadAd(); // إعادة التحميل
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        _appOpenAd = null;
        print('❌ Failed to show ad: $error');
        loadAd(); // إعادة التحميل
      },
    );

    _appOpenAd!.show();
  }
}