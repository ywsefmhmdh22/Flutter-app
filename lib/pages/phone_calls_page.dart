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

class PhoneCallsPage extends StatefulWidget {
  const PhoneCallsPage({super.key});

  @override
  _PhoneCallsPageState createState() => _PhoneCallsPageState();
}

class _PhoneCallsPageState extends State<PhoneCallsPage> {
  double _fontSize = 16.0;

  final String _adUnitId = 'ca-app-pub-8081293973220877/5104529502';
  List<NativeAd?> _nativeAds = List.filled(7, null);
  List<bool> _isNativeAdLoaded = List.filled(7, false);

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
تلجأ معظم الفتيات لإظهار بعض التمنع والذي لم تظهره في مراحل سابقة، كمرحلة اقتراب الشاب منها للتعارف عليها، أو مرحلة إعطاء رقم هاتفها أو بريدها الإلكتروني، فلا ترد على الاتصال، عندما ترى رقم هاتفك، كذلك الأمر بالنسبة لبريدك الإلكتروني، وربما ترد على ذلك بإظهار نوع من الانزعاج والتذمر والاستياء وقد ترد على إيميلك برسالة سلبية، تطلب منك من خلالها أن تدعها وشأنها وأن تبحث عن غيرها، أو تضع لك ذرائع واهية، تمنعها من متابعة التواصل معك. وللنساء دوافع متعددة من إعطاء أرقام هواتفهنَّ أو بريدهنَّ الإلكتروني، فمنهنَّ من تعطي الشاب رقم هاتفها بهدف التخلص منه، أو بهدف عدم إحراجه برد طلبه بصورة مباشرة، ومنهنَّ من ترغب بالتعارف بشكل أكبر عليه، وبعضهنَّ لديهنَّ هدف إسقاط الشاب وإحباطه ودفعه للجري خلفهنَّ طلبًا لمرضاتهنَّ، فهنَّ يجدن العلاقة مع الرجل كنوع من اللعب والإغاظة، بعض النساء يعتقدن أن إبداء شيء من الصد والتمنع يعطيهنَّ جاذبية أكبر كونهنَّ يصبحن صعبات المنال. علاوة على ذلك الاتصال الهاتفي المباشر مع الفتاة، يمكن أن يسبب لها في بعض الأحيان شيئًا من الإرباك، خاصة إذا ما كانت مشغولة، كأن تكون في مكان العمل أو في محاضرة أو زيارة أو لا تريد أن تتكلم، وهناك أحد من معارفها أو أقاربها في جوارها.
''',
      '''
ماذا تفعل إذا أجابك المجيب الآلي؟

هنا يجب أن تترك رسالة بالطبع، فما هي الرسالة التي يمكنك أن تتركها؟ على سبيل المثال: مرحبًا، أنا حسام لقد اتصلت بكِ وكنت أريد أن أقول لكِ شيئًا مهمًّا جدًّا، ولكن للأسف لم تكوني موجودة، أنا يجب أن أذهب اليوم مع أختي إلى المستوصف، هي يجب أن تجري بعض الفحوصات، عندما نرجع اليوم بعد العصر، سأحاول الاتصال بكِ مرة أخرى.

■ لا يجوز -بأي حال من الأحوال- أن ترجوها لمعاودة الاتصال بك مرة أخرى، بل سمي لها موعدًا مناسبًا لتعاود أنت الاتصال بها.

■ عندما تترك لها رسالة في صورة عبارة مثيرة للفضول تجعلها متحفزة للرد على اتصالك في المرة القادمة.
''',
      '''
توجيهات عامة لأجل كتابة الرسائل النصية (SMS).

لكي تترك الانطباع الإيجابي حولك، ولكي تحقق الهدف الذي تصبو إليه من الرسائل الهاتفية النصية، لا بدَّ من أن تتقيد بالنقاط التالية:

○ نعود إلى نفس القضية: التدرج في التقدم في العلاقة مع المرأة، تبادل أرقام الهواتف يمكن أن يؤمن لنا طريقتين للتواصل مع الفتاة وهي الرسائل الهاتفية النصية SMS والاتصال الهاتفي، طالما أن لدينا خيارين نختار الخيار الأصغر (أي الذي يشكل ضغطًا أقل على المرأة)، الاتصال الهاتفي يكون بالفعل كثيرًا، فنحن نحتاج إلى جسر بين تبادل أرقام الهواتف والاتصال الهاتفي، عبره نقوم بتهيئة المرأة للاتصال الهاتفي، هذا الجسر يكون SMS.
''',
      '''
○ في الواقع أنت تستطيع أن تكتب للمرأة أو تتصل بها في نفس اليوم الذي تعارفت فيه عليها، إذا كنت تعرف ما الذي يتوجب عليك القيام به؟ ليس المهم متى؟ ولكن المهم كيف؟

○ بالمثل بدلًا من أن تركز تفكيرك على السؤال، ماذا يجب أن أكتب؟ يكون السؤال الصحيح: أي مشاعر يجب أن تتركها عند المرأة؟ عندما تولد رسائلك تفاعلًا عاطفيًّا، يكون على المرأة تجاهله أصعب من أي شيء آخر، وعليه فإن أي عاطفة تكون أفضل من أي شيء آخر بلا عاطفة.
''',
      '''
○ تذكر أن المرأة التي تود التقرب منها، ربما تحصل على أعداد كبيرة من الرسائل اليومية، عبر الإيميل الشخصي، الفيس بوك، الرسائل الهاتفية النصية، السكايب وغيرها، إذا لم تكن رسائلك تحوي شيئًا مميزًا فلن تحظى باهتمام المرأة. لكي تحتفظ المرأة بك في الذاكرة ولكي تولد لديها مشاعر إيجابية قبل أن تتصل بها هاتفيًّا يجب أن تكتب لها شيئًا يجلبها على الضحك، أو شيئًا يجعلها تفكر فيك، شيئًا لا يتطلب الإجابة، ولكن يُمكن من الحصول على إجابة.

○ تجنب كتابة الرسائل النصية الاعتيادية التي تبعث على الملل مثل: مرحبًا، كيف حالكِ؟ كيف الصحة؟.... أو الرسائل المبكرة مثل: مرحبًا، أنا حسام، كنت...
أود أن أدعوكِ لتناول فنجان من القهوة في كافتريا الجامعة غدًا؟
○ لا يجوز أن تغرق المرأة بالرسائل، دع لها يومًا أو يومين بين كل محاولتين، ليتسنى لها الإمكانية أن ترد على رسائلك النصية الهاتفية، وهذا ينطبق بالطبع أيضًا على الاتصالات الهاتفية.

○ من الأخطاء الشائعة أيضًا، والتي يرتكبها الكثير من الشبان، هو التواجد بصورة دائمة للدردشة مع المرأة والرد على رسائلها الهاتفية النصية، للأسف الشديد على هذا النحو يؤثر الرجل بصورة غير جذابة على المرأة، هي ستسأل نفسها: أليس عند هذا الرجل اهتمامات أخرى؟ هوايات؟ عمل؟ أصدقاء؟ دراسة؟ كيف يمضي كل هذا الوقت كل يوم يتحدث عبر الشات أو الهاتف؟ وهذا الشيء لا ينطبق فقط على الرسائل الهاتفية النصية، بل أيضًا على الاتصالات الهاتفية وحتى المواعدة.
''',
      '''
○ وأخيرًا متى يكون الوقت المناسب للانتقال من المراسلة عبر الرسائل الهاتفية النصية إلى الاتصال الهاتفي؟ الجواب على النحو التالي: عندما تلاحظ أنها تتفاعل معك وترد على رسائلك وربما تغازلك اتصل بها، إذا كانت تجيب على رسائلك الهاتفية النصية بعد مضي بضعة أيام، حافظ على لعبة الرسائل الهاتفية النصية SMS.

كيف أرسل SMS يحقق الغرض المطلوب؟

في الحقيقة هناك طريقتان:

الطريقة الأولى: إرسال SMS يولد مشاعر عاطفية

مثال 1:

ترسل لها SMS تقول فيه -على سبيل المثال- : لقد نسيت المفاتيح في الغرفة عندما أغلقت الباب، لأنني كنت أفكر بكِ طوال الوقت، أنتِ تكونين سبب كسر باب الغرفة.

مثال 2:

أو ترسل لها SMS تقول فيه -على سبيل المثال- : اشتريت عقدًا لأختي الصغيرة كالعقد الذي رأيتكِ ترتدينه البارحة.
''',
      '''
الطريقة الثانية: إرسال SMS غريب ومثير للفضول

إرسال SMS يبدو أنه موجه إلى شخص آخر وقد وصل إليها بطريق الخطأ، فجميع النساء فضوليات ويردن أن يعرفن، ماذا تعني؟ وهل الرسالة موجهة إليهنَّ فعلًا أو إلى شخص آخر؟

مثال 1:

- أعرف أن السبت يكون عيد ميلاد أختي، أخبريها بأنني سأحضر غدًا.

مثال 2:

- لا تقلقي بشأن الكتاب، لقد أعدته الأسبوع الماضي إلى المكتبة.

مثال 3:

- أين كنتِ البارحة؟ اتصلت بكِ ثلاث مرات وأرسلت لكِ SMS ولم تردي، أمكِ اتصلت بي وسألتني عن مفاتيح السيارة.

مثال 4:

- أوراق معاملة عقد الإيجار في الحقيبة على ظهر الخزانة، لا تنسي أن تحضريها معكِ غدًا إلى الموعد مع المحامي.

ولنأخذ المثال الأخير ونرى كيف يمكن أن نبني عليه مراسلة:

أنت: أوراق معاملة عقد الإيجار في الحقيبة على ظهر الخزانة، لا تنسي أن تحضريها معكِ غدًا إلى الموعد مع المحامي.
هي: عفوًا، هل هذا SMS موجه لي أنا؟
أنت: بالطبع لكِ، لا تنسي أيضًا أن تخبري خالتي أننا حجزنا لكم معنا في شاليه على شاطئ البحر، خالتي طلبت منّي أن تخبرها بذلك.
هي: عفوًا، يبدو أنَّ هذا SMS جاءني بالخطأ.
أنت: ماريا ليس لدي وقت للمزاح، أنا مشغول جدًّا، أخبري والدتكِ أنَّ كل شيء على ما يرام، الشاليه على البحر جاهز في بداية الأسبوع القادم.
هي: ولكني لست بنت خالتك.
أنت: المعذرة، يبدو أنَّ خطأ ما قد حدث، ابنة خالتي تدعى أيضًا ماريا.
هي: لا يوجد مشكلة هذا يمكن أن يحدث مع كل شخص.
أنت: إذن من تكوني أنتِ؟ هل أنتِ الفتاة التي تعرفت عليها الأسبوع الماضي؟
هي: بالضبط.
أنت: حسنًا سأخزن رقم هاتفكِ تحت اسم آخر.
هي: هذا يكون أفضل.
أنت: مهلًا، ولكن ما يدريني أنَّكِ لستِ ابنة خالتي، وأنتِ تمازحينني طوال الوقت، سأتصل وأتأكد.
هي: أنا بالفعل لست ابنة خالتك، أنت لا تصدق، اتصل وتأكد.
''',
      '''
كيف تنقل المرأة من محادثة عبر الإنترنت إلى المحادثة الهاتفية؟

أنت لم تستطع أن تحصل على رقم الهاتف، ولكنك استطعت الحصول على وسيلة تواصل عبر الإنترنت، الفيس بوك -على سبيل المثال- فما الذي يتوجب عليك فعله لتنقل المرأة من المحادثة عبر الإنترنت إلى المحادثة الهاتفية؟

1 ) أنت يجب أن تكون قد أعددت مسبقًا صفحتك على الإنترنت بعناية، مستعينًا ببعض من القواعد التي سأشرحها لك في التواصل عبر الإنترنت في قسم التعارف على المرأة عن طريق الإنترنت.

