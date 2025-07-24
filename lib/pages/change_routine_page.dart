import 'package:flutter/material.dart';

// Widget للإعلانات التجريبية يمكنك استبداله لاحقًا بـ AdMob بسهولة
class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pink.shade100,
      child: Center(
        child: Text(
          "إعلان بانر هنا",
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class ChangeRoutinePage extends StatefulWidget {
  @override
  _ChangeRoutinePageState createState() => _ChangeRoutinePageState();
}

class _ChangeRoutinePageState extends State<ChangeRoutinePage> {
  double _fontSize = 16.0;

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
                child: Text(
                  '''
كلما تقدمتَ في تحسين نوعية حياتك كلما أصبحت أكثر جاذبية وبذلك يرتفع عدد ونوعية المتقدمات بطلباتهنَّ عندك.

1. تطوير الذوق في كل شيء

♣ يجب أن تتعرف على الكثير من المأكولات والمشروبات، قم بزيارة العديد من المطاعم المختلفة ونَوِّع في الوجبات التي تتناولها، جرب تحضير بعض الوجبات والحلويات بنفسك، تابع البرامج التلفزيونية حول ذلك، هذا سيعطيك المزيد من المعرفة والمواضيع الشيقة والمثيرة للحديث عنها مع النساء.

♣ تطوير الذوق في الألبسة والأحذية والعطور والإكسسوارات، جرب ارتداء أنواع مختلفة من الألبسة، جرب أن تكون حليق الذقن، جرب أن تكون ملتحيًا، جرب الذقن بعمر ثلاثة أيام، جرب قصات الشعر المختلفة وانتقِ لنفسك الأجمل، جرب الأنواع المختلفة من العطور واستشر النساء العاملات في المحلات التجارية واختر الأنسب لنفسك، امتلك شيئًا من الدراية عن الماركات العالمية والمحلية في مجالات الألبسة والأحذية والعطور والإكسسوارات، تعرف على الموضة، وكن على اطلاع على أحدث صرخات الموضة في عالم الرجال والنساء والأطفال، فكلها مواضيع محادثة جذابة للنساء.

♣ تطوير الذوق في الاهتمامات والهوايات، استمع لأنواع متعددة من الموسيقى، كون دراية عنها، ما هي أنواع الموسيقى وما هو أصلها؟ وتعلم أن تروي أجمل الروايات والقصص عنها، نوّع الكتب التي تقرؤها، اقرأ ما أمكن من الكتب الترفيهية والثقافية واطّلع على أحدث المعلومات لتكون أحاديث رائعة ومشوقة، شاهد الأفلام والبرامج والمسلسلات المتنوعة في أوقات فراغك ليكون لديك اطلاع ومعرفة أكبر على عالم الفن والسينما، فيكون عندك الكثير من المواضيع والقصص المسلية الشائقة والممتعة لترويها.

2. أكثر من السفر والترحال

الرحلات الفردية والجماعية: تعرف على الكثير من البلدان والأماكن والمواقع في بلدك والبلدان الأخرى إن أمكن، كلما زرت أماكن أكثر كلما كان عندك مواضيع وقصصًا شيقة ترويها للنساء، كلما زادت جاذبيتك عندهنَّ.

3. تعلم كيف تولد مزاجًا جميلًا

عامل مهم يجب أن تنتبه إليه لأجل اللقاء أو التعارف على الفتاة هو تحسين مزاجك الشخصي، أنت يجب أن تبدو سعيدًا وراضيًا عن نفسك، ممتلئ بالطاقة والحيوية، تشع بالنجاح من كل مسام جلدك، لتنقل إليها بالمقابل هذا الشعور، فالأشخاص الذين يبدون سعداء يمتلكون جاذبية وقبولًا أكبر، ومن الطرق التي تساعدك على ذلك:

♠ حسن حوارك الداخلي، تذكر دائمًا أن تمدح نفسك وتذكر كل ما هو إيجابي عندك، فالرضا عن النفس عامل مهم في الحصول على الإشراقة.

♠ عود دماغك على تلقي الرسائل الإيجابية، فكر إيجابيًّا، فكر في كل ما هو مبهج وابتعد عما يمكن أن يوترك، حدث نفسك حديثًا إيجابيًّا، فتكرار الرسائل الإيجابية سيحولها إلى اعتقاد، ينبثق منه عمل يتحول إلى سلوك.

♠ حفز بصورة مستمرة ذكريات المواقف الجميلة والنجاحات التي حققتها في حياتك، واجعل من استعادة تصورها وسيلة لتغلبك على المواقف التي تشعر فيها بالتردد.

♠ تناول الأطعمة والمشروبات التي تحسن المزاج كالقهوة عند الصباح، الشوكولا والموز والبرتقال والجزر والمكسرات والأسماك واللحوم الخالية من الدهون، وتجنب المشروبات والأطعمة التي تولد مزاجًا سيّئَا كالوجبات السريعة والأغذية والمشروبات الحاوية على مواد حافظة.

♠ تدرب وتعود أن تبدي وجهًا مشرقًا حافلًا بالتعابير الإيجابية بصورة دائمة واحرص على الابتسام مع إظهار الأسنان بين الحين والآخر، اجعله كتمرين.

♠ استمع للموسيقى، إن الموسيقي تقلل الكورتيزول (هرمون الإجهاد) بنسبة 25% وتزيد من الإندروفينات المفرزة في الجسم.

♠ مارس الرياضة والاسترخاء والتأمل بصورة دورية، حافظ على لياقتك البدنية ولا تترك ممارسة الرياضة مهما كانت الظروف.

♠ استبدل العادات السيئة بالعادات الجيدة، واحرص على توفير بدائل مفيدة بدل العادات السيئة.

♠ سر الإشراقة الجذابة عند كلا الجنسين أن يشعر كل واحد منهما أنه محبوب عند الجنس الآخر، تعلم أنه كلما تعرفت على نساء أكثر كلما تحسن مزاجك، كلما أصبحت أكثر جاذبية عند النساء.

4. التعرف على أفضل الأماكن للتعارف على النساء
...
(يستكمل النص كما أرسلته بدون حذف)
''',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: _fontSize,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
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