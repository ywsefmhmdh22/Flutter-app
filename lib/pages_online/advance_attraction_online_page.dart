import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class AdvanceAttractionOnlinePage extends StatefulWidget {
  @override
  _AdvanceAttractionOnlinePageState createState() => _AdvanceAttractionOnlinePageState();
}

class _AdvanceAttractionOnlinePageState extends State<AdvanceAttractionOnlinePage> {
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
                      'التقدم في بناء الجاذبية', // تم تغيير العنوان هنا
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
انتبه للنقاط التالية لتجسد السمات التى تريدها معظم النساء من الرجل في رسائلك:
 
◙ أنتَ يجب أن تبدي أنك شخص مهم. 

◙ أنتَ يجب أن تبدي التفاؤل.

◙ أنتَ يجب أن تبدي أنك تملك عاطفة قوية.

◙ أنتَ يجب أن تبدي الصدق والعفوية والتلقائية.

◙ أنتَ يجب أن تبدي القدرة على تأمين احتياجات النساء المادية والمعنوية.

◙ أنتَ يجب أن تبدي أنك تملك حلقة واسعة من المعارف والأصدقاء والعلاقات الاجتماعية.
◙ أنتَ يجب أن تبدي أنك تملك آراء وقناعات شخصية. 

◙ أنتَ يجب أن تبدي أنك قادر على قيادة المرأة.

◙ أنتَ يجب أن تبدي أنك تملك روح المغامرة. 

◙ أنتَ يجب أن تبدي أنك تملك المقدرة على المحادثة وطرح مواضيع الحوار وإدارة الحوار.
 
◙ أنتَ يجب أن تبدي أنك قادر على صنع الفكاهة، النساء تأتي إلى الإنترنت لأجل المتعة والترويح عن النفس، ولا يسوؤهنَّ أكثر من الرسائل المملة.
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