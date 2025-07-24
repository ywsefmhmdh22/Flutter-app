import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

class MeetingSuggestionsPage extends StatefulWidget {
  @override
  _MeetingSuggestionsPageState createState() => _MeetingSuggestionsPageState();
}

class _MeetingSuggestionsPageState extends State<MeetingSuggestionsPage> {
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
          backgroundColor: Colors.pink.shade100,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'بعض الاقتراحات لاجل لقاء مميز',
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.pink.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.zoom_in, color: Colors.pink.shade700),
                        onPressed: _increaseFontSize,
                      ),
                      IconButton(
                        icon: Icon(Icons.zoom_out, color: Colors.pink.shade700),
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
♠ جولة على الأقدام في المدن الكبرى، أنتما يمكنكما أن تذهبا إلى الحديقة، هناك تريها أين تختبئ الأرانب، ماذا تسمى الأزهار، تروي لها قصة أي شاعر أو كاتب وفي أي منزل من هذه المدينة كان يسكن وماذا كتب.

♠ الذهاب إلى المعارض والمتاحف، معارض الفنون بأنواعها، معارض الكتب، معارض الديكورات والمفروشات، معارض الأزياء، هناك يكون لديك فرصة للحديث عن الفنون، عن اللوحات الفنية، عن التحف الأثرية والآثار والحضارات الغابرة، عن الكتب والمؤلفين وقصص حياتهم وما كتبوه.

♠ حضور المسرحيات والمهرجانات والحفلات الموسيقية والغنائية.

♠ جولة في السوق (فالنساء تعشق التسوق)، هناك يمكن الحديث عن المنتجات المختلفة المعروضة.

♠ من الأشياء الجميلة، أن تريا بعضكما البعض، أين تعيشان، الذكريات الجميلة المكثفة، الحارة، المدرسة، الروضة، اربطا المشاعر، بهذا تتعرفان على بعضكما البعض بشكل أكبر، وبذلك تحققان ذكريات جديدة تخصكما معًا، هذه الذكريات الجميلة سيكون لها دور كبير في بناء الثقة.

♠ الذهاب إلى صالات الألعاب الترفيهية كصالات البلياردو والتنس والبولينج.

♠ التنزه تحت أضواء النجوم، وهنا يمكن أن تختار أحد النجوم لتسميه باسمها وتختار هي نجما آخر بجانبه لتسميه باسمك، فالنساء متحمسات عندما يتحدث المرء عن المعاني في العالم.

♠ اتفقا على اختيار باص أو سرفيس غير معين، واتفقا على النزول في محطة غير معينة أيضًا، هناك يمكنكما أن تتجولا في تلك المنطقة، وتستكشفان أشياء جديدة.

♠ للأشخاص الذين يعيشون في المدن الساحلية، تكون الفرصة متاحة للتجول على شاطئ البحر، والتي تبعث على مزيد من الشعور بالانتعاش.
                  ''',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: _fontSize,
                    height: 1.6,
                    color: Colors.black87, // Ensure text color is consistent
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      // Adding a banner ad if you have the BannerAdWidget defined
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}