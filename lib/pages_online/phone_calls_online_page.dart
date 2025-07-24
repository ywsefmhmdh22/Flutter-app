import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class PhoneCallsOnlinePage extends StatefulWidget {
  @override
  _PhoneCallsOnlinePageState createState() => _PhoneCallsOnlinePageState();
}

class _PhoneCallsOnlinePageState extends State<PhoneCallsOnlinePage> {
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
                      'التعليمات الواجب مراعاتها لأجل المحادثة الهاتفية', // تم تغيير العنوان هنا
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
♠ دون قبل الاتصال النقاط التالية:

* ماذا يتضمن ملف تعريفها من بيانات.

* خذ نظرة على صورتها قبل الاتصال. 

* استعرض الإيميلات المرسلة بينكما. 

* دون أسئلتك والأشياء التي تريد مناقشتها معها.
 
* إذا كنت مسجلًا في أكثر من موقع للتعارف استذكر اسم موقع التعارف الذي يجمعكما.
 
♠ حافظ خلال المحادثة على أن تكون مسترخيًا وتكلم بهدوء وبطء. 

♠ استفد من مواضيع ملف تعريفها والرسائل المرسلة بينكما في بناء حوار، ذكرها بالأشياء الإيجابية التي تجمعكما، وابنِ ارتباطًا عاطفيًا على رسائلكما الأخيرة. 

♠ المحادثة يجب أن تنتهي بإيقاع إيجابي جيد، في نهاية المحادثة يجب أن تترك أثرًا جميلًا بقولك شيئًا لطيفًا. 

♠ أرسل لها في اليوم التالي رسالة وقل لها: لقد كانت المحادثة معها ممتعة ولطيفة.

♠ إذا لم تعجبك الفتاة يمكنك أن تكتب لها رسالة في اليوم التالي على هذا النحو: (أنتِ فتاة جميلة رائعة وجذابة، ولكني لم أمتلك الشعور بأننا نناسب بعضنا البعض، أنا على ثقة بأنكِ ستجدين الشاب الأنسب لكِ، أتمنى لكِ التوفيق في بحثكِ عن الشريك).
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