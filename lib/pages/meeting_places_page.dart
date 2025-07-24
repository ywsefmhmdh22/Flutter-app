import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

class MeetingPlacesPage extends StatefulWidget {
  @override
  _MeetingPlacesPageState createState() => _MeetingPlacesPageState();
}

class _MeetingPlacesPageState extends State<MeetingPlacesPage> {
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
                      'أماكن اللقاء',
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
قوة جاذبية الشخص لا تتعلق به وحده، بل بالظروف المحيطة به والتي تحفز إفراز الهرمونات التي تولد العاطفة، فالموعد الناجح يكون لقاء مع هدف أن تقع الفتاة في حبّك، أنت يجب أن تحفز إفراز الهرمونات المسؤولة عن ذلك لديها، فالسبب البيولوجي للاستعدادية للحب هو ارتفاع مستوى هرمون الدوبامين في الدماغ، والذي يؤدي دورًا رئيسيًّا في الإحساس بالمتعة والسعادة. وعليه يتوجب عليك أن تحفز ذلك الجزء من الدماغ والمسؤول عن المشاعر لديها، لا الجزء المنطقي من الدماغ، فاستعدادية المرأة للحب تكون متعلقة بدرجة الإثارة، الرجال والنساء يقعون في حب بعضهم البعض بصورة أسهل عندما يكونون مثارين عاطفيًّا.

الموعد واللقاء يجب أن يكون مشوقًا، مثيرًا، رومانسيًّا، غير اعتيادي، فيه شيء من المغامرة، يحوي تقلبات مفاجئة ويثير المزيد من العواطف، فالحماس ينبعث في أماكن الإثارة مثل المسرح، حلبات الملاكمة والمصارعة، المسابقات، كل تحريك في مشاعر المرأة هو نقطة في صالحك، هذه المشاعر ليس بالضرورة أن تكون مشاعر الفرح والسرور، فتحريك المشاعر المختلفة عند المرأة كالتوتر والترقب والخوف وغيرها يصب في سياق التقارب مع الفتاة، هذه المشاعر تكون أقوى عندما تقوم الفتاة بنشاط جديد لم تقم به من قبل، اسألها عن الأنشطة التي لم تقم بها بعد، اسألها -على سبيل المثال- هل شاهدتِ عرضًا لألعاب الخفة قبل ذلك؟

على العموم الرجل المسيطر يختار ماذا سيفعل في اللقاء، فالنساء لا تحب الرجال الذين يسألون إلى أين يمكن أن نذهب، يجب أن تلتقي الفتاة وقد جهزتَ نفسك وبرنامجك لقضاء موعد مميز معها.
                  ''',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: _fontSize,
                    height: 1.6,
                    color: Colors.black87, // Ensure text color is defined
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