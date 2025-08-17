import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

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

class ShoppingDinnerInvitePage extends StatefulWidget {
  const ShoppingDinnerInvitePage({super.key});

  @override
  _ShoppingDinnerInvitePageState createState() => _ShoppingDinnerInvitePageState();
}

class _ShoppingDinnerInvitePageState extends State<ShoppingDinnerInvitePage> {
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
                      'الدعوه لتناول الغداء او العشاء',
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
                  children: [
                    Text(
                      '''
لا بدَّ من أن تسبقها دعوات أخرى، أقل التزامًا وأقل تكلفة مادية، كالدعوة إلى حدث أو فعالية أو نشاط ما، تتضمنها أو تليها الدعوة إلى تناول فنجان من القهوة أو أي مشروب آخر لمرة أو أكثر.
                      ''',
                      style: _textStyle,
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(0),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/dinner.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    _buildAdWidget(1),
                    const SizedBox(height: 20),
                    Text(
                      '''
◙ سمِّ للمرأة مطعمين ودعها تختار، إذا لم تقرر هي، فقرر أنت ولكن لا تخبرها بقرارك، بل اجعله مفاجأة.

◙ عندما تصل إلى المطعم ساعد المرأة في خلع معطفها، اختر لها مكان الجلوس في المطعم بحيث تكون موالية ظهرها لحائط أو حاجز صلب، فعندما يجلس المرء وظهره باتجاه مكان مفتوح، خاصة إذا كان هناك أشخاص يتحركون حوله يزداد الشعور بالتوتر لديه.

◙ يفضل أن تشكل وضعية جلوسك مع وضعية جلوسها على الطاولة في المطعم زاوية 45 كما في الصورة، كون هذه الوضعية أكثر أريحية حميمية للفتاة من وضعية التقابل.

◙ أما الدعوة للعشاء فبالإضافة لما ورد ذكره في الدعوة لتناول الغداء، فإنه يحبذ الذهاب إلى المطاعم التي تضع إضاءة خافتة مع موسيقى هادئة، حيث إن الإضاءة الخافتة تؤدي إلى اتساع حدقة العين عند كلا الطرفين، الأمر الذي يعطي انطباعًا بأن كلا منهما معجب بالآخر، كما أن الموسيقى الهادئة تؤدي إلى تهدئة الأعصاب والمشاعر. هذا وينصح بالجلوس في مكان تكون فيه رؤية الناس الآخرين غائمة ومشوشة بواسطة حجاب أو نباتات خضراء كبيرة حيث تخلق هذه الأجواء مناخًا رومانسيًّا.
''',
                      style: _textStyle,
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(2),
                    Text(
                      '''
◙ أنت تقرأ قائمة الوجبات وتقنعها بنوع من المقبلات ثم تسألها ماذا تريد أن تأكل أو تشرب وتطلب طبقًا لكل منكما.

◙ بينما تنتظران الطبقان فاجئها بهدية حضرتها لها؛ عقد، أو أي قطعة إكسسوارات أخرى، وقل لها: إنك سعيد أن تأكل هذا اليوم معها، عندما يأتي الطعام ناولها شوكة الطعام مع شيء من أكلك لتتذوقه وقل لها: إنها يجب أن تتذوقه، بالطبع أنت أيضا يجب أن تتذوق شيئًا من أكلها، إذا كانت غير راضية، فلا بأس، تعامل مع ذلك كلعبة وابتسم، أنت تعرف أنه فقط مجرد اختبار صغير.

◙ انتبه إذا كان كوب عصير الفتاة أصبح فارغًا واعرض عليها أن تملأه لها مجددًا.

◙ بعد تناول الطعام اقترح عليها نزهة تهضيم.

◙ في الوداع تقول لها: كم كان الوقت الذي أمضيناه معًا جميلًا وتودعها بابتسامة لطيفة.

◙ اتصل في اليوم التالي واسألها إذا كانت قد نامت جيدًا وبماذا حلمت.
                      ''',
                      style: _textStyle,
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

  TextStyle get _textStyle => TextStyle(
    fontFamily: 'Amiri',
    fontSize: _fontSize,
    height: 1.6,
    color: Colors.black87,
  );
}