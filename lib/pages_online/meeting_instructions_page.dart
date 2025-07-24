import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class MeetingInstructionsPage extends StatefulWidget { // تم تغيير الاسم هنا
  @override
  _MeetingInstructionsPageState createState() => _MeetingInstructionsPageState(); // و هنا أيضا
}

class _MeetingInstructionsPageState extends State<MeetingInstructionsPage> { // و هنا أيضا
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
                      'تعليمات لاجل موعد ناجح ',
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
♣ أعطِ خيارات لأجل الموعد.

♣ استطلع مرة أخرى ماذا يحوي ملف تعريفها وصورتها والإيميلات المرسلة بينكما وما دار بينكما في المحادثات الهاتفية وأي موقع تعارف يجمعكما.

♣ حدد المواضيع التي تريد أن تتناقش معها فيه. 

♣ ضع برنامجًا للقاء، ما الأشياء والأنشطة التي تريد أن تقوم بها خلال اللقاء؟ واعمل تصورًا لذلك (لا تدع ذلك للصدفة).
♣ الخطأ الكبير في اللقاء أن تبدأ من الصفر، أنتَ يجب أن تستأنف من حيث انتهيت في المراسلة والمحادثة الهاتفية.

♣ أظهر الاعتناء بالمظهر. 

♣ أنتَ يجب أن تتواجد في المكان قبل الموعد من خمس إلى عشر دقائق، فمن غير اللائق أن تنتظرك الفتاة.

♣ التقِ الفتاة في أماكن عامة كمقهى أو مطعم أو معرض أو حديقة عامة، أيضًا يمكن لمكان اللقاء أن يؤمن مواضيع محادثة أولية بسيطة ومريحة لكليكما لامتصاص الارتباك الذي يمكن أن يحدث في اللقاء الأول، بعض الأشخاص يفضلون القيام بنشاط مشترك خلال اللقاء في صالات الألعاب كالبلياردو والتنس والبولينغ. 

♣ أعطِ فتاتك انتباهًا غير مشتت. 
 
♣ أعطِ فتاتك الشعور أنك شخص موثوق، فالنساء تخاف من الرجال الغرباء خاصة وأن هناك الكثير من الحالات المسجلة عن اعتداءات تتعرض لها النساء عن طريق التعارف عبر الإنترنت في موعد اللقاء مع الرجال ومنها القتل والسرقة والاغتصاب. 

♣ لا تعطِ كل شيء عنك في الموعد، فلا يبقى ما يثير الفضول عندها لمعرفة المزيد.

♣ لا تحاول إظهار التشبث بها من خلال طلب تحديد موعد أو اتصال هاتفي جديد.

♣ لا تجعل اللقاء مقابلة صحفية أو تحقيق جنائي.

♣ أمضِ وقتًا مرحًا ومسليًا معها.

♣ وأخيرًا يجب أن لا تبدو في الموعد شخصًا مختلفًا تمامًا عن الشخص الذي كانت تراسله طوال الفترة السابقة، فينتابها الشعور أن شخصًا آخر كان يكتب نيابة عنك.
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