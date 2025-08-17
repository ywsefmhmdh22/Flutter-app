import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // يمكنك إزالته إن لم يكن ضروريًا

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

class SpeechSkillsPage extends StatefulWidget {
  const SpeechSkillsPage({super.key});

  @override
  _SpeechSkillsPageState createState() => _SpeechSkillsPageState();
}

class _SpeechSkillsPageState extends State<SpeechSkillsPage> {
  double _fontSize = 16.0;

  final String _adUnitId = 'ca-app-pub-8081293973220877/5104529502';
  List<NativeAd?> _nativeAds = List.filled(2, null);
  List<bool> _isNativeAdLoaded = List.filled(2, false);

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
* مهارات الحديث هي أحد أهم المعايير للتميز في التعامل مع النساء، وأفضل وسيلة للتغلب على الخجل من النساء هو المواجهة والتحدث مع النساء، ربما تشعر بدايتًا بالخوف والتردد، ولكن مع مرور الوقت سيتبدد هذا الخوف ويتلاشى ويصبح أداؤك أفضل بكثير، كل ما عليك فعله في الحقيقة هو تجاهل هذه المشاعر.
''',
      '''
* وسع نطاق معارفك وثقافتك، فكل معلومة يمكن أن تكون فرصة لحوار مميز، ابحث بصورة مستمرة عن معلومات جديدة لتتعلمها، واستمتع بذلك، دَوِّن المعلومات المشوقة والتي يمكن الحصول عليها من المصادر المختلفة كالكتب والصحف والجرائد والتلفاز والإنترنت، فاطلاع الإنسان على أحدث التطورات العلمية في المجالات المختلفة يعطيه مواضيع مميزة لحوارات شيقة، فالقارئ والمطلع الجيد يستطيع أن يجري حوارًا ناجحًا في كل مناسبة ومع كل شخص.
''',
      '''
* مارس التخيل من خلال اختيار مواضيع مختلفة وإنشاء حوارات مع الذات، فالدماغ لا يملك القدرة على التمييز بين المعلومات الحقيقية التي اكتسبها في الحياة الواقعية وبين التخيل، فإذا كان هدفك هو التدريب على اكتساب مهارة في مجال التعامل مع النساء، فمارس التخيل بتطبيقك لهذه التقنية، وتخيل نفسك وأنت في هذا الموقف، ماذا تقول؟ وكيف تتصرف؟ وماذا سيكون رد فعل المرأة؟ وكيف ستتعامل مع ذلك؟
''',
      '''
* كوّن صداقات عديدة مع أشخاص من مستويات وأعمار مختلفة، فالتفاعل مع الأصدقاء ومشاركتهم الأنشطة المختلفة تسبك مهارات الحديث لديك.
''',
      '''
* لا تبقَ صامتًا في اللقاء مع الناس، تحدث وناقش في كل مجلس، وحاول أن تكون ذا حضور مميز، شارك في الفعاليات والأنشطة الاجتماعية الدائرة، شارك في الحوار الدائر، أبدِ آراءك، وأطلع الناس على معارفك، ربما تجد في البداية شيئًا من الصعوبة ولكن مرة بعد مرة سيصبح الحوار أمرًا بغاية اليسر، وستزداد ثقتك بنفسك، ويتعزز شعورك بأهميتك.
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black87),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'تقوية المهارات في الحديث',
                          style: const TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
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
                    Text(textParts[0], style: _textStyle),
                    _buildAdWidget(0),
                    Text(textParts[1], style: _textStyle),
                    Text(textParts[2], style: _textStyle),
                    _buildAdWidget(1),
                    Text(textParts[3], style: _textStyle),
                    Text(textParts[4], style: _textStyle),
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

  TextStyle get _textStyle => TextStyle(
    fontFamily: 'Amiri',
    fontSize: _fontSize,
    height: 1.6,
    color: Colors.black87,
  );
}