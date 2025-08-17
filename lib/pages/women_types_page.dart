import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // يمكنك إزالته إن لم يكن ضروريًا
// import '../main.dart';

// BannerAdWidget with real ad functionality
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

class WomenTypesPage extends StatefulWidget {
  const WomenTypesPage({super.key});

  @override
  _WomenTypesPageState createState() => _WomenTypesPageState();
}

class _WomenTypesPageState extends State<WomenTypesPage> {
  double _fontSize = 16.0;

  final String _adUnitId = 'ca-app-pub-8081293973220877/5104529502';
  List<NativeAd?> _nativeAds = List.filled(6, null);
  List<bool> _isNativeAdLoaded = List.filled(6, false);

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
الكثير من الرجال يتعاملون مع النساء وكأنهنَّ نوع أو نمط واحد، لكن الحقيقة هي أن النساء أنواع مختلفة مثل الرجال، ومنهنَّ من لا يكنَّ جاهزات للتعارف على الرجل وإقامة علاقة عاطفية معه، كما أن التعرف على نوع الفتاة، يمكننا من وضع إستراتيجية للتعامل معها، فالفتاة الجميلة -على سبيل المثال- تتفاعل غالبًا بصورة سلبية مع الغزل المبكر وبصورة أفضل مع الإغاظة، والفتاة الباردة تحتاج فترة زمنية وصبرًا كبيرًا حتى يتولد في داخلها الحب والاهتمام تجاه الرجل، أما الفتاة المدللة فتحتاج في علاقتك معها إلى الكثير من المال، المجاملات، الكلام المنمق، تقديم الهدايا والزهور، علاوة على ذلك فإن هذه النوعية من النساء تميل بسرعة إلى الملل، وعليه فيتوجب عليك أيضًا أن تملك الكثير من الطاقة والإبداع، ليكون بإمكانك إخراجها من جو الملل، وجلبها إلى طريق الاعتماد على الذات وتحمل المسؤولية.
''',
      '''
1. الشرسة (غير الأليفة)

تسمى أيضًا بالقطة البرية أو المتوحشة، لا يمكن إخضاعها أو السيطرة عليها، هي تتصور حياتها بشكل مختلف، كما أن العمل لا يحقق لها أي شيء، بل على العكس، هي ترى أن العمل مزعج، العلاقات كارثية، الأوقات الجميلة معدومة، فما يتوجب عليك القيام به هو تحريرها من هذه القيود.
''',
      '''
2. المدللة

أنيقة، جذابة، تملك عناية كبيرة بذاتها، تهتم بالمظاهر، تملك كل ما تتمناه، ولديها فائض من المواد، أغراضها من النوعية عالية الجودة، لا تحبذ المحادثات العميقة والفلسفية، وتكون أميل للمحادثات البسيطة والخفيفة، تميل إلى الاستئثار أي حب الذات.
''',
      '''
3. المتخفية خلف جدار (الخجولة)

لا تحب أن تكون تحت الضوء، لا تثق بنفسها، تؤثر بشكل بارد خجول ومحتشم وبدون عاطفة، تملك مشاعر مركبة من الخوف والخجل، تخبئ عواطفها خلف جدار سميك، وتكون تمامًا كالقش الرطب الذي يحتاج وقتًا طويلًا ليشتعل، تتصرف بحياء شديد، تتكلم بصوت منخفض لا تكاد تفهم ما تقوله، يتحول غالبًا عدم يقينها هذا إلى تكبر.
''',
      '''
4. البريئة

جاذبيتها تأتي من براءتها وصفاء قلبها، تتميز بالبساطة والطيبة، ربما يرجع ذلك إلى كونها لم تمر بتجارب كثيرة في حياتها، فكل شيء بالنسبة لها جديد، تكون حذرة ومتشوقة، الكثير من الأشياء في حياتها لم تعشها سوى في الخيال.
''',
      '''
5. الخدومة

حنونة، تملك قلبًا أبيض، تحب الخير للآخرين، تفرح لفرحهم وتحزن لحزنهم، أصدقاؤها عندهم دائمًا مشاكل، تنجذب للمساعدة، تلعب دور المربية والمعلمة، تشعر بمتعة في مساعدة الآخرين، تعرض خدماتها على الآخرين دون مقابل، تقوم بمهام ليس من واجبها القيام بها، ما يجعلها حزينة هو أن لا تجد مشكلة لتقدم مساعدتها. يمكن تحفيزها عمومًا من خلال طلب المساعدة في مواضيع مختلفة.
''',
      '''
6. الضحية

تعرضت في فترة من حياتها لاستخدام العنف من قبل شخص ما، وعليه فهي تملك تجربة سيئة مع الرجال. يجب أن تبني درجة عالية من الثقة معها من جديد، فهي تحتاج الوقت لذلك، حيث تتكلم بقوة عن الصراحة.
''',
      '''
7. السلبية

ليس من السهل عمل تواصل مع هذا النوع من النساء، فهي تتعامل معك بأسلوب سلبي، وكأنك لم ترُق لها، غالبًا ما تجلس مع صديقاتها في مكان بعيد، وعندما تنظر إليها فإنها تحول نظرها بعيدًا، والأمر هنا لا يتعلق بعدم وجود اهتمام.
''',
      '''
8. المشاكسة

آراؤها وقناعاتها دائمًا معارضة، تفعل الأشياء بطريقة مخالفة لما يريده الشخص منها، إقناعها بشيء ما أمر صعب جدًّا، هذه النوعية من النساء مثيرة للأعصاب ولا يمكن التعامل معها.
''',
      '''
9. الجميلة

الفتاة الجميلة تحفز غالبية الرجال لاقتحام المخاطر، فهي بالتأكيد محط انتباه واهتمام الكثير منهم، نظراتهم تلاحقها في كل مكان، وهي تعرف أنها ستخسر يومًا سحرها، وأكثر ما يضايقها هو أن الرجال يتصرفون بوجودها كحمقى، لا تحب أن يحبها الرجال فقط لأمورها السطحية، هي تريد أن تُبدي أن هناك أيضًا تحت جمالها شخصية جذابة جدًّا.
''',
      '''
10. المقيدة

غالبًا تكون مع مجموعة من الصديقات، فالاقتراب منها لا يكون بهذه السهولة، هي تؤثر بطريقة حالمة، فهي فتاة تنتظر قدوم فارس أحلامها على ظهر حصان أبيض، كما في الروايات الرومانسية، إذا أردت التواصل معها، فمن خلال صديقاتها، وأنت يجب أن تقوم بالخطوة الأولى معها، عند المواعدة تحبذ أن تسمع منك أشياء رومانسية وخيالية والكثير الكثير من مشاعر الاهتمام والتفهم.
''',
      '''
11. اللعوب

من النوع المنفتح من النساء، تحب الحياة وتعيشها، مليئة بالطاقة والحيوية، لا يمكنها كبت بهجتها، هي رائعة، عندها تصرفات سلسة، تتحرك بخفة كالقطة، تستطيع أن تتعامل مع الرجال، عندها ثقة بنفسها، تحب المتعة، وتبحث عن الشخص الذي تستطيع بجواره أن تستمتع، تحب الرقص والمرح.
''',
      '''
12. الواثقة من نفسها

عادة ما تكون جميلة، ذكية، ناجحة مهنيًّا، معتزة بنفسها، متحررة، تمتلك ذوقًا عاليًا في اختيارها للأزياء والأكل والمشروبات والموسيقى، كي تتقرب منها يجب أن تبدو شخصية مماثلة، واثقًا بنفسك، معتزًا بذاتك، فالمال لا يمكن أن يملك تأثيرًا جذابًا على هذه النوعية من النساء.
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
                      'أنواع النساء',
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
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
                    Text(textParts[6], style: _textStyle),
                    _buildAdWidget(3),
                    Text(textParts[7], style: _textStyle),
                    Text(textParts[8], style: _textStyle),
                    _buildAdWidget(4),
                    Text(textParts[9], style: _textStyle),
                    Text(textParts[10], style: _textStyle),
                    _buildAdWidget(5),
                    Text(textParts[11], style: _textStyle),
                    Text(textParts[12], style: _textStyle),
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