2 ) أنت يجب أن تكون نشطًا في صفحتك على الإنترنت (الفيس بوك) ولديك بصورة مستمرة مواضيع جديدة، أنشطة، فعاليات، تنزيل صور جديدة، فيديوهات جديدة.
3 ) أنت تبني محادثة لطيفة مع المرأة عبر الإنترنت لفترة مقبولة، وعندما تجد أن الانسجام بينكما يسير بشكل جيد، يمكنك أن تطرح موضوع تبادل أرقام الهواتف والاتصال الهاتفي على النحو التالي:

- أنت تكتب لها: الناس -ونحن أيضًا- تجلس في هذه الأيام لوقت طويل أمام الكمبيوتر ألا تجدين أن التواصل الحقيقي بين الناس أصبح بهذه الطريقة أقل؟

- هي ترد عليك: معك حق.

- أنت تكتب لها: عظيم أنكِ تؤيديني الرأي، هذا رقم هاتفي xxxxxxxxx ما رأيكِ أن تتصلي بي بعد خمس دقائق، ريثما أنتهي من تحضير القهوة.
''',
      '''
المحادثة الهاتفية الأولى:


◙ تكلم معها تمامًا كما لو كنت تتكلم مع صديق قديم، أخبرها أنك شاهدت فيلمًا مرعبًا حملك على الضحك، أخبرها ماذا فعلت الأسبوع الماضي، ثم اسألها ماذا فعلت؟ المهم أن تجد في المحادثة شيئًا مشتركًا لمحادثة لطيفة.
◙ من الأشياء المهمة لأجل المحادثة الهاتفية أن يكون عندك مزاج جيد، وأن تكون مسترخيًا، ولكي تحصل على هذا المزاج اتصل بصديق أو معرفة، ويفضل أن تتصل بصديق يمكن أن تعتمد عليه في حملك على الضحك، تكلم معه ماذا فعلت في الأيام الماضية، وأي تجربة عشت، عندما تشعر بنفسك أنك جيد يكون الوقت المناسب لتتصل بالمرأة.
''',
      '''
