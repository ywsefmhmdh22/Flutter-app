import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

// --- هذا هو الكود الفعلي لـ BannerAdWidget المُعدّل ---
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

class BodyLanguagePage extends StatefulWidget {
  @override
  _BodyLanguagePageState createState() => _BodyLanguagePageState();
}

class _BodyLanguagePageState extends State<BodyLanguagePage> {
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

  // دوال لتحميل الإعلانات المدمجة
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
                          'لغة الجسد في الحب  ',
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '''
الإنسان مخلوق اجتماعي وليس مستغربًا وجود أكثر من طريقة للتواصل بين البشر، ولغة الجسد من أقدم أشكال التواصل هذه، فنحن نعبر عن رغباتنا ومشاعرنا الرئيسية كالخوف والحزن والقلق والسعادة والدهشة والانزعاج من خلال الإيماءات التي يصدرها جسدنا.

إيماءاتنا هذه تكون مهمة لأجل الآخرين، وتلعب دورًا كبيرًا في التأثير عليهم، بطريقة واعية أو غير واعية ينقل الإنسان عبر لغة جسده رسائل إلى الآخرين، تحليل الإشارات والإيماءات التي يطلقها جسد شخص ما من خلال التعبيرات المتنوعة عن المواقف والمشاعر المختلفة يكشف الأفكار والدوافع والنوايا والرغبات والمشاعر عنده، حتى وإن كان الشخص يتفوه بكلمات أخرى، فالجسم يكشف مشاعرنا الحقيقة، من نكون وماذا نريد بالفعل؟

في الحقيقة إن قراراتنا وتصرفاتنا توجه بصورة جزئية من قبل الوعي، أما اللاوعي فهو الذي يمارس بصورة غير معقولة الدور الأكبر في حياتنا، فنحن نتحدث بأيدينا وأرجلنا دون أن ندرك ذلك، نعبر عن أفكارنا ومشاعرنا من خلالها.

عمومًا تعتبر النساء أكثر قدرة من الرجال على قراءة لغة الجسد وفهم طبيعة العلاقات الاجتماعية التي تربط بين أفراد المجتمع في مكان ما، وهذا يعود إلى امتلاكهنَّ القدرة الفطرية على التقاط إيماءات وإيحاءات الجسم وفك رموزها، علاوة على تمتعهنَّ بالقدرة العالية على رصد أدق التفاصيل في لغة الجسد، وهذا ما يفسر عدم قدرة الكثير من الرجال على ممارسة أي نوع من الكذب عليهنَّ بسهولة.

إلى جانب قراءة لغة الجسد تدعم الكثير من النظريات العلمية فكرة قراءة الملامح الشخصية للإنسان، ويعتمد المبدأ على وجود علاقة بين شخصية الإنسان وملامح كل من وجهه وجسده. إن أكثر هذه النظريات واقعية هي أن عضلات الجسم والوجه تتخذ أشكالًا وفقًا لاستخداماتها، فعندما يبقى الإنسان عابسًا متكدرًا لفترة طويلة من الزمن -على سبيل المثال- فسيتغير شكل عضلات وجهه وتتخذ ملامح تعطي انطباعًا أنه شخص متشائم. الغريب حقًّا في دراسة العلاقة ما بين ملامح الإنسان وشخصيته، هو أن هذه العلاقة تسري في كلا الاتجاهين، أي كما أن لملامح الإنسان المقدرة على تحديد سمات شخصيته، فإن أي تعديل أو تغيير يطرأ على ملامحه، يقود إلى تغير في شخصيته، على سبيل المثال: النظر إلى الأرض بصورة دائمة يعتبر دلالة على شعور الإنسان بالحزن أو مؤشرًا على ضعف ثقته بنفسه، والجدير بالذكر أنه إذا أجبر الإنسان نفسه على رافع رأسه، فسيتحسن مزاجه وتزداد ثقته بنفسه. علاوة على ذلك فإن تبني الإنسان الإيماءات والإيحاءات الإيجابية في لغة جسده يولد مشاعر إيجابية وطيبة عند الآخرين ويسوقهم ليتعاملوا ويتفاعلوا معه بإيجابية أكبر.

هذا وتعتبر العين أقوى أدوات لغة الجسد، فهي تمثل أهم عناصر الاتصال غير المباشر بين البشر، فمن خلال نظرة العين يمكن للمرء أن يتعرف على ردود فعل الآخرين على رسائله سواء كانت ردودًا إيجابية أو سلبية. والعين هي أولى مفاتيح الشخصية لما تملكه من قدرة على نقل المعاني التي تدور في عقل الإنسان إلى آخر، سواء بإظهار الدهشة أو الخوف أو القبول أو الاعتراض وغيرها من الرسائل؛ وذلك من خلال إيماءاتها المختلفة.
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
أهمية تعلم لغة الجسد

يمكن للمرء في منتهى البساطة أن يتعلم لغة الجسد، وكل ما عليه فعله هو أن يتمرن على الأوضاع المختلفة للجسد والحالة الشعورية التي يمثلها كل وضع، بعد ذلك يكون من السهل التعرف على مشاعر الآخرين عبر مراقبة لغة أجسادهم، علاوة على ذلك يصبح من السهل عليه إعطاء الانطباع الذي يريده من خلال التحكم بلغة جسده، فمثلا إذا كنت تريد أن تشعر فتاة ما بأنك تحبها، فيجب أن تجسد لغة جسدك ذلك الحال، وستشعر هي تلقائيًّا أنك قد وقعت في حبها. المهم هنا هو أن تستفيد من استخدم لغة الجسد الإيجابية في جذب اهتمام المرأة، وإعطائها انطباعًا إيجابيًّا عنك وأن تتخلص من لغة الجسد السلبية، والتي تولد انطباعًا سلبيًّا عنك، وهذا سيجعل تواجدك مع النساء أكثر قبولًا وأريحية، وكذلك ستصبح أكثر قدرة على إقناعهنَّ بمشاعرك، فعندما تغير لغة جسدك للأفضل، ثق تمامًا أن النساء سوف تتعامل معك بطريقة أفضل، وسيكون تجاوبهنَّ معك أفضل. أنت الآن تعرفت على لغة الجسد وعرفت أن الفتيات قادرات على قراءتها بشكل فطري، فاحرص على أن لا تبدي لغة جسدك أشياء تؤثر عليك، معرفتك للغة الجسد تمكنك من معرفة وفهم الظروف والحالة النفسية التي تمر بها الفتاة وتقدير وضعها، كما أنها تكون فرصة لفتح حوار ناجح، فعندما تدلك لغة جسد الفتاة أنها تنتظر بقلق، يمكنك فتح حديث عن الانتظار وسيكون شيقًا بدلًا من أن تفتح حديثًا عن أشياء أخرى لا أهمية لها في هذه اللحظة بالنسبة لها.

اربط استخدم لغة جسدك الإيجابية في جميع المواقف مع لغتك اللفظية للتأثير عليها بصورة أفضل، فإذا كنت تهنئها بالنجاح في الامتحانات فأظهر الفرح لها في تعابير وجهك ولغة جسدك لتنقل لها شعورًا إيجابيًّا مضاعفًا.
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '''
علامات انجذاب المرأة وتوددها للرجل

هناك الكثير من العلامات على انجذاب المرأة وتوددها لرجل ما أو وقوعها في حبه، ولكن واحدة منها لا تكون كافية للحكم على مشاعر المرأة، بل لا بدَّ من تحقق عدة إيماءات أو علامات، ولا بدَّ من تكرار حدوثها، هذه العلامات أو الإيماءات قد لا تظهر دفعة واحدة، فمنها ما يكون مبكرًا ومنها ما يأتي فيما بعد، ومن هذه الإيماءات:
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '''
إلقاء نظرة جانبية مائلة للأعلى مع رفع الكتف قليلًا وإمالة الرأس وخفضه للأسفل فيما يشبه عملية اختلاس النظر، والتي توحي بمزيج من الخجل والرغبة في التقارب، وتترافق هذه النظرة عادة مع ابتسامة قصيرة وسريعة، ويمكن لعملية التلاقي البصري هذه أن تتكرر عدة مرات.
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
                    // هنا ضع الصورة الأولى
                    Image.asset('assets/image1.jpg'), // استبدل 'assets/image1.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
في وضعية الوقوف تميل بجسدها إلى أحد الجانبين لتعزيز الفرق بين محيط الحوض والخصر، وتميل برأسها بشكل خفيف إلى أحد . في الكتفين كاشفة عن عنقها، تقاطع ساقيها أثناء الوقوف وتحررهم باستمرار لجذب انتباهه نحوهما.
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
                    // هنا ضع الصورة الثانية
                    Image.asset('assets/image2.jpg'), // استبدل 'assets/image2.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
في وضعية الجلوس تجلس المرأة منتصبة، وتضع أحد الكاحلين خلف الآخر، أو تضع رجلًا على رجل مع الإشارة بالركبة الأعلى نحو الرجل موضع اهتمامها.
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
                    // هنا ضع الصورة الثالثة
                    Image.asset('assets/image3.jpg'), // استبدل 'assets/image3.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تقوم بمداعبة شعرها وإعادة تصفيفه بأصابعها، وربما تقوم بتحريك شعرها إلى الوراء بإحدى يديها أو كلتيهما بطريقة مغرية تظهر بها جزءًا من رقبتها.
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
                    // هنا ضع الصورة الرابعة
                    Image.asset('assets/image4.jpg'), // استبدل 'assets/image4.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تقوم بمداعبة الأقراط والحلي، تداعب الأشياء التي بحوزتها سيجارة، علبة دخان، قلم حمرة، قلم كتابة، تداعب عنق الزجاجة أو ساق كأس العصير، تفرك ساقها بساق الطاولة.
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
                    // هنا ضع الصورة الخامسة
                    Image.asset('assets/image5.jpg'), // استبدل 'assets/image5.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تقوم بتدليك عنقها ومسحه أو ملامسة إحدى كتفيها أو أسفل رقبتها بشكل طفيف، تفرك ذقنها أو خدها بأصابع يدها، تلعق أو تعض على شفتيها، تدخل ظفر إصبعها بين أسنانها.
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
                    // هنا ضع الصورة السادسة
                    Image.asset('assets/image6.jpg'), // استبدل 'assets/image6.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    // الإعلان الثاني
                    if (_isNativeAd2Loaded && _nativeAd2 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd2!),
                        ),
                      ),
                    
                    Text(
                      '''
تقوم بلمس الرجل محط إعجابها بشكل متكرر وعفوي وربما يكون بشكل مقصود مع تصاعد في مستوى اللمسات وغالبا ما تقوم بلمس يده أو ذراعه أو كتفه أو خده، كما تقوم بإعادة تسوية هندامه، وإزالة غبار وهمي عن كتفه.
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
                    // هنا ضع الصورة السابعة
                    Image.asset('assets/image7.jpg'), // استبدل 'assets/image7.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
يميل جسدها لجهة الشخص موضع اهتمامها في وضعية الوقوف أو الجلوس، وتميل لفتح ذراعيها، حيث تعمد المرأة إلى طي إحدى أو كلا ذراعيها أمام صدرها في حال وجودها مع شخص غير مرغوب أو عدائي في إيماءة منها لوجود حاجز بينهما.
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
                    // هنا ضع الصورة الثامنة
                    Image.asset('assets/image8.jpg'), // استبدل 'assets/image8.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تحاكي تعكس) وتجاري لغة جسده بشكل متناغم ولا إرادي، تضحك بالتزامن معه، هو يبدأ بجملة وهي تكملها.
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
                    // هنا ضع الصورة التاسعة
                    Image.asset('assets/image9.jpg'), // استبدل 'assets/image9.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تبتسم باستمرار في وجه، ومع كل ابتسامة يزداد بريق عينيها وتتسع حدقتهما حتى في الأماكن المضيئة، إن توسع حدقة العينين هو من أهم المؤشرات على وقوع المرأة في الحب حيث تتفاعل العين عند المرأة بشكل حساس مع الظروف العاطفية، وهذا يعطي الرجل نافذة على حياتها الداخلية.
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
                    // هنا ضع الصورة العاشرة
                    Image.asset('assets/image10.jpg'), // استبدل 'assets/image10.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
تستخدم بعض النساء إيماءة طبق الوجه في إشارة للتودد والرغبة في الحصول على الغزل، حيث تقوم بوضع مرفقيها على الطاولة ووضع اليدين تحت الذقن لتقدم وجهها بذلك للرجل وكأنه
موضوع على طبق
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
                    // هنا ضع الصورة الحادية عشرة
                    Image.asset('assets/image11.jpg'), // استبدل 'assets/image11.jpg' بمسار صورتك الحقيقي
                    const SizedBox(height: 20),
                    Text(
                      '''
إذا ما تأخر في الوصول إلى موعد اللقاء أو انقطعت أخباره فإنك سوف تراها متوترة، فهي تترقب وصوله أو سماع صوته بلهفة كبيرة.

■ تنتابها الغيرة عند محاولة امرأة أخرى التقرب منه، وتحاول أن تضع حدًّا لذلك كأن تقوم برمقها بنظرات غير ودية أو سحبه إلى مكان آخر.

■ تختبر مستوى اهتمامه بها من خلال الدخول في مساحته الشخصية، حيث تخطو داخل هذه المنطقة ثم تخطو  للخلف خارجها مرة أخرى، فإذا كان الرجل مهتمًا فإنه سيبقى في مكانه أو سيخطو داخل مساحتها الشخصية، وإذا رفض هذا التقدم فإنه سيخطو خطوة للخلف ليستعيد مساحته الشخصية.

■ تتصرف بطريقة متحدية، وتجلبه بطريقة ملعوبه إلى التحدي.

■ تنظر إلى كتفها بعد أن تمر من جانبه.

■ عندما يكون هناك عدة أشخاص في المكان تتركهم وتعود إلى الشخص موضع اهتمامها.

■ لا تودعه بعد انتهاء المحادثة، فيما يشبه دعوة خفية لكي يتبعها.

■ إذا كان الشاب موضع اهتمامها يريد أن يذهب إلى محل تجاري -على سبيل المثال- لبضع دقائق فإنها تنتظره حتى يعود.

■ تدعوه للانضمام إلى مجموعتها.
■ إذا كانت تقف معه، وأرادت أن تذهب لفترة قصيرة إلى مكان ما، فإنها تعود إليه بعد ذلك.

■ تحاول لفت انتباهه إليها، فتكون دائمة الحركة بالقرب منه، تغدو وتروح مرات عديدة من أمامه وربما تصطدم به بشكل طفيف.

■ تدير يدها بحيث يكون اتجاه باطن اليد أو المعصم نحوه أثناء تواجدها معه.

■ تقوم بالإطراء عليه أو مديحه.

■ عندما يقترب منها لا تبتعد عنه وهذا يعني أنها تشعر بمشاعر إيجابية جواره.

■ إذا كانت من المدخنين، فإنها تنفخ السيجارة باتجاهه مباشرة.

■ تنظر إليه في وجهه لمدة طويلة وباهتمام.

■ تنظر إليه كمن يحتاج إلى المساعدة.

■ تستند إلى الخلف وتضع ذراعيها خلف رقبتها أو رأسها، الأمر الذي يؤدي إلى بروز الصدر وظهور الإبط.

■ تحمر وجنتاها عندما يلمسها بعبارات عاطفية.

■ تتصرف بشكل خجول، بحيث تنظر إليه ثم تزيح نظرها إلى الجانب أو الأسفل.

■ تثبت نظرها عليه عندما يتحرك أمامها.

■ تميل برأسها إلى الجانب، فيما يوحي بالرغبة بإسناد رأسها إلى شخص ما.

■ تبحث عن وسيلة لإبقاء التواصل معه، كسؤاله عن رقم هاتفه أو بريده الإلكتروني أو الأماكن التي يتواجد فيها باستمرار.

■ تبحث عن سبب لتمضي معه المزيد من الوقت.
■ تضحك على نكته، حتى وإن لم تكن بهذا الجمال.

■ تنتبه إلى المتغيرات الجديدة عليه، كقصة شعر جديدة، موبايل جديد وغيرها.

بالإضافة إلى إيماءات وتعابير لغة الجسد عن مشاعر الحب عند المرأة هناك أيضًا  علامات  أخرى  تدل  على  انجذابها  ووقوعها  في  حب  الرجل  ومنها:

◙ تتفاعل بإيجابية مع محاولته التعرف عليها والتواصل معها.

◙ تختفي الحجج الواهية التي نسمعها عادة، مثل: لا أفكر الآن في الزواج، أريد أن أكمل دراستي أولًا، ليس لدي وقت... وغيرها.

◙ لا ترفض مبادرة التعارف ولا تقوم بالصد (ربما شيء يسير من التمنع والدلال الهش).

◙ لا تتردد في إعطائه إيميلها أو حتى رقم هاتفها الشخصي.

◙ لا تتردد في الرد على رسائله الإلكترونية أو اتصالاته الهاتفية.

◙ لا ترفض دعوته للخروج معه، بل على العكس تريد منه أن تدعوها لذلك.

◙ لا تجرح مشاعره، ولا ترى عيوبه، ولا تسيء إلى كرامته.

◙ تحاول من خلال أسئلتها استكشاف المزيد من المعلومات، عن نمط حياته، عن أفكاره وقناعاته، عن الأشياء التي يحبها، والأشياء التي لا يحبها، لتتوافق معه، بل إنها تتبنى أفكاره وقناعاته ومبادئه وتدافع عنها.

◙ تستخدم سلسلة من الأسئلة، التي يكون محتواها اختبارات للتحقق من مستوى معيشته، ومصادر دخله وأوضاعه المادية والاجتماعية.

◙ تشاركه في تخطيط مشاريع المستقبل وتتدارس معه الخطوات والصعوبات التي ستواجه هذه المشاريع وما يمكن فعله لأجل ذلك.
''',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    // الإعلان الثالث
                    if (_isNativeAd3Loaded && _nativeAd3 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd3!),
                        ),
                      ),
                    
                    Text(
                      '''
---
### علامات انجذاب الرجل وتودده للمرأة

في حين تميل المرأة إلى التصرف بحياء، وبشكل أنثوي مغرٍ، يميل الرجل إلى إبراز مظاهر رجولته وقوته، ومن هذه المظاهر:

□ يعمل الرجل على إنشاء تواصل بصري مع المرأة التي تثير إعجابه ويحافظ على هذا التواصل لفترة أطول من المعتاد والمألوف.

□ يبرز مظاهر الثقة بالنفس والتصرف المسيطر، كانتصاب الجسم، إبراز الصدر مع شفط البطن، سحب الكتفين إلى الخلف، رفع الرأس، فرد الجسم وأخذ مساحات في الوقوف والجلوس، تباعد القدمين، التحدث بصوت عميق وهادئ.

۝ إلى جانب هذه المظاهر هناك بعض المظاهر التي تكاد تكون مشتركة بين الرجل والمرأة ومنها:

□ يتوجه بجسده نحو المرأة مثار اهتمامه ويميل اتجاه قدمه الأمامية إلى جهة تواجدها.

□ إظهار تأنقه واعتنائه بمظهره حيث يقوم بإعادة ترتيب ملابسه، تفقد أزرار قميصه، ضبط ياقة قميصه، تعديل وضع رابطة عنقه، نفض غبار وهمي عن كتفه.

□ مداعبة شعره وإعادة تصفيفه بأصابع يده.

□ مداعبة الأدوات الموجودة بحوزته واللعب بها مثل ساعة اليد، القداحة، علبة السجائر، ميدالية أو علاقة المفاتيح.

□ يميل أثناء محادثته مع المرأة محط إعجابه إلى لمس يدها أو ذراعها أو كتفها بصورة خفيفة وعفوية غالبًا، وربما كان عمدًا في محاولة منه لإظهار الرغبة في التقارب.

□ يعكس لغة جسدها بصورة لا إرادية.

[معرفتك لهذه العلامات تكشف لك واحدة من أقوى وأهم التقنيات التي سنستند إليها في الصفحات القادمة من الكتاب في تكتيك جذب الفتاة مثار الاهتمام، وذلك من خلال نقل واستقبال مشاعر الحب والاهتمام عبر لغة الجسد].
''',
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
      // --- Ad banner added here ---
      bottomNavigationBar: BannerAdWidget(),
      // ----------------------------
    );
  }
}