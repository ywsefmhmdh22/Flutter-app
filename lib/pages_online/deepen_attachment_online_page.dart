import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class DeepenAttachmentOnlinePage extends StatefulWidget {
  @override
  _DeepenAttachmentOnlinePage createState() => _DeepenAttachmentOnlinePage();
}

class _DeepenAttachmentOnlinePage extends State<DeepenAttachmentOnlinePage> {
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
                      'التعمق في بناء الارتباط العاطفي', // تم تغيير العنوان هنا
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
حتى تصبح المرأة جاهزة لتبادل أرقام الهواتف وإجراء محادثة هاتفية، لا بد من التعمق في بناء الارتباط العاطفي، جميع التقنيات اللازمة لذلك كنت قد شرحتها بإسهاب في قسم التعمق في بناء الارتباط العاطفي في الحياة الواقعية وهي قابلة للتطبيق في الواقع وعلى الإنترنت وأهمها هنا:  

1 ) الدخول في المواضيع الشخصية والعاطفية.

2 ) إنشاء مقارنة بين تجربتكما حول الموضوع المطروح.

3 ) إحداث توافق وتتطابق في الرؤى والأمنيات.

4 ) الطريق إلى طفولتها.

5 ) إبداء الانطباع حولها. 

6 ) اختبارات وألعاب نفسية.
نصائح عامة أخرى لا بدَّ من التنويه عنها:

◙ تتبع بصورة شبه يومية الأعضاء الجدد المسجلين في الموقع، وبادر على الفور بمراسلتهم حتى يكون كل من يأتي بعدك خاسرًا.

◙ اعمل لك إيميلا على هوتميل أو ياهو لتلقي رسائل موقع التعارف ودعاياته بعيدًا عن إيميلك الشخصي.

◙ يمكن للرجل التسجيل باسم فتاة جميلة، ليعرف ماذا يمكن أن يكتب للفتاة، خاصة في مواقع التعارف المجانية، كذلك يمكن له أن يسجل ملف تعريفه باسم مدينة أخرى ريثما يمتلك الخبرة الكافية للتعامل مع الفتيات، وخلالها يمكن للرجل تجربة رسائل متنوعة يبدي فيها شخصية رومانسية فكاهية مغرور ومتكبر وغيرها، ويكتشف النصوص التي يمكن أن يكون لها تأثير ساحر، فلا يوجد قالب يمكن استخدامه دائمًا، فإذا ما قرأت المرأة الرسالة نفسها مرتين يفقد نص الرسالة سحره وجاذبيته. 
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