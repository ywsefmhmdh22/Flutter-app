import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class MotivatingResponseTipsPage extends StatefulWidget {
  @override
  _MotivatingResponseTipsPageState createState() => _MotivatingResponseTipsPageState();
}

class _MotivatingResponseTipsPageState extends State<MotivatingResponseTipsPage> {
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
                      'تعليمات لتحفز المرأة للرد على رسائلك',
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
*تعليمات لتحفيز المرأة للرد على رسائلك*

الكتابة للمرأة عبر الإنترنت تمر عبر ثلاثة فلاتر: الأول *لفت الانتباه لرسالتك، الثاني **قراءة رسالتك، الثالث **التفاعل مع رسالتك*. عندما تتجاوز رسالتك هذه الفلاتر بنجاح، يمكنك أن تحصل على رد من المرأة وهذا يتم عبر الاستفادة من النصائح التالية:

---

*1. عنوان الرسالة*

هو أهم محفز للمرأة لقراءة الرسالة، ثم يأتي نص الرسالة ثم الصورة ثم ملف التعريف. عنوان الرسالة يجب أن يكون مختلفًا عن عناوين رسائل الآخرين. إذا لم يكن العنوان مشوقًا، فإن المرأة الجميلة والتي ربما تحصل على عشرات الإيميلات باليوم والتي تراقب إيميلها مرة أو مرتين في الأسبوع ستهمله حتمًا وذلك لكثرة الرسائل الواردة. معظم الرجال يكتبون عنوان الرسالة (مرحبًا).

---

*2. محتوى نص الرسالة*

معظم الرجال غير مبدعين وهذه نقطة إيجابية في صالحك، فمعظمهم يكتبون رسائل مملة أو يعملون إطراءات ويتوقعون أن تأخذ المرأة على عاتقها البدء بالمحادثة وهو ما لا يحدث. النساء تحصل على أعداد هائلة من هذه الرسائل والتي لا ترد عليها غالبًا. كما أن النصوص المملة مثل: "مرحبًا، اسمي سعد، عمري ثلاثون عامًا، في أوقات الفراغ أشاهد التلفاز" تجبر المرأة للضغط على زر الماوس وحذف الرسالة في أجزاء من الثانية. عندما تستخدم الاستراتيجية التي يستخدمها أغلب الرجال تكون رسائلك بالمثل مملة، فإذا أردت أن تستجيب المرأة لك يجب أن لا تكون رسائلك كالآخرين، يجب أن تعطي المستقبلة تحفيزًا كافيًا لكي يكون عندها سبب للرد عليك، فالمرأة ترد على رسائلك عندما يتولد لديها انطباع بأن التواصل معك يولد المتعة والمرح.
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