import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من أن BannerAdWidget معرف هنا

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

class ChangeRoutinePage extends StatefulWidget {
  @override
  _ChangeRoutinePageState createState() => _ChangeRoutinePageState();
}

class _ChangeRoutinePageState extends State<ChangeRoutinePage> {
  double _fontSize = 16.0;

  // تعريف الإعلان المدمج
  NativeAd? _nativeAd;
  bool _isNativeAdLoaded = false;

  final String adUnitId = 'ca-app-pub-8081293973220877/5104529502';

  @override
  void initState() {
    super.initState();
    _loadNativeAd();
  }

  void _loadNativeAd() {
    _nativeAd = NativeAd(
      adUnitId: adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isNativeAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _nativeAd?.dispose();
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
    _nativeAd?.dispose();
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
                          'تغيير الروتين وتجديد نمط حياتك',
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
                  children: [
                    Text(
                      '''
كلما تقدمتَ في تحسين نوعية حياتك، كلما أصبحت أكثر جاذبية، وبذلك يرتفع عدد ونوعية المتقدمات بطلباتهنَّ عندك.

1 : تطوير الذوق في كل شيء
♣ يجب أن تتعرف على الكثير من المأكولات والمشروبات، قم بزيارة العديد من المطاعم المختلفة ونَوِّع في الوجبات التي تتناولها، جرب تحضير بعض الوجبات والحلويات بنفسك، وتابع البرامج التلفزيونية حول ذلك؛ هذا سيعطيك المزيد من المعرفة والمواضيع الشيقة والمثيرة للحديث عنها مع النساء.
 
♣ طوّر ذوقك في الألبسة والأحذية والعطور والإكسسوارات، جرب ارتداء أنواع مختلفة من الألبسة، كن حليق الذقن أو ملتحيًا، جرب الذقن بعمر ثلاثة أيام، وجرب قصات الشعر المختلفة وانتقِ لنفسك الأجمل، جرب الأنواع المختلفة من العطور واستشر النساء العاملات في المحلات التجارية واختر الأنسب لنفسك، امتلك شيئًا من الدراية عن الماركات العالمية والمحلية في مجالات الألبسة والأحذية والعطور والإكسسوارات، تعرف على الموضة، وكن على اطلاع على أحدث صرخات الموضة في عالم الرجال والنساء والأطفال؛ فكلها مواضيع محادثة جذابة للنساء.
 
♣ طوّر ذوقك في الاهتمامات والهوايات، استمع لأنواع متعددة من الموسيقى، كوّن دراية عنها؛ ما هي أنواع الموسيقى وما هو أصلها؟ وتعلم أن تروي أجمل الروايات والقصص عنها، نوّع الكتب التي تقرؤها، اقرأ ما أمكن من الكتب الترفيهية والثقافية واطّلع على أحدث المعلومات لتكون أحاديث رائعة ومشوقة، وشاهد الأفلام والبرامج والمسلسلات المتنوعة في أوقات فراغك ليكون لديك اطلاع ومعرفة أكبر على عالم الفن والسينما، فيكون عندك الكثير من المواضيع والقصص المسلية الشائقة والممتعة لترويها.

2 : أكثر من السفر والترحال
الرحلات الفردية والجماعية: تعرف على الكثير من البلدان والأماكن والمواقع في بلدك والبلدان الأخرى إن أمكن، كلما زرت أماكن أكثر كلما كان عندك مواضيع وقصصًا شيقة ترويها للنساء، وكلما زادت جاذبيتك عندهنَّ.

3 : تعلم كيف تولد مزاجًا جميلًا
عامل مهم يجب أن تنتبه إليه لأجل اللقاء أو التعارف على الفتاة هو تحسين مزاجك الشخصي؛ يجب أن تبدو سعيدًا وراضيًا عن نفسك، ممتلئًا بالطاقة والحيوية، وتشِعّ بالنجاح من كل مسام جلدك، لتنقل إليها بالمقابل هذا الشعور، فالأشخاص الذين يبدون سعداء يمتلكون جاذبية وقبولًا أكبر، ومن الطرق التي تساعدك على ذلك:
  
♠ حسّن حوارك الداخلي، وتذكر دائمًا أن تمدح نفسك وتذكر كل ما هو إيجابي عندك، فالرضا عن النفس عامل مهم في الحصول على الإشراقة.
	
♠ عوّد دماغك على تلقي الرسائل الإيجابية، فكر إيجابيًّا، فكر في كل ما هو مبهج وابتعد عما يمكن أن يوتِّرك، حدث نفسك حديثًا إيجابيًّا؛ فتكرار الرسائل الإيجابية سيحوّلها إلى اعتقاد، ينبثق منه عمل يتحول إلى سلوك.

♠ حفّز بصورة مستمرة ذكريات المواقف الجميلة والنجاحات التي حققتها في حياتك، واجعل من استعادة تصورها وسيلة لتغلُّبِك على المواقف التي تشعر فيها بالتردد.

♠ تناول الأطعمة والمشروبات التي تحسّن المزاج كالقهوة عند الصباح، الشوكولا والموز والبرتقال والجزر والمكسرات والأسماك واللحوم الخالية من الدهون، وتجنب المشروبات والأطعمة التي تولِّد مزاجًا سيئًا كالوجبات السريعة والأغذية والمشروبات الحاوية على مواد حافظة.

♠ تدرّب وتعوّد أن تُبدي وجهًا مشرقًا حافلًا بالتعابير الإيجابية بصورة دائمة، واحرص على الابتسام مع إظهار الأسنان بين الحين والآخر، اجعله كتمرين.

♠ استمع للموسيقى، فالموسيقى تقلل الكورتيزول (هرمون الإجهاد) بنسبة 25% وتزيد من الإندروفينات المفرزة في الجسم.
 
♠ مارس الرياضة والاسترخاء والتأمل بصورة دورية، وحافظ على لياقتك البدنية ولا تترك ممارسة الرياضة مهما كانت الظروف.
 
♠ استبدل العادات السيئة بالعادات الجيدة، واحرص على توفير بدائل مفيدة بدل العادات السيئة.
 
♠ سر الإشراقة الجذابة عند كلا الجنسين أن يشعر كل واحد منهما أنه محبوب عند الجنس الآخر، تعلم أنه كلما تعرفت على نساء أكثر كلما تحسّن مزاجك، وكلما أصبحت أكثر جاذبية عند النساء.
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
                    // الإعلان المدمج
                    if (_isNativeAdLoaded && _nativeAd != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(ad: _nativeAd!),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      '''
4 : التعرف على أفضل الأماكن للتعارف على النساء
يجب أن تعرف ما هي الأماكن التي تحبِّذ النساء الذهاب إليها باستمرار وأين تتواجد الفتيات الجميلات، يوجد الكثير من الأماكن التي تتردد عليها النساء العازبات باستمرار ويكون حظك بالتعارف فيها على فتاة أحلامك كبير جدًّا، فالكثير من الأماكن التي تنخفض فيها المنافسة تكون بمثابة جنة لك، ومنها:
 
♣ الدورات، مثل دورات الكمبيوتر واللغة والحلاقة وتطوير المهارات.
♣ الأحداث والفعاليات الثقافية.
♣ الكرنفالات والمهرجانات والحفلات.
♣ مراكز بيع الكتب ومعارض الكتاب.
♣ الإنترنت.
♣ النوادي الرياضية.
♣ مدارس اليوغا.
♣ الأعراس (في الأعراس تكون الفتيات متحمسات للتعارف على الشبان).
♣ أماكن الدراسة كالجامعات والمعاهد.
♣ الفتيات العاملات في المحلات التجارية كالصيدليات والمكتبات.

5 : البقاء على اطلاع بالأحداث والفعاليات التي تُقام في المدينة أو المنطقة التي تعيش فيها
يجب أن تكون على دراية مستمرة بالأحداث والفعاليات في منطقتك؛ فهي تحقق لك أمرين هامين؛ الأول: أنها تكون بمثابة إمكانية لدعوة الفتاة للقاء والخروج معك، والثاني: أنها تعطيك المزيد من المواضيع الشيقة للحديث مع النساء.

6 : التعرف على الاستراحات والمطاعم وأماكن الأنشطة الترفيهية في المدنية التي تعيش فيها
تعرف على المعارض والمسارح والنوادي الرياضية وصالات الألعاب ودور السينما وحدائق النباتات والحيوانات المتواجدة في منطقتك؛ فهي تعطيك الكثير من المزايا في وضع برنامج اللقاء وقضاء الموعد.

7 : تقوية المهارات في التعامل مع النساء
 
♠ شاهد المسلسلات والأفلام التي تدور حول الرومانسية والحب والغزل والفكاهة.
 
♠ صاحب الأشخاص الذين يُجيدون التعامل مع النساء وتعلَّم منهم.
 
♠ اقتنِ الكتب ذات الصلة مثل كتب علم النفس والحب والغزل والرومانسية وتعلم الفكاهة.
 
♠ تعلَّم من النساء، فالكثير من النساء يكُنّ خدومات ويقدّمن المشورة والنصائح عندما يطلب الرجال منهنَّ المساعدة في شيء يتعلق بالتعامل مع النساء.

♠ تمرّن على تطبيق المهارات التي أقدّمها لك في كتابي هذا، إذا كنت تجد الخوف والخجل في التعارف والتعامل مع الفتيات الجميلات فابتدئ أولًا بالفتيات غير الجذابات واللاتي لا يولّدن الخوف والتوتر لديك، كذلك الحال يمكنك البدء مع الفتيات المتواجدات في وسطك الاجتماعي، طبِّق عليهنَّ التقنيات الواردة في كتابي، وراقب ردود أفعالهنَّ والنتائج التي ستحصل عليها، ستزداد ثقتك بنفسك وتزداد خبرتك وتكون هذه التقنيات حاضرة في ذهنك في جميع الأوقات، وستعرف المبدأ الصحيح لكل تقنية، وستعمل على تطويرها بذاتك، وملاءمتها لكل حال من الأحوال، ربما لا تستطيع أن تطبق في البداية جميع ما ورد في الكتاب دفعة واحدة، لا بد من حدوث بعض الأخطاء ولكن مع التكرار ستصل إلى درجة عالية من الكفاءة، وعندها ستكون مستعدًا للاقتراب من الفتيات الفاتنات، وأنت تمتلك الخبرة والثقة بالنفس الكافيتين، وبعد ذلك سيكون من السهل عليك أن تحصل على فتاة أحلامك، الأمر بسيط يتلخص في فهم المرأة وطريقة التعامل معها.
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
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}