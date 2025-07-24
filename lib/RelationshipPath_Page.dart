import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا

class RelationshipPathPage extends StatefulWidget {
  const RelationshipPathPage({Key? key}) : super(key: key);

  @override
  _RelationshipPathPageState createState() => _RelationshipPathPageState();
}

class _RelationshipPathPageState extends State<RelationshipPathPage> {
  double _fontSize = 18.0; // حجم الخط الافتراضي للفقرات

  @override
  void initState() {
    super.initState();
    // يمكنك إضافة استدعاء لـ sendVisit هنا إذا كنت تريد تسجيل زيارة لهذه الصفحة أيضًا
    // sendVisit('relationship_path_page');
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize = _fontSize + 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize - 2.0;
      if (_fontSize < 12.0) _fontSize = 12.0; // الحد الأدنى لحجم الخط
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // تم إزالة extendBodyBehindAppBar: true
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
        body: Container( // استخدم Container للخلفية Gradient
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
          child: Column( // استخدم Column لترتيب العناصر عمودياً
            children: [
              // هنا بنحط أزرار تكبير وتصغير الخط
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align( // Align for left alignment
                  alignment: Alignment.centerLeft,
                  child: Container( // إضافة Container جديد لإطار الأزرار
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2), // لون خلفية الإطار
                      borderRadius: BorderRadius.circular(10), // حواف دائرية للإطار
                    ),
                    padding: const EdgeInsets.all(8.0), // مسافة داخلية للإطار
                    child: Directionality(
                      textDirection: TextDirection.ltr, // لضمان أن الأزرار تظهر من اليسار لليمين
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // عشان الـ Row مياخدش عرض الشاشة كله
                        children: [
                          GestureDetector(
                            onTap: _increaseFontSize,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add, color: Colors.white, size: 20),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: _decreaseFontSize,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.remove, color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // هنا بنحط محتوى الصفحة الرئيسي اللي هو الـ SingleChildScrollView
              Expanded( // Expanded عشان ياخد باقي المساحة المتاحة
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 16.0, // تم تعديل الـ padding العلوي
                    bottom: 25.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildParagraph(
                        'قبل الدخول إلى التطبيق لا بدَّ من الإشارة إلى مسار العلاقة مع المرأة، والذي يمر بمرحلتين رئيسيتين، وهما مرحلة ما قبل الارتباط، وتتضمن ست خطوات، ومرحلة ما بعد الارتباط، والتي تتضمن الخطوة السابعة.',
                      ),
                      _buildStepTitle('الخطوة الأولى (تكوين الأرضية اللازمة):'),
                      _buildParagraph(
                        'في البداية لا بدَّ من التأسيس وامتلاك الدراية والمعلومات الكافية حول المرأة وأنماط التصرفات والأشياء التي تملك تأثيرًا جذابًا عليها، لأجل تكوين أرضية، تكون بمثابة قاعدة الانطلاق نحو الخطوات التالية.',
                      ),
                      _buildStepTitle('الخطوة الثانية (المبادرة بالتعارف):'),
                      _buildParagraph(
                        'لأجل التعارف على الفتاة لا بدَّ للشاب من أن يقوم بالمبادرة، حيث يوجد الكثير من الطرق الخاطئة في المبادرة بالتعارف، بالمقابل يوجد مجموعة من الطرق الصحيحة مضمونة النجاح، والتي لا بدَّ من التعرف عليها ومعرفة أسباب نجاحها وفشل الطرق الأخرى.',
                      ),
                      _buildStepTitle('الخطوة الثالثة (بناء الجاذبية والارتباط العاطفي):'),
                      _buildParagraph(
                        'لكي تحصل على رقم هاتف الفتاة أو بريدها الإلكتروني... توليد مشاعر الألفة والاهتمام بك عند الفتاة.',
                      ),
                      _buildStepTitle('الخطوة الرابعة (تبادل أرقام الهواتف):'),
                      _buildParagraph(
                        'لأجل الإبقاء على التواصل مع الفتاة لا بدَّ من تبادل وسائل التواصل كأرقام الهواتف أو البريد الإلكتروني...',
                      ),
                      _buildStepTitle('الخطوة الخامسة (المواعدة):'),
                      _buildParagraph(
                        'لكي تقبل الفتاة الخروج معك ومواعدتك لا بدَّ من محادثات عديدة... جذبها للخروج واللقاء معك.',
                      ),
                      _buildStepTitle('الخطوة السادسة (التقدم والتعمق في بناء الجاذبية والارتباط العاطفي):'),
                      _buildParagraph(
                        'الهدف في هذه المرحلة هو توليد مشاعر الحب عند الفتاة تجاه الشاب...',
                      ),
                      _buildStepTitle('الخطوة السابعة (الرومانسية والجنس):'),
                      _buildParagraph(
                        'يمكن للرومانسية أن تبدأ في مرحلة ما قبل الزواج ولكنها تبقى ضرورة من ضرورات الحياة الزوجية...',
                      ),

                      const SizedBox(height: 20),
                      Text(
                        'ملاحظات ختامية:',
                        style: TextStyle(
                          fontSize: _fontSize + 4, // حجم أكبر لعنوان الملاحظات
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
                      const SizedBox(height: 10),

                      _buildParagraph(
                        '• هذه الخطوات السبع هي عماد تطبيقنا تطبيق كتاب مهارات جذب النساء الجميلات "تقنيات وفنون وإستراتيجيات".',
                      ),
                      _buildParagraph(
                        '• جميع المهارات اللازمة لأجل بناء العلاقة مع المرأة من الخطوة الأولى وحتى الخطوة الأخيرة... مدعمة بصور ملونة.',
                      ),
                      _buildParagraph(
                        '• بالإضافة إلى التعارف في الحياة الواقعية، يتناول التطبيق التعارف عن طريق الإنترنت بصورة مفصلة...',
                      ),
                      _buildParagraph(
                        '• وأخيرًا لا بدَّ من الإشارة إلى أن مسار العلاقة يمكن أن يأخذ أحد الشكلين التاليين:',
                      ),
                      _buildStepTitle('المسار الأول:'),
                      _buildParagraph(
                        'ويسري على الفتاة التي تنال إعجابي، ولا أملك فرصة لقاء ثانٍ معها...',
                      ),
                      _buildStepTitle('المسار الثاني:'),
                      _buildParagraph(
                        'ويسري على الفتاة التي تنال إعجابي، وأملك فرصة تواصل مستمر معها...',
                      ),
                      const SizedBox(height: 40),
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

  // الفقرة العادية
  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: _fontSize, // استخدام حجم الخط المتغير
          color: Colors.white70,
          height: 1.6,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  // الفقرة العنوانية (تمييز)
  Widget _buildStepTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: _fontSize + 1, // حجم أكبر قليلاً لعناوين الخطوات
          fontWeight: FontWeight.bold,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}