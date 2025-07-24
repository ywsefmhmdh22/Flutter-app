import 'package:flutter/material.dart';
import '../services/api_service.dart'; // اللي فيه دالة sendVisit
import 'main.dart'; // استيراد ملف BannerAdWidget

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double _fontSize = 16.0; // حجم الخط الافتراضي

  @override
  void initState() {
    super.initState();
    sendVisit('about_page'); // تسجل زيارة صفحة "نبذة عن التطبيق"
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
      textDirection: TextDirection.rtl, // اتجاه الواجهة العامة من اليمين لليسار
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'نبذة عن التطبيق',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          // هنا بنحط الـ Container اللي فيه الـ Gradient كخلفية للصفحة كلها
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFF48FB1),
                Color(0xFFE91E63),
              ],
            ),
          ),
          child: Column( // بنستخدم Column عشان نحط العناصر فوق بعض
            children: [
              // هنا الجزء الخاص بأزرار تكبير وتصغير الخط
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align( // بنستخدم Align عشان نخلي الأزرار على الشمال
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
              Expanded( // بنستخدم Expanded عشان المحتوى ياخد المساحة الباقية
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16, // الـ padding العلوي مبقاش محتاج يتعدل بناءً على حجم الخط هنا
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          'مرحبًا بك في تطبيق "مهارات جذب النساء الجميلات"',
                          style: TextStyle(
                            fontSize: _fontSize + 4, // حجم أكبر للعنوان
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildSimpleParagraph(
                        'يهدف هذا التطبيق إلى تزويدك بأفضل الأدوات والنصائح التي تحتاجها لتطوير مهاراتك في التواصل مع النساء الجميلات، وفهمهنَّ بشكل أعمق، هنا ستجد مجموعة كبيرة من التقنيات والأستراتيجيات المجربة والمدروسة والتي ستساعدك في جذب إنتباههن وبناء علاقة ناجحة ودائمة.',
                      ),
                      _buildSimpleParagraph(
                        'الكثير من الرجال الذين يعانون من عدم اهتمام الجنس اللطيف بهم تبين بعد تطوير مهاراتهم أنهم لم يدركوا العالم المحيط بهم بصورة جيدة، عندما تبدأ النظر بصورة واعية لمحيطك سيتغير حظك عند الجنس الآخر بصورة جذرية.',
                      ),
                      _buildSimpleParagraph(
                        'الكثير من الرجال يفكرون أنهم إذا لم يكونوا أغنياء ولديهم مظهر جميل وجذاب فإن حظهم سيكون ضئيلًا عند المرأة الجميلة الجذابة، والحقيقة مختلفة تمامًا، فالكثير من الرجال عندهم مشكلة كبيرة في التعارف على النساء؛ لأنهم لا يعرفون كيف يتعاملون معهنَّ، هم لا يعرفون كيف تفكر المرأة وماذا تريد.',
                      ),
                      _buildSimpleParagraph(
                        'التعرف على الفتاة قبل التقدم لها بصورة رسمية أصبح فكرة شائعة وأمرًا اعتياديًّا ومألوفًا في كل مكان، الأمر الذي يتطلب من الشاب امتلاك الدراية الكافية والإلمام بالمهارات والمعارف ذات الصلة، والتي من شأنها أن تساعده في اختيار شريكة حياته وفارسة أحلامه، ولأن كثيرًا من الشبان لا يمتلكون المعرفة بالكيفية الصحيحة للتعامل مع النساء، فإنهم يقعون في أخطاء كثيرة لا يدركونها، الأمر الذي يقودهم إلى الشعور بالخيبة والفشل والإحباط وضعف الثقة بالنفس.',
                      ),
                      _buildSimpleParagraph(
                        'إذا كنت تريد أن تعرف الطرق المضمونة 100% لتكون محظوظًا عند النساء، فهذا التطبيق سيعطيك مفاتيح النجاح في التعارف على النساء الجميلات. إذا كنت ذلك الرجل الذي يبحث عن شريكة الحياة وفارسة الأحلام، أو ربما إن قلبك معلق بفتاة ما، وأنت تريد أن تقع هي بالمثل في حبك، ولكنك لا تعرف تمامًا ما الذي يتوجب عليك أن تفعله لكي تحظى باهتمامها وقبولها، ولا كيف تحرك مشاعرها نحوك، فإنك ستجد هنا في هذا التطبيق ، ما الذي يؤثر حقًّا على المرأة، سأشرح لك بأسلوب سهل ومبسط وبصورة مفصلة مع كل ما ستحتاجه من الأمثلة: كيف يتعارف الرجل على المرأة؟ ماذا يقول وماذا يكون من الأفضل له أن لا يقول؟ وسأرشدك إلى الأشياء التي تملك تأثيرًا فعالًا لتحرك اهتمام المرأة نحوك، والتي لا يعرفها حقًّا إلا القليل من الرجال.',
                      ),
                      _buildSimpleParagraph(
                        'أنت الآن متحمس وتتساءل، ما الذي يجب أن أقوله أو أعمله لأحظى باهتمام الفتاة الجميلة الجذابة؟ كيف أتقرب من الفتاة بصورة صحيحة؟ وكيف أطور علاقتي معها؟ كيف أستطيع أن أحظى بفتاة جميلة تقع في حبي؟ كل شخص يريد أن يتعلم المهارات التي ترفع من كفاءته ويصبح شخصًا ذا تأثير جذاب لا يُقَاوَم عند النساء.',
                      ),
                      _buildSimpleParagraph(
                        'هذه التقنيات والفنون والإستراتيجيات السهلة والبسيطة والمضمونة والمختبرة التي أقدمها لك في تطبيقي وكتابي هي التي سترفع جاذبيتك وسحرك عند الجنس اللطيف، وهي جواز مرورك الأكيد والناجح إلى عالمهنَّ، عبرها ستحدث فرقًا كبيرًا في علاقتك معهنَّ وستتغير حياتك بصورة كلية إلى الأفضل في هذا المجال، وأنا على ثقة تامة بأن ما أقدمه لك سَيُمكن من إحداث تميز حقيقي في شخصيتك وطريقة تعاملك مع النساء وسيرفع حظك عندهنَّ أضعافًا مضاعفة، طَبِّق هذه التقنيات وستجد الفرق.',
                      ),
                      _buildSimpleParagraph(
                        'في هذا التطبيق أنت تطَّلِع على عدد كبير من المعلومات حول التعارف على النساء، كل معلومة تقوم بتعلمها وتحويلها إلى واقع من خلال التدرب عليها وتطبيقها تكون نقطة في سجلك، كلما جمعت عددًا أكبر من النقاط، كلما كان النجاح أكبر في التعامل مع النساء، كلما تعلمت وتدربت على تقنيات أكثر كلما ارتفعت أسهمك عند النساء أكثر، وكلما قلت أخطاؤك في التعامل مع النساء كلما أصبحت أكثر جاذبية.',
                      ),
                      _buildSimpleParagraph(
                        'أنت يجب أن تتعرف على بعض النساء حتى تعجبك إحداهنَّ ويكون عندكما توافق في كثير من الرؤى والأهداف والأمنيات، جميع النساء الأخريات حقيقة هنَّ فقط مرحلة في طريق الوصول إلى الهدف، إلا إذا كان هدفك أن تحيط نفسك بالمعجبات، وتكون محط اهتمام الفتيات في كل مكان تتواجد فيه.',
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

  Widget _buildSimpleParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
          fontSize: _fontSize, // استخدام حجم الخط المتغير
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}