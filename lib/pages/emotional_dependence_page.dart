import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart';
// BannerAdWidget هنا يتأكد أن الكلاس معرف
class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.pink.shade100,
      child: Center(
        child: Text(
          "إعلان بانر هنا",
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class EmotionalDependencePage extends StatefulWidget {
  @override
  _EmotionalDependencePageState createState() => _EmotionalDependencePageState();
}

class _EmotionalDependencePageState extends State<EmotionalDependencePage> {
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
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.pink.shade100,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black87),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '(العوز والحاجة (التسول العاطفي',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
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
الكثير من الرجال لا يملكون الصبر في موضوع البحث عن الشريك ويقعون ضحية الشعور باليأس والإحباط بعد بضع محاولات فاشلة، هذا الشعور يكون قاتلًا وينعكس على تصرفات الشاب وينتقل إلى الفتاة ويقود إلى الفشل، هذا اليأس والخذلان والضغط النفسي والشعور بالوحدة الذي يتولد عند الرجل يستدرك من قبل النساء، ويجعل الشاب غير جذاب، فالنساء يمتلكن رادارًا قويًّا لاكتشاف الرجل اليائس، وعليه كلما كانت هذه المشاعر السلبية أكبر كلما كان تفاعل المرأة مع الرجل أقل.

التخلص من الشعور بالعوز والحاجة يتم أولًا عن طريق التخلص من الشعور بالوحدة، الكثير من الرجال يقعون بالخطأ القاتل، وهو تجاهل النساء اللاتي لا يعتبرونهنَّ شريكًا محتملًا، وهنا يتعزز شعور الحاجة واليأس والوحدة. فما يتوجب عليك فعله هو أن تدع محادثتك مع النساء أمرًا اعتياديًّا وطبيعيًّا في مسار نهارك، ليس من الضروري أن تكون كل امرأة تتكلم معها فارسة أحلامك وليس من الضروري أن يقود كل تعارف إلى المواعدة والغرام، اجعل من النساء المحيطة بك ميدانًا للتدريب، عندما تلتقي الكثير من الناس، وتتحدث مع الكثير من النساء يبدأ الشعور بالوحدة يتلاشى، وتصبح أكثر مرونة واسترخاء عند التعارف والمواعدة مع الفتاة التي ترى فيها شريكة حياتك المستقبلية.
''',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: _fontSize,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      // BannerAdWidget هنا شغال بدون خطأ
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}