◙ إذا كنت تجد الصعوبة في إيجاد أفكار ومواضيع للمحادثة، أنصحك أن تتصل بها وأنت تتمشى في الغرفة، هنا ستنساب الأفكار من تلقاء نفسها، يمكنك أيضًا أن تجري الاتصال الهاتفي وأنت تتمشى على الطريق، في مكان هادئ، هنا يمكن أن يؤمن المكان الذي تتمشى به مواضيع أخرى إضافية للمحادثة.

◙ لا تحاول أن تنشئ موعدًا من الاتصال الهاتفي الأول، ابنِ محادثة لطيفة لعدة اتصالات هاتفية قبل أن تدعوها لموعد.
''',
      '''
◙ لا يجوز أن تقول للمرأة: مرحبًا، أنا منير، الشاب الذي تعرف عليكِ الأسبوع الماضي -على سبيل المثال- في ساحة الجامعة، ألا تذكرينني؟ بالطبع هي تذكرك.

وإليك هذه المقدمة لمحادثة نموذجية مع فتاة تعرفت عليها في حديقة الجامعة وكانت تدعى نرمين.

أنا: مرحبًا نرمين، كيف حالكِ؟ هي: بخير

أنا: خمّني مع من التقيت اليوم؟ هي: مع من؟

أنا: مع مدرستي في الثانوية العامة، مدرسة الفيزياء، في البداية لم أعرفها، لقد كنت متشككًا في أمرها، ترددت كثيرًا قبل أن أتكلم معها، عندما كنت في الثانوية العامة كانت مخطوبة لشاب يعمل في السكك الحديدية، كان شابًا وسيمًا، اليوم رأيتها مع ابنتها في السوق، يا إلهي كيف يمضي الوقت، لقد استعدنا ذكريات الدراسة والأصدقاء، وقد بدأت تسألني عن زملائي فردًا فردًا، وإذا ما كنت على تواصل معهم، حقيقة لقد شعرت أنني أعود بالذاكرة إلى تلك الأيام الجميلة.
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
                      'الاتصال الهاتفي',
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
                      textParts[2],
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
                      textParts[3],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(3),
                    Text(
                      textParts[4],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(4),
                    Text(
                      textParts[5],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(5),
                    Text(
                      textParts[6],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    _buildAdWidget(6),
                    Text(
                      textParts[7],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      textParts[8],
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      textParts[9],
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

  TextStyle get _textStyle => TextStyle(
    fontFamily: 'Amiri',
    fontSize: _fontSize,
    height: 1.6,
    color: Colors.black87,
  );
}