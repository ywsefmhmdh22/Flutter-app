import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart';// تأكد من وجود BannerAdWidget هنا

class OnlineDatingMethodPage extends StatefulWidget {
  @override
  _OnlineDatingMethodPageState createState() => _OnlineDatingMethodPageState();
}

class _OnlineDatingMethodPageState extends State<OnlineDatingMethodPage> {
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
                      ' عمل موعد مع المرأة على الإنترنت', // تم تغيير العنوان هنا
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
المراسلة بينكما تمت بنجاح، أنتما تبادلتما عددًا كافيًا من الرسائل، أجريتما محادثة أو أكثر عبر الهاتف أو الشات، أنتَ وجدتَ فيها الشخص الذي تبحث عنه، صورتها وصوتها وضحكتها وأسلوبها في الحوار نالت إعجابك، أنت الآن متأكد فعلًا أنك تريد أن ترى هذه الفتاة في الحياة الواقعية، فما هي الإستراتيجية التي يمكنك استخدامها لأجل الحصول على موعد؟ 
 
الموضوع يعتمد هنا على إيجاد نشاط مشترك، من خلاله يمكنكما أن تلتقيا، انتبه ماذا قالت خلال الحوار أو كتبت في ملف تعريفها، ما هي الأنشطة المحبذة لها، لتستفيد منها في جذبها للخروج واللقاء معك، هي تحب الكتب، يوجد في الأسبوع القادم معرض للكتب، أنت تخبرها عن المعرض وتثير حماسها لزيارته، وتخبرها بأنك تريد أن تزوره، وتقول لها: كم سيكون رائعًا أن نلتقي هناك معًا. 

إذا لم يكن هناك نشاط مشترك في وقت قريب يمكنك أن تقول لها: أرغب أن أشرب معكِ فنجانًا من القهوة، ما رأيكِ أن نلتقي الأسبوع القادم الثلاثاء أو الخميس عند كافتريا xxxxxx .
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