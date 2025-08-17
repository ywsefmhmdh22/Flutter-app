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

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  double _fontSize = 16.0;

  final String _adUnitId = 'ca-app-pub-8081293973220877/5104529502';
  List<NativeAd?> _nativeAds = List.filled(4, null);
  List<bool> _isNativeAdLoaded = List.filled(4, false);

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
يمكن للطلب من المرأة أن يتم باستخدام أكثر من طريقة:

1) استخدم أسلوب الأمر:
(النساء يجذبها أن تكون منقادة من قبل الرجال الأقوياء).
أمثلة:
♫- تعالي غدًا لنحضر سويًّا فيلمًا في السينما.
♫- حضري نفسكِ لنزور حديقة الحيوان السبت القادم.
♫- سأصطحبكِ معي في نزهة الخميس القادم.
''',
      '''
ولإضفاء شيء من التلطيف على هذه الطريقة تستطيع أن تقول لها:
♫- بما أنكِ لستِ منشغلة غدًا، إذن تعالي لنحضر سويًّا فيلمًا في السينما.
♫- بعد هذا الأسبوع المليء بالضغوط، يجب أن نرفه عن أنفسنا قليلًا، حضري نفسكِ لنزور حديقة الحيوان السبت القادم.
♫- لقد كنت منشغلًا طوال الأسبوع الماضي ولكني لم أنساكِ، حضري نفسكِ سأصطحبكِ معي في نزهة الخميس القادم.
''',
      '''
2) استخدم طريقة السؤال المتلاعب:
(أنت تعطي خيارين وعليها أن تختار أحدهما).
أمثلة:
♫- هل ترين أن نذهب لنتنزه قليلًا في الحديقة، أم أنكِ ترين أن نشرب شيئًا باردًا؟
♫- أرغب في أن نذهب لشرب القهوة معًا، ماذا يكون عندكِ الأسبوع القادم الأحد أو الاثنين؟
♫- أرغب في أن أراكِ مرة أخرى، ما رأيكِ أن يتم ذلك الخميس القادم أو ترين أن أتصل بكِ غدًا؟
''',
      '''
فكر عندما تطلب من الفتاة شيئًا، ماذا يمكن لها أن تجيب؟ عندما تعطيها خيارًا واحدًا، بالطبع لن تجد لنفسها سوى الرد بـ: (لا)، بالمثل يكون عندما تستخدم طريقة السؤال البديل، والتي من خلالها تعطي المرأة إمكانية الجواب بأنه لا يوجد لديها الرغبة أو الوقت لتمضيه معك.

ومن الأمثلة على طريقة السؤال البديل:
♫ هل أنتِ مستعجلة؟ أم أننا نستطيع أن نتحدث معًا لبعض الوقت؟
♫ هل تريدين أن تبقي لوحدكِ؟ أم أنني أستطيع الجلوس معكِ؟
♫ هل أنتِ منشغلة؟ أم أننا نستطيع الذهاب لنتمشى معًا قليلًا؟
''',
      '''
عندما تعطيها خيارًا واحدًا كأن تقول لها: ما رأيكِ أن نذهب لنشرب شيئًا؟ سيكون جوابها (لا). كذلك أيضًا عندما تستخدم طريقة السؤال البديل كأن تقول لها: هل أنتِ مستعجلة؟ أم أننا نستطيع أن نتحدث معًا لبعض الوقت؟ فأنت تعطيها خيارا أن تقول لك: لا، أنا مستعجلة. ولاكن
.عندما تستخدم طريقة السؤال المتلاعب فأنت تشترط بشكل ضامن وواثق بأن المرأة هكذا أو هكذا عندها كل الرغبة والوقت لتمضيه معك، وبأن الموضوع يتمحور فقط: بماذا ستمضي المرأة الوقت معك؟ فعندما تقول لها: ما رأيكِ أن نذهب لنتنزه قليلًا في الحديقة، أم أنكِ ترين أن نشرب شيئًا باردًا؟ سيكون أمامها خياران وغالبًا ستختار أحدهما، وكل منهما في صالحك، هذا لا يعني أن المرأة لن تقول: (لا)، ولكن هذا سيكون غير لائق ومهذب، وستحتاج هنا إلى عذر مقنع تبين لك من خلاله لماذا ترفض كلا العرضين.
''',
      '''
3 ) الاستشارة الملعوبة:

أنت تعرض شيئين، وتخبرها -على سبيل المثال- أن هناك حفلة طلابية أو مهرجانًا للتسوق يقامان في وقت واحد وبأنك ترغب أن ترى أحدهما، ولكنك مازلت مترددًا في القرار ثم تطلب استشارتها: أيًّا من الحدثين تنصحك أن تشاهد؟ أنت تجلبها أن تبدي رأيها، بعد أن تبدي رأيها وتضع الأسباب لذلك، أبلغها بأنها أقنعتك وبأنك تقترح عليها أن تشاهداه معًا.
''',
      '''
4 ) أن تضع لها سؤالًا تمهيديًّا غير مباشر:

أنت تسألها إذا ما كانت لا تتورع عن تجربة أي شيء جديد، تجربة مطعم جديد، ممارسة هواية جديدة، وعندما يكون جوابها بأنها بالفعل من هذا النوع من الناس الذين يحبون التعرف على أشياء جديدة تستطيع أن تقول لها: أنتِ قلتِ مؤخرًا بأنكِ لا تتورعين عن تجربة شيء جديد، في أول الحارة افتتحت صالة جديدة للبولينج، الصالة تبدو رائعة ومجهزة بصورة جيدة، دعينا نذهب ونجرب سويًّا لعبة البولينج
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
                      'طريقة الطلب من المرأة',
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
                    Text(textParts[0], style: _textStyle),
                    _buildAdWidget(0),
                    Text(textParts[1], style: _textStyle),
                    Text(textParts[2], style: _textStyle),
                    _buildAdWidget(1),
                    Text(textParts[3], style: _textStyle),
                    Text(textParts[4], style: _textStyle),
                    _buildAdWidget(2),
                    Text(textParts[5], style: _textStyle),
                    _buildAdWidget(3),
                    Text(textParts[6], style: _textStyle),
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