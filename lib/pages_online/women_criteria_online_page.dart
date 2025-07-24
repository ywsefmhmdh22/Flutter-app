import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class WomenCriteriaOnlinePage extends StatefulWidget {
  @override
  _WomenCriteriaOnlinePageState createState() => _WomenCriteriaOnlinePageState();
}

class _WomenCriteriaOnlinePageState extends State<WomenCriteriaOnlinePage> {
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
                      'معايير النساء في اختيار الشريك ',
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
■ النساء الجذابات تنتبه بصورة جدية إلى موضوع توافق موصفات الشريك المطلوبة مع العروض المقدمة، ولا تميل إلى تقديم الكثير من التنازلات بسبب كثرة العروض التي تحصل عليها، لذلك عند وجود ما يخل بهذا التوافق فإنها لا ترد على المرسل غالبًا، على سبيل المثال: المرأة الجذابة التي تبحث عن شريك غير مدخن لن تجد نفسها مضطرة للتواصل مع رجل مدخن (كلما زاد التوافق بين العرض والطلب كلما زادت الحظوظ) . 

■ النساء يأخذن بعين الاعتبار موضوع المسافة بين مكان إقامتهنَّ وإقامة الشريك.
 
■ النساء يأخذن موضوع وجود الأولاد عند الشريك أو الرغبة في إنجاب الأولاد على محمل الجد، وتميل إلى الرجال الذين يحبون الأطفال وعلى استعداد للمساهمة في تربيتهم ورعايتهم.

■ النساء تميل إلى اختيار الرجل الأكبر منها سنًّا، ولكن على أن لا يكون الفارق كبير جدًّا بسبب مخاطر الشيخوخة أو الموت المبكر وبقاء عبء الأولاد على المرأة.

■ النساء تختبر الرجل قبل أن تعطيه رقم هاتفها لأجل المواضيع التالية؛ فكاهي، حساس، اجتماعي، غني، مخلص.

■ النساء تعتبر الدخل والمؤهلات والبنية الجسدية عناصر هامة في تقييم قدرة الرجل على الوفاء بمتطلبات المرأة والأولاد.
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