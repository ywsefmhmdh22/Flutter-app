import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here

class OnlinePhenomenaAnalysisPage extends StatefulWidget {
  @override
  _OnlinePhenomenaAnalysisPageState createState() => _OnlinePhenomenaAnalysisPageState();
}

class _OnlinePhenomenaAnalysisPageState extends State<OnlinePhenomenaAnalysisPage> {
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
                      'تحليل بعض الظواهر ',
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
تقدم بعض المواقع خدمات مثل إظهار الأعضاء المسجلين خلال فترة تواجدهم في الموقع على الإنترنت وآخر زيارة للموقع، إظهار إذا ما تمت قراءة الرسالة المرسلة من قبل المرسل إليه أو لا، في حين يرسل الكثير من الشباب الرسائل ولا يحصلون على الرد نفسر لهم هذه الظواهر في الجدول التالي:

الظاهرة	
التفسير
	
• الكاشف يظهر عدم تواجد المرأة المسجلة على الموقع لفترة كبيرة، وعدم قراءة الرسالة.		
* غالبًا ما تكون المرأة قد تركت الموقع ونسيت أن تحذف اشتراكها.

• الكاشف يظهر تواجد المرأة على الموقع، وعدم قراءة الرسالة.	
* المرأة تحصل على أعداد هائلة من الرسائل بحيث لا يتسنى لها فتحها وقراءتها جميعًا.

* المرأة وجدت فارس أحلامها، هي منشغلة بمراسلته ولم يعد الآخرون يعنون لها شيئًا.

• الكاشف يظهر تواجد المرأة على الموقع وقد قرأت الرسالة ولم ترد عليها خلال ثلاثة أيام.

* المشكلة هنا قد تتعلق بالشخص المرسل، ويمكن أن تكون برسالته أو صورته أو ملف تعريفه، وربما كنوع من الألاعيب الأنثوية، وهذا ما نريد معالجته في كتابنا هذا.
 
* لا يوجد مشكلة متعلقة بالشخص المرسل سواء فيما يتعلق برسالته أو صورته أو ملف تعريفه، ولكنه ليس النموذج أو النمط من الرجال الذي تبحث عنه هذه المرأة.

* لا يوجد مزاج لدى المرأة للكتابة، أو أنها تمر بظروف سيئة، أو قد تكون مكتئبة، أو أنها لا تعرف ماذا تكتب.
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
      // --- Ad banner added here ---
      bottomNavigationBar: BannerAdWidget(),
      // ----------------------------
    );
  }
}