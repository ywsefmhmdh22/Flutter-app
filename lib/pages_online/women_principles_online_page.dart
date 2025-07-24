import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart';// تأكد من وجود BannerAdWidget هنا

class WomenPrinciplesOnlinePage extends StatefulWidget {
  @override
  _WomenPrinciplesOnlinePageState createState() => _WomenPrinciplesOnlinePageState();
}

class _WomenPrinciplesOnlinePageState extends State<WomenPrinciplesOnlinePage> {
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
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'مبادئ النساء في التعارف ',
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.zoom_in, color: Colors.blue.shade700),
                        onPressed: _increaseFontSize,
                      ),
                      IconButton(
                        icon: Icon(Icons.zoom_out, color: Colors.blue.shade700),
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
إن معرفتك لهذه المبادئ والألاعيب الأنثوية سيمكنك من الحصول على مزايا أكبر في المنافسة في البحث عن الشريك عن طريق الإنترنت:

□ المرأة يجب أن تجد في رسائل الرجل ما يبرر ردّها عليه، وهذا يتحقق عندما يقوم الرجل بطرح استفسار حول شيء من ملف تعريفها أو عمل إغاظة أو تحفيز فضولها، أما الغزل فلا تجد المرأة مبررًا للرد عليه. 
□ عدم الرد على رسائل الرجل إذا كانت هناك تناقضات في ملف تعريفه أو رسائله. 
 
□ عدم الإجابة على الرسائل التي تبدو من النظرة الأولى ذات صياغة يمكن أن ترسل إلى العشرات أو حتى المئات من الفتيات بنفس الوقت (فقط الرسالة المتعلقة بصورة الفتاة الشخصية أو بملف تعريفها تحظى بالحظ الوفير بالرد عليها من قبل الفتاة). 

□ عدم الإجابة على رسائل الرجل إذا لم يكن له أكثر من صورة على الإنترنت في موقع التعارف (الصورة الواحدة يمكن أن تكون مسروقة)، والشاب الذي لم ينزل له ولا حتى صورة واحدة لا يستحق أصلًا الرد على رسائله.
 
□ عدم الإجابة على رسائل الرجل إذا كانت مزعجة أو غير مهذبة أو تحوي إيحاءات جنسية (على الرجل هنا أن ينتبه إلى الإيميلات التي يكتبها والتي يمكن أن تفهم بمعنى خاطئ). 

□ التظاهر بعدم الاهتمام الزائد (الاهتمام الزائد في بداية التعارف دليل عوز وحاجة، ويؤدي إلى انخفاض منزلة الشخص سواء كان ذكرًا أم أنثى، فكلما كان الشيء صعب المنال كلما زادت قيمته، والمرأة تريد أن تحظى بقيمة عالية عند الرجل).

ويتم ذلك من خلال:
 
* عدم الرد الفوري والسريع على رسائل الرجل، التريث 24 ساعة على الأقل للرد. 

* الرد على رسائل الرجل بأسلوب مقتضب.

* عدم إبلاغ الرجل بقراءة ملف تعريفه. 

* عدم المبادرة في مراسلة الرجل ولا بأي حال، فقط الرد على رسائله.

* التوقف تمامًا عن المراسلة في حال توقف الرجل لفترة تزيد عن أسبوع عن المراسلة (لذا يتوجب على الرجل إعطاء خبر قبل التوقف عن المراسلة إذا كان هناك ما يستدعي هذا التوقف كالمرض والامتحانات وغيرها). 

[بالطبع لا تتقيد جميع النساء في هذه المبادئ ولكن الغالبية العظمى منهنَّ تتصرف على هذا النحو].
                  ''',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: _fontSize,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      // --- هنا تم إضافة إعلان البانر ---
      bottomNavigationBar: BannerAdWidget(),
      // -------------------------------
    );
  }
}