import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart';

// --- هذا هو الكود الفعلي لـ BannerAdWidget المعدل ---
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
    // *هذا هو الجزء الذي تم تعديله*
    // نستخدم getAnchoredAdaptiveBannerAdSize لحساب حجم الإعلان التكيفي
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
// ------------------------------------------

class ConversationTipsPage extends StatefulWidget {
  const ConversationTipsPage({super.key});

  @override
  _ConversationTipsPageState createState() => _ConversationTipsPageState();
}

class _ConversationTipsPageState extends State<ConversationTipsPage> {
  double _fontSize = 16.0;

  // تعريف الإعلانات المدمجة
  NativeAd? _nativeAd1;
  NativeAd? _nativeAd2;
  NativeAd? _nativeAd3;
  bool _isNativeAd1Loaded = false;
  bool _isNativeAd2Loaded = false;
  bool _isNativeAd3Loaded = false;

  final String adUnitId = 'ca-app-pub-8081293973220877/5104529502';

  @override
  void initState() {
    super.initState();
    // تحميل الإعلانات المدمجة عند تهيئة الصفحة
    _loadNativeAd1();
    _loadNativeAd2();
    _loadNativeAd3();
  }

  // دوال لتحميل الإعلانات
  void _loadNativeAd1() {
    _nativeAd1 = NativeAd(
      adUnitId: adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isNativeAd1Loaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _nativeAd1?.dispose();
        },
      ),
    )..load();
  }

  void _loadNativeAd2() {
    _nativeAd2 = NativeAd(
      adUnitId: adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isNativeAd2Loaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _nativeAd2?.dispose();
        },
      ),
    )..load();
  }

  void _loadNativeAd3() {
    _nativeAd3 = NativeAd(
      adUnitId: adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isNativeAd3Loaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _nativeAd3?.dispose();
        },
      ),
    )..load();
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
  void dispose() {
    _nativeAd1?.dispose();
    _nativeAd2?.dispose();
    _nativeAd3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
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
                          'نصائح لأجل المبادرة بالتعارف',
                          style: TextStyle(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
1 ) اختر إحدى الطرق الصحيحة في المبادرة بالتعارف والمبادرة بالمحادثة وفقًا للأنسب للوضع أو الحالة. 

2 ) تعامل معها وكأنك لا تريد منها علاقة، حيّد الرغبة في العلاقة، وأبدِ أن رغبتك هي فقط الحديث معها لا أكثر، ما الذي تحققه هنا؟ كسر حاجز الجليد بينكما، توليد الشعور بالألفة والأمان، موضوع مشترك أو أكثر للقاءات القادمة.

3 ) تعامل معها وكأنها شخص عادي، تعامل معها وكأنك تعرفها من قبل.
4 ) تعامل معها وكأنها فتاة عادية، لا تعطِ أهمية أو اهتمامًا لجمالها إطلاقًا، لا تنظر إلى مفاتنها، لا تذكر أي شيء يتعلق بجمال مظهرها في حوارك معها أبدًا. 

5 ) ادخل من مبدأ معرفة عادية لتجعلها في موضع تقييمك، بدلًا من أن تكون هي من تقيمك. 

6 ) لا تستعمل الطلب الصريح بالتعارف، لا تتطرق إلى الغزل والحب والجنس.

