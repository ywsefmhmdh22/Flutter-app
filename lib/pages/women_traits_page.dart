import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // BannerAdWidget تم تعريفه هنا

class WomenTraitsPage extends StatefulWidget {
  @override
  _WomenTraitsPageState createState() => _WomenTraitsPageState();
}

class _WomenTraitsPageState extends State<WomenTraitsPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text(
          'صفات النساء',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.right,
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '''
1. النساء غير منطقيات

لا تأخذ المرأة على محمل الجد في كل ما تقوله وتفعله، فالنساء غير منطقيات، فالمرأة تتعامل وفق ما تشعر وتفكر به لحظتها وليس بالضرورة نتيجة تفكيرها العميق.

---

2. النساء تميل إلى الملل

المرأة تميل إلى الملل وتبحث عمن يثيرها بصورة دائمة، تبحث عن الرجل الذي يملك الكثير من الطاقة والحيوية والاهتمامات والذي يستطيع أن يغير حياتها، تبحث عن تحول حقيقي نوعي في حياتها.

---

3. النساء شكاكات

مهما كان الرجل مخلصًا في حبه وعاطفته تجاه المرأة، فإن الشك يبقى يراودها، يدفعها إلى البحث عما يؤكد شكها هذا باليقين، حتى وإن كنت تسوق لها الهدايا وتعبر عن حبك باستمرار يبقى للشك مكانه عندها.

---

4. النساء فضوليات

النساء يجدن أنفسهن منجذبات للأشياء غير الاعتيادية، وهذه السمة يمكن أن تكون وصفة سحرية ناجحة لجذب المرأة من خلال تقنية إثارة الفضول والتي سأشرحها لك لاحقًا.

---

5. النساء مقيدات

النساء ممزقات هنا وهناك، بين التربية وما يقوله لهنَّ عقلهنَّ، بين ما يردن وما تربين عليه، بين الصح والخطأ، بين منظور المجتمع ورؤيتهنَّ الشخصية للأمور.

---

6. النساء مترددات

المرأة يغلب عليها طابع التردد والصعوبة في اتخاذ القرارات وحسم الأمور بسرعة، فالنساء لا يعرفن ماذا يردن، لذلك تراهنَّ يتأرجحن بين هذا وذاك، في كل ساعة لهنَّ رأي، يقلن شيئًا ولكنهنَّ يفعلن شيئًا آخر مختلفًا تمامًا في المستقبل.
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
      bottomNavigationBar: BannerAdWidget(), // ✅ الآن يعمل بدون مشاكل
    );
  }
}