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

class PartnerSelectionPage extends StatefulWidget {
  const PartnerSelectionPage({super.key});

  @override
  _PartnerSelectionPageState createState() => _PartnerSelectionPageState();
}

class _PartnerSelectionPageState extends State<PartnerSelectionPage> {
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

  Widget _buildBulletPoint(String text, double currentFontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: currentFontSize,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> list1 = [
      '∞ المظهر (النظافة والأناقة).',
      '∞ الثقة بالنفس.',
      '∞ الروح المرحة والفكاهة.',
      '∞ الإرادة القوية والإصرار على تحقيق الأهداف.',
      '∞ الغموض.',
      '∞ امتلاك قناعات وآراء خاصة.',
      '∞ الذوق في كل شيء، في انتقاء الأطعمة والمشروبات، في انتقاء الملبوسات...',
      '∞ مسحة من المستوى الثقافي.',
      '∞ الرومانسية.',
      '∞ الذكاء بصورة عامة والذكاء العاطفي بصورة خاصة.',
      '∞ المهارة والكفاءة الجنسية.',
      '∞ القدرة على التعبير عن الأشياء والآراء والأفكار والمواقف.',
      '∞ القدرة على رواية القصص والتحدث عن الأشياء المختلفة بطريقة مثيرة.',
      '∞ القدرة على التفاعل الاجتماعي وتكوين العلاقات العامة والصداقات.',
      '∞ الخبرات والكفاءات في المجالات المختلفة.',
      '∞ التميز عن الأقران.',
      '∞ حب المغامرة، الحماسة، الجرأة.',
      '∞ الصدق',
    ];
    final List<String> list2 = [
      '• ضعيف الشخصية',
      '• الكذاب والمخادع',
      '• البخيل',
      '• المهمل والفوضوي',
      '• الغيور',
      '• المتهور',
      '• المنغلق',
      '• غير الوفي',
      '• الذي لا يصغي إليها',
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
                      'المعايير الأنثوية في انتقاء الشريك',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الأشياء التي تجذب المرأة نحو الرجل هي امتلاك واحدة أو أكثر من الصفات التالية: وهي إما الغنى، أو السلطة والنفوذ، أو الشهرة، أو الموهبة، أو المنزلة الاجتماعية الرفيعة، أو الجمال، أو الشخصية، والشيء الذي نريد العمل عليه هنا هو الشخصية.',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(0),
                    const SizedBox(height: 20),
                    Text(
                      '1. سمات الشخصية التي تجذب المرأة:',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    ...list1.take(9).map((text) => _buildBulletPoint(text, _fontSize)).toList(),
                    _buildAdWidget(1),
                    ...list1.skip(9).map((text) => _buildBulletPoint(text, _fontSize)).toList(),
                    const SizedBox(height: 20),
                    Text(
                      '2. الشخصيات من الرجال التي لا تنجذب إليها النساء:',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    ...list2.map((text) => _buildBulletPoint(text, _fontSize)).toList(),
                    _buildAdWidget(2),
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