7 ) كلما استمرت المحادثة أطول، كلما بدأت الفتاة تشعر بالارتياح ناحيتك، في بداية المحادثة لا تعطِ اهتمامًا مباشرًا بالفتاة بل على شيء في حوزتها، كتاب أو لابتوب تحمله الفتاة، وعندها يمكنك أن تقول لها: إنك ترغب أن تشتري مثله، أو على شيء في المحيط، شِجار أو إعلان أو حفلة. لا تتطرق إلى السؤال عن معلومات شخصية عن الفتاة حتى تلاحظ بدء التجاوب والتفاعل في المحادثة. 
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    // الإعلان الأول
                    if (_isNativeAd1Loaded && _nativeAd1 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd1!),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      '''
8 ) خلال المحادثة قم بفتح مواضيع عامة بسيطة وواضحة -مثال على ذلك: ماذا تعملين أو تدرسين؟ طبيعة عملها وفي أي مؤسسة تعمل، اسم الجامعة التي درست أو تدرس فيها، حاول أن يكون اللقاء الأول ممتعًا مع شيء من المزاح والفكاهة.

9 ) من الأشياء التي يجب أن تنتبه إليها هي أن لغة جسد الفتاة ستتغير خلال مجرى المحادثة، فقد تكون الفتاة في بداية المحادثة حذرة، ولكن بعد بضع دقائق سيتسنى لك أن تتجاوز عدم الثقة بينكما، وعندها ستلاحظ أن التواصل البصري بينكما أصبح شيئًا فشيئًا أطول، وبأنها أصبحت أكثر ارتياحًا في وجودك وغالبًا ما تبتسم.
 
10 ) حفزها قدر المستطاع للتكلم عن نفسها، قم بالإصغاء والاستماع إليها بشيء من الاهتمام لما تقول، ووافقها على كل شيء تقوله، ولا تقاطعها في الحديث، أعطها الوقت الكافي للحديث، عندما تدعها تتكلم عن نفسها أكثر فأكثر فأنت تمتص ترددها وخوفها شيئًا فشيئًا، وعندها ستشعر بالارتياح لك، وتتقرب منك أكثر فأكثر.

11 ) إن لم تكن قد قدمت نفسك في بداية التعارف فإنه بإمكانك أثناء الحديث أن تقول لها: على فكرة، اسمي منير -على سبيل المثال- فهذا سيحفزها لإعطاء اسمها بصورة عفوية وسريعة. بعد معرفتك باسمها يجب أن لا تنساه لتناديها به طوال المحادثة، فالاستخدام المتكرر للاسم أثناء المحادثة يخلق نوعًا من المودة والتقارب والانسجام بين المتحدثين. أيضًا يمكنك أن تقوم بإطراء اسمها كأن تقول لها: اسمكِ رائع وجميل، كما يمكن أن يكون اسمها موضوعًا لحديث كأن تسألها: من اختار لكِ هذا الاسم الجميل؟ فإذا أخبرتك أن أمها هي من اختارت الاسم، فيمكنك أن تقول لها: يبدو أن أمكِ إنسانة تملك ذوقًا رفيعًا، ويمكنك أن تقول لها: هل تعرفين أصل هذا الاسم وما معناه؟ (إذا ما كنت تملك دراية حول معاني الأسماء فيمكنك أن تخبرها بذلك، فهذا سيعطي صورة بأنك تملك ثقافة مميزة).
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    // الإعلان الثاني
                    if (_isNativeAd2Loaded && _nativeAd2 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd2!),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      '''
12 ) إنهاء المحادثة: في نهاية المحادثة استأذن بالانصراف وقل لها: المعذرة على الإزعاج، أنا يجب أن أذهب، أنا سعيد جدًّا بالحديث معكِ والتعارف عليكِ آنسة سمر (اسمها)، ثم انصرف وأنت تنظر إليها نظرة وداع مع ابتسامة خفيفة.

13 ) عندما تتقرب منها باستمرار وتتكلم معها في مواضيع عامة دون التطرق إلى  الرغبة في علاقة تشعر هي بأنك تستلطفها وتنجذب إليك وتستلطفك، وكنصيحة:  تحاشَ الطريقة المباشرة في التعامل مع النساء في جميع المراحل والخطوات.

ملاحظة ختامية: لا بدَّ للشاب من التأكد أن المكان مناسب للتعارف، ويخلق جوًا من الارتياح عند البنت، كذلك الأمر يجب اختيار الوقت المناسب، لأجل التعارف واللقاءات، فالتعارف يكون أفضل في الطقس الجميل والمناسبات السعيدة كالأعياد والأفراح والأعراس والنجاحات، حيث إن الطقس الجميل والمناسبات السعيدة تولد مشاعر إيجابية وانفتاح عند الناس، في حين أن الناس تكون في الطقس الرديء وأوقات الامتحانات عادة متوترة ومنغلقة، أيضًا الحالة الفيزيولوجية والنفسية للمرأة، فالشخص ذو المزاج الجيد يكون الاقتراب منه والحديث معه أسهل ويمكن معرفة مزاج الفتاة من ملامح الوجه ولغة الجسد.
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    // الإعلان الثالث
                    if (_isNativeAd3Loaded && _nativeAd3 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd3!),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // --- Ad banner added here ---
      bottomNavigationBar: BannerAdWidget(),
      // ----------------------------
    );
  }
}