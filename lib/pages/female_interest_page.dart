import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // يمكنك حذفه إذا لم يكن مطلوبًا

// BannerAdWidget placeholder (لحل المشكلة مؤقتًا)
class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade100,
      height: 50,
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

class FemaleInterestPage extends StatefulWidget {
  @override
  _FemaleInterestPageState createState() => _FemaleInterestPageState();
}

class _FemaleInterestPageState extends State<FemaleInterestPage> {
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
              child: Row(
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
                      'لمن تهتم وتنجذب الفتيات في اماكن الدراسه',
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
أولًا:  للطلاب المتفوقين، لماذا؟ في الحقيقة إن الفتيات تنجذب إلى الطلاب المتفوقين؛ لأنهم متميزون عن أقرانهم، ولأنهم يمثلون مصدر ثقة في أحاديثهم وآرائهم واستنتاجاتهم ومعلوماتهم، ولأن فرصهم المستقبلية أفضل في الحصول على العمل والمراكز الوظيفية المرموقة، علاوة على فرصهم العلمية في متابعة الدراسات العليا والتخصصات، هذا بالإضافة لما يحظون به بكل تأكيد من محبة المدرسين وتقدير المجتمع لهم ولتفوقهم.

ثانيًا: للطلاب الذين يساهمون في عمل النشاطات الثقافية أو الترفيهية وغيرها من النشاطات، مثل حفلات الجامعة، فيقومون بأدوار كتابة الشعر، تأليف النصوص المسرحية، التمثيل، الغناء، الخطابة، ألعاب الخفة..... إلخ.

ثالثًا: للطلاب القياديين الذين يتولون قيادة الهيئات الطلابية والنقابية وغيرها في الجامعات والمعاهد.

فكيف تبدو متميّزًا وتجذب الأنظار إليك في المعهد أو الجامعة؟

◊ حَضِّر الدروس والمحاضرات وطور مستواك الدراسي وشارك في الحوارات التي تجري في الصف أو القاعة، تقنية تحضير الدروس والمشاركة في الحوارات خلال الجلسات تحقق لك أشياء أخرى إضافة إلى الظهور بصورة جيدة أمام الزملاء والمدرسين، كالفهم العميق للمعلومات وترسيخها، التخلص من جو الملل الذي تبعثه المحاضرات، تكون أحداث النقاش هذه بمثابة موضوع شيق للحوار مع الفتيات.

◊ نظم البطولات كلعبة كرة سلة أو قدم أو شطرنج، والأفضل أن تنظم بطولات أو نشاطات يمكن أن تشارك فيها البنات، وكن أنت القائد.

◊ ابحث عن نشاطات أو هوايات تسلط عليك الضوء في المجتمع.

◊ قدم نفسك للترشح للمناصب الإدارية، فأصحاب المناصب يحظون بإعجاب النساء.
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