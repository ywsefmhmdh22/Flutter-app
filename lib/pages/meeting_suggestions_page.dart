import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// يمكنك حذف هذا السطر إذا لم يكن مطلوبًا
import 'package:maharat_jazb_alnisa/main.dart'; 

// --- هنا تم استبدال الكود بـ BannerAdWidget الفعلي والمعدل ---
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  final String _adUnitId = 'ca-app-pub-8081293973220877/5841556409'; // غير هذا بـ Ad Unit ID الخاص بإعلان البانر

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() async {
    //  *هذا هو الجزء الذي تم تعديله*
    //  نستخدم getAnchoredAdaptiveBannerAdSize لحساب حجم الإعلان التكيفي
    final AdSize? size = await AdSize.getAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).orientation,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      debugPrint('Unable to get adaptive banner size.');
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('BannerAd loaded.');
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    );
    _bannerAd!.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _bannerAd != null) {
      return SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
// ----------------------------------------------------

class MeetingSuggestionsPage extends StatefulWidget {
  const MeetingSuggestionsPage({super.key});

  @override
  _MeetingSuggestionsPageState createState() => _MeetingSuggestionsPageState();
}

class _MeetingSuggestionsPageState extends State<MeetingSuggestionsPage> {
  double _fontSize = 16.0;

  final String _adUnitId = 'ca-app-pub-8081293973220877/5104529502';
  List<NativeAd?> _nativeAds = List.filled(3, null);
  List<bool> _isNativeAdLoaded = List.filled(3, false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _nativeAds.length; i++) {
      _loadNativeAd(i);
    }
  }

  @override
  void dispose() {
    for (var ad in _nativeAds) {
      ad?.dispose();
    }
    super.dispose();
  }

  void _loadNativeAd(int index) {
    _nativeAds[index] = NativeAd(
      adUnitId: _adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('Native Ad #$index loaded.');
          setState(() {
            _nativeAds[index] = ad as NativeAd;
            _isNativeAdLoaded[index] = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Native Ad #$index failed to load: $error');
          ad.dispose();
        },
      ),
    );
    _nativeAds[index]!.load();
  }

  Widget _buildAdWidget(int index) {
    if (_isNativeAdLoaded[index] && _nativeAds[index] != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.pink.shade200),
          ),
          height: 100,
          child: AdWidget(ad: _nativeAds[index]!),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize = _fontSize + 2.0 < 24.0 ? _fontSize + 2.0 : 24.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize - 2.0 > 12.0 ? _fontSize - 2.0 : 12.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> textParts = [
      '''
♠ جولة على الأقدام في المدن الكبرى، أنتما يمكنكما أن تذهبا إلى الحديقة، هناك تريها أين تختبئ الأرانب، ماذا تسمى الأزهار، تروي لها قصة أي شاعر أو كاتب وفي أي منزل من هذه المدينة كان يسكن وماذا كتب.
''',
      '''
♠ الذهاب إلى المعارض والمتاحف، معارض الفنون بأنواعها، معارض الكتب، معارض الديكورات والمفروشات، معارض الأزياء، هناك يكون لديك فرصة للحديث عن الفنون، عن اللوحات الفنية، عن التحف الأثرية والآثار والحضارات الغابرة، عن الكتب والمؤلفين وقصص حياتهم وما كتبوه.
''',
      '''
♠ حضور المسرحيات والمهرجانات والحفلات الموسيقية والغنائية.
''',
      '''
♠ جولة في السوق (فالنساء تعشق التسوق)، هناك يمكن الحديث عن المنتجات المختلفة المعروضة.
''',
      '''
♠ من الأشياء الجميلة، أن تريا بعضكما البعض، أين تعيشان، الذكريات الجميلة المكثفة، الحارة، المدرسة، الروضة، اربطا المشاعر، بهذا تتعرفان على بعضكما البعض بشكل أكبر، وبذلك تحققان ذكريات جديدة تخصكما معًا، هذه الذكريات الجميلة سيكون لها دور كبير في بناء الثقة.
''',
      '''
♠ الذهاب إلى صالات الألعاب الترفيهية كصالات البلياردو والتنس والبولينج.
''',
      '''
♠ التنزه تحت أضواء النجوم، وهنا يمكن أن تختار أحد النجوم لتسميه باسمها وتختار هي نجما آخر بجانبه لتسميه باسمك، فالنساء متحمسات عندما يتحدث المرء عن المعاني في العالم.
''',
      '''
♠ اتفقا على اختيار باص أو سرفيس غير معين، واتفقا على النزول في محطة غير معينة أيضًا، هناك يمكنكما أن تتجولا في تلك المنطقة، وتستكشفان أشياء جديدة.
''',
      '''
♠ للأشخاص الذين يعيشون في المدن الساحلية، تكون الفرصة متاحة للتجول على شاطئ البحر، والتي تبعث على مزيد من الشعور بالانتعاش.
''',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.pink.shade100,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'بعض الاقتراحات لاجل لقاء مميز',
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.pink.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.zoom_in, color: Colors.pink.shade700),
                        onPressed: _increaseFontSize,
                      ),
                      IconButton(
                        icon: Icon(Icons.zoom_out, color: Colors.pink.shade700),
                        onPressed: _decreaseFontSize,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textParts[0],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(0),
                    Text(
                      textParts[1],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(1),
                    Text(
                      textParts[2] + textParts[3] + textParts[4] + textParts[5],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(2),
                    Text(
                      textParts[6] + textParts[7] + textParts[8],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}