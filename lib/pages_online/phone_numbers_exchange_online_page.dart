import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class PhoneNumbersExchangeOnlinePage extends StatefulWidget {
  @override
  _PhoneNumbersExchangeOnlinePage createState() => _PhoneNumbersExchangeOnlinePage();
}

class _PhoneNumbersExchangeOnlinePage extends State<PhoneNumbersExchangeOnlinePage> {
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
                      'تبادل أرقام الهواتف', // تم تغيير العنوان هنا
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
الموعد ورقم الهاتف لا يطلب في الرسائل الأولى، أنت يجب أن تبني محادثة لطيفة أولًا لفترة مقبولة، وبالمقابل يكون من الخطأ التورط في محادثة تطول أشهر، كذلك الأمر لا يجوز أن تضغط على المرأة لأجل الاتصال الهاتفي، إما أن تختار هي هذا القرار أو لا، ولتسهيل هذا القرار نستخدم الإستراتيجية التالية:


أنت تكتب لها: أنتِ تكتبين وتعبرين بشكل جيد، يبدو أنكِ فتاة رائعة، أرغب أن أسمع صوتكِ على الهاتف، أريد أن أسمع ضحكتكِ، كم سيكون رائعًا أن نتصل ببعض هاتفيًّا، أم أنكِ ترين أنه من الأفضل أن نتحدث عبر الشات (الماسنجر)؟

غالبًا ما ترد هي بأنها لا تحب أن تعطي رقم هاتفها للغرباء أو أي ذريعة أخرى.
 
أنت تكتب لها: إذن هل تعرفين Skype.

هي سترد: بالطبع أعرفه.

أنت تكتب لها: نستطيع هنا أن نتصل ونرى بعضنا بنفس الوقت، عنواني على Skype هو xxxxxxxx.


من الطرق الأخرى لأجل الحصول على رقم الهاتف، وقد ذكرتها سابقًا، أن تحدد لها موعد لقاء وتعطيها رقم هاتفك وتطلب منها إذا تعذر عليها المجيء إلى الموعد أن تتصل بك أو ترسل لك رسالة هاتفية نصية SMS.
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