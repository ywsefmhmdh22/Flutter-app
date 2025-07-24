import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من وجود BannerAdWidget هنا

class DealingWithScammersOnlinePage extends StatefulWidget {
  @override
  _DealingWithScammersOnlinePageState createState() => _DealingWithScammersOnlinePageState();
}

class _DealingWithScammersOnlinePageState extends State<DealingWithScammersOnlinePage> {
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
                      'التعامل مع المحتالين والوهميّين ',
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
كثيرًا ما يصل الشبان المسجلين في مواقع التعارف رسائل من معجبات يردن التعارف، وغالبًا ما تكون هذه الشخصيات وهمية أو محتالة، ولتجنب الوقوع في الشباك عليك القيام بالآتي:

Ω لا تجب على الرسائل غير الشخصية.

Ω لا تجب على الشخصيات التي لا تملك أكثر من صورة.

Ω الاستعانة بشخص آخر مسجل للتأكد من حقيقة وجود الشخصية وكشف التناقضات ومعرفة إذا ما كانت تعطيك نفس البيانات التي تعطيها لشخص آخر.

Ω اختبر ادعاءها من خلال طرح أسئلة سابقة ومعرفة إذا ما كان هناك تناقضات في الجواب الجديد مع الجواب القديم، فالشخصيات الوهمية لا تكلف نفسها عناء التحقق من الرسائل السابقة.

Ω إذا كنت تروي لها شيئًا عن نفسك فيجب أن تروي لك بالمقابل شيئا عن نفسها.

Ω من عادة الوهميّين والمحتالين التهرب من إعطاء رقم الهاتف أو تحديد موعد فانتبه لهذه النقطة.

Ω إذا طلبت منك نقودًا فأخبرها أنك ستحول لها هذه النقود عن طريق البنك وأنك تحتاج بيانات عنها وراقب ردة فعلها، لا تعطِ نقودا نقدًا أبدًا، وأفضل لا تعطي بتاتًا.

Ω أبلغ إدارة الموقع في حال الشك في شخصية ما للتحقق من حقيقتها.
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