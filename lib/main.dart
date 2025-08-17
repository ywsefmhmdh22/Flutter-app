import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';

// استيراد الصفحات
import 'sections_page.dart';
import 'About_Page.dart';
import 'RelationshipPath_Page.dart';
import 'tip_Page.dart';
import 'attract_page.dart';
import 'pdfbook_page.dart';
import 'experience_page.dart';
import 'intellectual_property_page.dart';
import 'privacy_policy_page.dart';
import 'report_problem_page.dart';
import 'topics_page.dart';
import 'online_topics_page.dart';
import 'ContactUs_Page.dart';
import 'app_open_ad_manager.dart';

// مُعرف إعلان فتح التطبيق
const String appOpenAdUnitId = "ca-app-pub-8081293973220877/3843434636";

// مُعرف الإعلان المدمج
const String nativeAdUnitId = "ca-app-pub-8081293973220877/5104529502";

AppOpenAd? myAppOpenAd;

Future<void> loadAppOpenAd() async {
  await AppOpenAd.load(
    adUnitId: appOpenAdUnitId,
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        myAppOpenAd = ad;
        myAppOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        print('فشل تحميل إعلان فتح التطبيق: \$error');
      },
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await loadAppOpenAd();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الكتاب',
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes: {
        '/sections': (context) => const SectionsPage(),
        '/about': (context) => const AboutPage(),
        '/relationship': (context) => RelationshipPathPage(),
        '/tip': (context) => const TipsPage(),
        '/attract': (context) => AttractPage(),
        '/pdf': (context) => const PDFBookPage(),
        '/experience': (context) => ExperiencePage(),
        '/intellectual_property': (context) => const IntellectualPropertyPage(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
        '/report_problem': (context) => const ReportProblemPage(),
        '/topics': (context) => TopicsPage(),
        '/OnlineTopics': (context) => OnlineTopicsPage(),
        '/ContactUs': (context) => ContactUsPage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sections');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'الدخول للتطبيق',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// إعلان بانر
class BannerAdWidget extends StatefulWidget {
  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: "ca-app-pub-8081293973220877/5841556409",
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Ad failed to load: \$error');
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded) {
      return Container(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: _bannerAd),
      );
    } else {
      return const SizedBox();
    }
  }
}

// إعلان مدمج (Native Ad)
class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _nativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'adFactoryExample',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _nativeAd = ad as NativeAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('فشل تحميل الإعلان المدمج: \$error');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _nativeAd != null) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: AdWidget(ad: _nativeAd!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}