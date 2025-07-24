import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // يمكنك إزالته إن لم يكن ضروريًا

// ✅ إضافة BannerAdWidget لحل المشكلة مؤقتًا
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

class SpeechSkillsPage extends StatefulWidget {
  @override
  _SpeechSkillsPageState createState() => _SpeechSkillsPageState();
}

class _SpeechSkillsPageState extends State<SpeechSkillsPage> {
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
                          'تقوية المهارات في الحديث',
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
* مهارات الحديث هي أحد أهم المعايير للتميز في التعامل مع النساء، وأفضل وسيلة للتغلب على الخجل من النساء هو المواجهة والتحدث مع النساء، ربما تشعر بدايتًا بالخوف والتردد، ولكن مع مرور الوقت سيتبدد هذا الخوف ويتلاشى ويصبح أداؤك أفضل بكثير، كل ما عليك فعله في الحقيقة هو تجاهل هذه المشاعر.

* وسع نطاق معارفك وثقافتك، فكل معلومة يمكن أن تكون فرصة لحوار مميز، ابحث بصورة مستمرة عن معلومات جديدة لتتعلمها، واستمتع بذلك، دَوِّن المعلومات المشوقة والتي يمكن الحصول عليها من المصادر المختلفة كالكتب والصحف والجرائد والتلفاز والإنترنت، فاطلاع الإنسان على أحدث التطورات العلمية في المجالات المختلفة يعطيه مواضيع مميزة لحوارات شيقة، فالقارئ والمطلع الجيد يستطيع أن يجري حوارًا ناجحًا في كل مناسبة ومع كل شخص.

* مارس التخيل من خلال اختيار مواضيع مختلفة وإنشاء حوارات مع الذات، فالدماغ لا يملك القدرة على التمييز بين المعلومات الحقيقية التي اكتسبها في الحياة الواقعية وبين التخيل، فإذا كان هدفك هو التدريب على اكتساب مهارة في مجال التعامل مع النساء، فمارس التخيل بتطبيقك لهذه التقنية، وتخيل نفسك وأنت في هذا الموقف، ماذا تقول؟ وكيف تتصرف؟ وماذا سيكون رد فعل المرأة؟ وكيف ستتعامل مع ذلك؟

* كوّن صداقات عديدة مع أشخاص من مستويات وأعمار مختلفة، فالتفاعل مع الأصدقاء ومشاركتهم الأنشطة المختلفة تسبك مهارات الحديث لديك.

* لا تبقَ صامتًا في اللقاء مع الناس، تحدث وناقش في كل مجلس، وحاول أن تكون ذا حضور مميز، شارك في الفعاليات والأنشطة الاجتماعية الدائرة، شارك في الحوار الدائر، أبدِ آراءك، وأطلع الناس على معارفك، ربما تجد في البداية شيئًا من الصعوبة ولكن مرة بعد مرة سيصبح الحوار أمرًا بغاية اليسر، وستزداد ثقتك بنفسك، ويتعزز شعورك بأهميتك.
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