import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:animate_do/animate_do.dart'; // إضافة مكتبة للأنيميشن
import 'package:google_fonts/google_fonts.dart'; // إضافة خطوط جوجل
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  double _fontSize = 16.0; // حجم الخط الافتراضي للوصف

  @override
  void initState() {
    super.initState();
    // يمكنك إضافة استدعاء لـ sendVisit هنا إذا كنت تريد تسجيل زيارة لهذه الصفحة أيضًا
    // sendVisit('tips_page');
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'نصائح للمزيد من الفائدة',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container( // استخدم Container للخلفية Gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF1A237E), // أزرق نيلي غامق
              Color(0xFF512DA8), // بنفسجي غامق
              Color(0xFF9C27B0), // بنفسجي متوسط
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
                          onTap: _decreaseFontSize, // استدعاء دالة تصغير الخط
                          child: Container(
                            width: 35, // حجم أكبر
                            height: 35, // حجم أكبر
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.remove, color: Colors.white, size: 25), // أيقونة الناقص
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _increaseFontSize, // استدعاء دالة تكبير الخط
                          child: Container(
                            width: 35, // حجم أكبر
                            height: 35, // حجم أكبر
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 25), // أيقونة الزائد
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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only( // تم تعديل الـ padding العلوي
                    left: 25.0,
                    right: 25.0,
                    top: 16.0,
                    bottom: 25.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // هذا هو الـ SizedBox الذي تم تعديل ارتفاعه من 40 إلى 15
                      const SizedBox(height: 15),
                      ...List.generate(12, (index) {
                        final tipNumber = index + 1;
                        final title = 'نصيحة $tipNumber:';
                        String description = '';
                        switch (tipNumber) {
                          case 1:
                            description = 'اقرأ الكتاب ومقالات التطبيق بهدوء وتمعن';
                            break;
                          case 2:
                            description = 'مارس التخيل أثناء القراءة، اقرأ فقرة وحاول أن تتخيل نفسك في الموقف.';
                            break;
                          case 3:
                            description = 'اقرأ الكتاب ومقالات التطبيق أكثر من مرة، ففي كل مرة تقرأ تترسخ أشياء جديدة في ذهنك لم تنتبه إليها في قراءات سابقة.';
                            break;
                          case 4:
                            description = 'حدد وأنت تقرأ الكتاب أو المقالات الأخطاء التي وقعت فيها أثناء تعارفك على الفتيات فيما سبق وما هي الطرق الصحيحة التي يجب أن تتبعها.';
                            break;
                          case 5:
                            description = 'عُد إلى التطبيق كلما واجهتك مشكلة في التعارف والتعامل مع الفتيات، تأكد بأنك ستعرف الخطأ وستجد الحل.';
                            break;
                          case 6:
                            description = 'عاود الرجوع إلى التطبيق كل فترة للاطلاع على كل جديد لدينا.';
                            break;
                          case 7:
                            description = 'شارك في منتدى تبادل التجارب على تطبيقنا، هناك يمكنك أن تطرح المشاكل التي تواجهك مع الفتيات وتجد لها حلاً.';
                            break;
                          case 8:
                            description = 'تواجد في الأماكن التي ترتادها النساء.';
                            break;
                          case 9:
                            description = 'كن صبورًا وتجنب التسرع.';
                            break;
                          case 10:
                            description = 'اختر فتاة من محيطك وضع خطة للتعرف عليها مستفيدًا من المهارات التي نقدمها لك.';
                            break;
                          case 11:
                            description = 'لا تتردد في التواصل معنا وتقديم رأيك حول المواضيع والمقالات التي ترى ضرورة بأن نضيفها لتطبيقنا لإغناء التطبيق بكل ما هو مهم.';
                            break;
                          case 12:
                            description = 'أخبرنا بالمشاكل التقنية التي تواجهك في استخدام التطبيق لنتمكن من إصلاحها.';
                            break;
                        }
                        return FadeInUp(
                          delay: Duration(milliseconds: 200 * (index + 1)),
                          duration: const Duration(milliseconds: 600),
                          child: _buildSimpleTip(title, description),
                        );
                      }),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }

  // دالة مساعدة جديدة لإنشاء النصائح بدون إطارات
  Widget _buildSimpleTip(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0), // مسافة بين كل نصيحة والتي تليها
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // لجعل النص يبدأ من اليمين في وضع RTL
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: _fontSize + 4, // حجم أكبر لعنوان النصيحة
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
          ),
          const SizedBox(height: 5), // مسافة بسيطة بين العنوان والوصف
          Text(
            description,
            style: TextStyle(
              fontSize: _fontSize, // استخدام حجم الخط المتغير
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.justify, // لجعل النص متناسقًا
          ),
        ],
      ),
    );
  }
}