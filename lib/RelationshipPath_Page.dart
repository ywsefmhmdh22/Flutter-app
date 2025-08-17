 import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main.dart'; // BannerAdWidget هنا

class RelationshipPathPage extends StatefulWidget {
  const RelationshipPathPage({Key? key}) : super(key: key);

  @override
  _RelationshipPathPageState createState() => _RelationshipPathPageState();
}

class _RelationshipPathPageState extends State<RelationshipPathPage> {
  double _fontSize = 18.0;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 2.0;
      if (_fontSize < 12.0) _fontSize = 12.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'مسار العلاقة مع المرأة',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF4A148C),
                Color(0xFF9C27B0),
                Color(0xFFE040FB),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _decreaseFontSize,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.remove, color: Colors.white, size: 25),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: _increaseFontSize,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add, color: Colors.white, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildParagraph('قبل الدخول إلى التطبيق لا بدَّ من الإشارة إلى مسار العلاقة مع المرأة، والذي يمر بمرحلتين رئيسيتين، وهما مرحلة ما قبل الارتباط، وتتضمن ست خطوات، ومرحلة ما بعد الارتباط، والتي تتضمن الخطوة السابعة.'),
                      _buildStepTitle('الخطوة الأولى (تكوين الأرضية اللازمة):'),
                      _buildParagraph('في البداية لا بدَّ من التأسيس وامتلاك الدراية والمعلومات الكافية حول المرأة وأنماط التصرفات والأشياء التي تملك تأثيرًا جذابًا عليها، لأجل تكوين أرضية، تكون بمثابة قاعدة الانطلاق نحو الخطوات التالية.'),
                      _buildStepTitle('الخطوة الثانية (المبادرة بالتعارف):'),
                      _buildParagraph('لأجل التعارف على الفتاة لا بدَّ للشاب من أن يقوم بالمبادرة، حيث يوجد الكثير من الطرق الخاطئة في المبادرة بالتعارف، بالمقابل يوجد مجموعة من الطرق الصحيحة مضمونة النجاح، والتي لا بدَّ من التعرف عليها ومعرفة أسباب نجاحها وفشل الطرق الأخرى.'),
                      _buildStepTitle('الخطوة الثالثة (بناء الجاذبية والارتباط العاطفي):'),
                      _buildParagraph('لكي تحصل على رقم هاتف الفتاة أو بريدها الإلكتروني، ولكي يكون أمر المواعدة واللقاءات العاطفية ممكنًا، لا بدَّ من أن يكون هناك تميز في شخصيتك وأدائك عمّن سواك...'),
                      _buildStepTitle('الخطوة الرابعة (تبادل أرقام الهواتف):'),
                      _buildParagraph('لأجل الإبقاء على التواصل مع الفتاة لا بدَّ من تبادل وسائل التواصل كأرقام الهواتف أو البريد الإلكتروني...'),
                      _buildStepTitle('الخطوة الخامسة (المواعدة):'),
                      _buildParagraph('لكي تقبل الفتاة الخروج معك ومواعدتك لا بدَّ من محادثات عديدة شيقة وممتعة...'),
                      _buildStepTitle('الخطوة السادسة (التقدم والتعمق في بناء الجاذبية والارتباط العاطفي):'),
                      _buildParagraph('الهدف في هذه المرحلة هو توليد مشاعر الحب عند الفتاة تجاه الشاب...'),
                      _buildStepTitle('الخطوة السابعة (الرومانسية والجنس):'),
                      _buildParagraph('يمكن للرومانسية أن تبدأ في مرحلة ما قبل الزواج ولكنها تبقى ضرورة من ضرورات الحياة الزوجية...'),
                      const SizedBox(height: 20),
                      Text(
                        'ملاحظات ختامية:',
                        style: TextStyle(
                          fontSize: _fontSize + 4,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 7.0,
                              color: Colors.black45,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      _buildParagraph('◙ هذه الخطوات السبع هي عماد تطبيقنا تطبيق كتاب مهارات جذب النساء الجميلات "تقنيات وفنون وإستراتيجيات".'),
                      _buildParagraph('◙ جميع المهارات اللازمة لأجل بناء العلاقة مع المرأة من الخطوة الأولى وحتى الخطوة الأخيرة...'),
                      _buildParagraph('◙ بالإضافة إلى التعارف في الحياة الواقعية، يتناول التطبيق التعارف عن طريق الإنترنت بصورة مفصلة...'),
                      _buildParagraph('◙ وأخيرًا لا بدَّ من الإشارة إلى أن مسار العلاقة يمكن أن يأخذ أحد الشكلين التاليين:'),
                      _buildStepTitle('المسار الأول:'),
                      _buildParagraph('ويسري على الفتاة التي تنال إعجابي، ولا أملك فرصة لقاء ثانٍ معها...'),
                      _buildStepTitle('المسار الثاني:'),
                      _buildParagraph('ويسري على الفتاة التي تنال إعجابي، وأملك فرصة تواصل مستمر معها...'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BannerAdWidget(),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: _fontSize,
          color: Colors.white70,
          height: 1.6,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildStepTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: _fontSize + 1,
          fontWeight: FontWeight.bold,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}