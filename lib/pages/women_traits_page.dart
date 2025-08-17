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

class WomenTraitsPage extends StatefulWidget {
  const WomenTraitsPage({super.key});

  @override
  _WomenTraitsPageState createState() => _WomenTraitsPageState();
}

class _WomenTraitsPageState extends State<WomenTraitsPage> {
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
1. النساء غير منطقيات

لا تأخذ المرأة على محمل الجد في كل ما تقوله وتفعله، فالنساء غير منطقيات، فالمرأة تتعامل وفق ما تشعر وتفكر به لحظتها وليس بالضرورة نتيجة تفكيرها العميق.
''',
      '''
---
2. النساء تميل إلى الملل

المرأة تميل إلى الملل وتبحث عمن يثيرها بصورة دائمة، تبحث عن الرجل الذي يملك الكثير من الطاقة والحيوية والاهتمامات والذي يستطيع أن يغير حياتها، تبحث عن تحول حقيقي نوعي في حياتها.
''',
      '''
---
3. النساء شكاكات

مهما كان الرجل مخلصًا في حبه وعاطفته تجاه المرأة، فإن الشك يبقى يراودها، يدفعها إلى البحث عما يؤكد شكها هذا باليقين، حتى وإن كنت تسوق لها الهدايا وتعبر عن حبك باستمرار يبقى للشك مكانه عندها.
''',
      '''
---
4. النساء فضوليات

النساء يجدن أنفسهن منجذبات للأشياء غير الاعتيادية، وهذه السمة يمكن أن تكون وصفة سحرية ناجحة لجذب المرأة من خلال تقنية إثارة الفضول والتي سأشرحها لك لاحقًا.
''',
      '''
---
5. النساء مقيدات

النساء ممزقات هنا وهناك، بين التربية وما يقوله لهنَّ عقلهنَّ، بين ما يردن وما تربين عليه، بين الصح والخطأ، بين منظور المجتمع ورؤيتهنَّ الشخصية للأمور.
''',
      '''
---
6. النساء مترددات

المرأة يغلب عليها طابع التردد والصعوبة في اتخاذ القرارات وحسم الأمور بسرعة، فالنساء لا يعرفن ماذا يردن، لذلك تراهنَّ يتأرجحن بين هذا وذاك، في كل ساعة لهنَّ رأي، يقلن شيئًا ولكنهنَّ يفعلن شيئًا آخر مختلفًا تمامًا في المستقبل.
''',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.pink.shade100,
          automaticallyImplyLeading: false, // لا تظهر زر الرجوع الافتراضي
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context); // للرجوع للصفحة السابقة
                    },
                  ),
                  Expanded(
                    child: Text(
                      'صفات النساء',
                      style: const TextStyle(
                        fontFamily: 'Amiri', // تأكد من إضافة الخط في pubspec.yaml
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl, // تحديد اتجاه النص من اليمين لليسار
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // للتعامل مع النصوص الطويلة
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.zoom_out, color: Colors.pink.shade700),
                          onPressed: _decreaseFontSize,
                        ),
                        IconButton(
                          icon: Icon(Icons.zoom_in, color: Colors.pink.shade700),
                          onPressed: _increaseFontSize,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                    _buildAdWidget(2),
                    Text(textParts[5], style: _textStyle),
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