import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// تأكد من أن BannerAdWidget معرف هنا
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

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
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
إذا كانت المبادرة بالتعارف تمثل التحدي الأول، وتبادل أرقام الهواتف أو البريد الإلكتروني يمثل التحدي الثاني، فإن جلب المرأة على المواعدة يمثل التحدي الثالث للرجل في مسار التقرب منها.

هذا ولأجل الدعوة لا بد من أن تخبرك لغة جسد الفتاة وطريقة تصرفها معك عن وجود جاذبية واهتمام نحوك، بمعنى آخر وجود جاهزية لقبول الدعوة، على العموم معظم الفتيات ترفضن الدعوة الأولى وتبرزن شيئا من التمنع بنسبة 90 % كنوع من الحياء الأنثوي، ولكنها تستجيب غالبًا في الدعوة الثانية أو الثالثة. ولأجل الدعوة يوجد عدة طرق:
''',
      '''
◙ أن تدعوها إلى حدث أو فعالية:

ترقب الأحداث والفعاليات التي تقام في مدينتك، معارض، حفلات، مهرجانات، أسواق تسوق، هناك الكثير من المجلات الدورية المطبوعة وعلى الإنترنت التي تُعنى بذلك، أيضًا تقصَّ الأحداث والفعاليات التي تجري في الجامعة -على سبيل المثال- حفلة طلابية، مؤتمر علمي، ندوة شعرية، ثم اسأل الفتاة التي تود التقرب منها إذا ما كانت ترغب بحضورها على النحو التالي:

- الأربعاء تقام حفلة موسيقية كبيرة في مركز المدينة، سأكون هناك، إذا كنتِ تحبين أن تشاهديها يمكننا أن نذهب سويًّا.

- السبت يُقام معرض للكتب في مبنى كلية الآداب، أنا أرغب بزيارته واقتناء بعض الكتب، إذا كنتِ ترغبين بزيارة المعرض يمكننا أن نلتقي هناك يوم السبت.

من الأشياء الذكية أن يكون الموعد الأول بسيطًا، غير معقد، غير ملزم، والإنفاق منخفضًا. عندما تنفق الكثير من المال على المرأة بصورة مبكرة، فإن ذلك يشكل عليها ضغطًا وشعورًا بعدم الارتياح، كلما كان الإنفاق أقل كلما شعرت المرأة بارتياح أكبر، هنا لا يوجد التزام، وهذا يعني بشكل واضح أقل ارتباط من موعد حقيقي، وهو أفضل من أن تقول للمرأة: ما رأيكِ أن نذهب لشرب فنجان من القهوة معًا؟ وهنا يكون لديكما نفس الإمكانية لأن تعيشا تجربة وتتعرفا على بعضكما البعض، وعندما تعجبان يبعضكما يمكنكما عمل موعد حقيقي، بالتأكيد ستحاول المرأة أن تمنحك هذا الامتحان وهذا يتم باللاوعي فلا تنزعج، لن يكون محرجًا إذا رفضت المرأة الدعوة أو لم تأتِ إلى الموعد، أنت تريد أن تذهب هكذا أو هكذا.
''',
      '''
◙ الدعوة إلى شيء يمثلك في صورة إيجابية:

أنت تمارس نشاطًا أو هواية ما كالرسم، التمثيل، كتابة الشعر، كرة الطاولة، البلياردو، أو غيرها من النشاطات، أنت تستطيع أن تكتب لها SMS على النحو التالي:

(مرحبًا لميس، أنا أشارك في تمثيلية طلابية، نحن نعمل الآن بروفة في مسرح الكلية، سأكون مسرورًا، عندما تمرّين علينا، أنتِ تستطيعين أن تجلبي معكِ إحدى صديقاتكِ).

في هذا النوع من الدعوة أنت تبرز للمرأة شيئًا عن عالمك، عن نشاطاتك وهواياتك، فالنساء تقيم الرجال حسب محيطهم الاجتماعي ونشاطاتهم، هنا يكون إنفاق الرجل على المرأة قليلًا، وبالتالي شعورها بالضغط يكون منخفضًا، هي تستطيع أن تمر لتتفرج، وعندما لا تعجبها الأجواء، تستطيع أن تذهب، ربما يكون لأجلها غير مقبول أن تكون مع مجموعة من الأغراب، عن طريق عرضك عليها، بأن تجلب معها إحدى صديقاتها، يكون الوضع أفضل، وإذا ما كنت تعتقد أن تعامل أصدقائك سوف يسبب لك أو لها الإحراج فمن الأفضل أن تبعدها عن هذه الأجواء.
''',
      '''
◙ الدعوة إلى فنجان من القهوة أو أي مشروب آخر:
1 - الأسبوع القادم سأكون الأحد والاثنين في المدينة، إذا كان عندكِ الوقت والرغبة يمكننا أن نلتقي ونشرب فنجانًا من القهوة معًا.
''',
      '''
2 - التدرج في تقديم الضيافة، كتقديم ضيافة صغيرة أثناء اللقاء، ومن دون دعوتها إلى الندوة أو الكافتريا، مثل قطعة شوكولا أو سكاكر مع تبرير وجود مناسبة مثل: عودة والدك من السفر بالسلامة أو عيد ميلاد أختك أو شفاء أمك.
''',
      '''
3 - الدعوة الجماعية لمرة أو أكثر، أي دعوة عدة أصدقاء من الذكور والإناث من ضمنهم الفتاة تلعب دورًا كبيرًا في كسر حاجز قبول الدعوة والضيافة، بهذا تكون الدعوة غير شخصية ولكنها تمهيدية لدعوة شخصية.
''',
      '''
4 - أنت تقول لها: أنا أجد أن المحادثة معكِ رائعة وأرغب في متابعة الحديث معكِ، من الرائع أن نلتقي الأربعاء أو الخميس القادم على فنجان من القهوة، ماذا تقولين حول ذلك؟ 
 
      هي تقول: أنا أجد ذلك جيدًا ولكني مشغولة في هذا الوقت.

      أنت تقول لها: إذن اقترحي الوقت المناسب لنلتقي مرة أخرى سويًا
''',
      '''
5 - في ذروة حديث شيق تقول لها: أشعر بعطش شديد، وأريد أن أشرب شيئًا، دعينا نذهب إلى الندوة لإكمال الحديث، بهذا لا يبدو أن هناك دعوة لمشروب وإنما فقط دعوة للجلوس على الطاولة في الندوة لإكمال الحديث وهذا يكون أمرًا طبيعيًّا بالنسبة لها. الهدف الضمني هنا تحقيق خطوة أولى في الدعوة، وهي الجلوس معًا في الندوة على الطاولة بعد ذلك تقوم أنت بإحضار مشروبين وعندها بالطبع ستعترض هي وترفض العصير وهنا سيتوجب عليك أن تقنعها بقبول الدعوة ولديك بالتأكيد عدة طرق كأن تقول لها: هذا العصير طبيعي مذاقه مميز تستطيعين أن تجربيه وتعطيني رأيكِ به أو تقول لها: لا بأس أنا أدعوكِ هذه المرة وأنتِ تستطيعين أن تدعوني في المرة القادمة.
'''
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
                      'طريقة الدعوة ',
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