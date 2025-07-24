import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart';// تأكد من وجود BannerAdWidget هنا

class OnlineDatingProsConsPage extends StatefulWidget {
  @override
  _OnlineDatingProsConsPageState createState() => _OnlineDatingProsConsPageState();
}

class _OnlineDatingProsConsPageState extends State<OnlineDatingProsConsPage> {
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
          backgroundColor: Colors.blue, // لون الأزرق بدل الوردي
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
                      'مزايا وعيوب البحث عن طريق الإنترنت',
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
1   :       مزايا البحث عن طريق الإنترنت

♣ يمثل الإنترنت إمكانية جديدة للرجال الذين يبحثون عن شريكات حياتهم.
♣ تواجد أعداد كبيرة من النساء التي تبحث عن الشريك. 
♣ وجود الإمكانية لمغازلة أكثر من امرأة بنفس الوقت. 
♣ لا تحتاج الجرأة اللازمة لأجل المبادرة بالتعارف، والتي يحتاجها الرجل في الحياة الواقعية عمومًا. 
♣ إمكانية التعارف على النساء من مناطق وبلدان مختلفة.
♣ إمكانية تكوين فكرة أولية عن الشريك قبل المبادرة بالتعارف عليه من خلال قراءة ملف تعريفه. 

2  :      عيوب البحث عن طريق الإنترنت

♠ المشكلة الرئيسة في التعارف عن طريق الإنترنت هي وجود الكثير من الرجال مع القليل من النساء، ويكون لدى المرأة من الشباب ما يكفيها لكي تختار من تقابل ومن لا تريد أن تقابل، وتعطي الصفات التي تريدها (مثقف، غني، لون البشرة، لون العيون .....).
 
♠ المرأة الجميلة تحصل على أعداد كبيرة جدًّا من الرسائل ولا تجد الوقت الكافي لديها لقراءة جميع الرسائل والرد عليها.
♠ التعارف عبر الإنترنت أصعب من التعارف في الحياة الواقعية، على العكس مما يظن الكثيرون، فالتعارف عبر الإنترنت يحتاج إلى إبداع في اللغة المكتوبة.

♠ المنافسة عبر الإنترنت قوية جدًّا بالنسبة للرجال، فالبعض لا يحصلون إطلاقًا على ردود، والبعض الآخر يصل إلى مرحلة المواعدة أو حتى يلتقي بالفتاة مرة أو أكثر ثم ينقطع التواصل معها، وربما دون ترك رسالة أو حتى معرفة السبب، ليعود إلى نقطة البداية في المراسلة مع فتيات أخريات. 

♠ غياب كامل للغة الجسد، فأنت لا تستطيع أن تولد المشاعر الإيجابية عبر لغة جسدك ولا تستطيع قراءة لغة جسد الفتاة ومعرفة حالتها والأشياء الأنسب للحالة. 

♠ الكثير من حديثي العهد بالبحث عن الشريك عبر الإنترنت أو ذوي الخبرة المتواضعة في قواعد ومهارات البحث عن الشريك عن طريق الإنترنت يصابون بإحباط، ويكونون تجربة غير مرضية. 

■□■■□■

♠ معظم النساء المتواجدة عبر الإنترنت تنتمي بصورة رئيسية إلى إحدى الصنفين التاليين: 

* الفتاة المتخفية خلف جدار: وهي تتفاعل بصورة باردة وخجولة ويكون أمر جذبها إلى الحياة الواقعية مضنيًا ومتعبًا ويحتاج وقتًا طويلًا. 

* الفتاة العادية (أو غير الجذابة): التي لم تأخذ حظها من الاهتمام بالحياة الواقعية ويكون الإنترنت المنفذ الوحيد لها للبحث عن الشريك.

□■□□■□

♠ الاختلاف الكبير بين الشخصيات على الإنترنت والواقع، فالناس تميل إلى تقديم نفسها عبر الإنترنت بصورة أفضل مما هي عليه بالواقع، وهذا يسري لأجل الصور وملف التعريف بصورة رئيسية ومن هذه الظواهر: 
* تستخدم بعض الفتيات صورها في أعمار أصغر.

* تستخدم بعض الفتيات صور الوجه دون الجسم والذي غالبًا ما يكون غير جذاب.

* تستخدم بعض الفتيات تقنيات الفوتوشوب لإزالة العيوب وتحسين مظهرها في الصور.

■□■■□■

♠ يوجد الكثير من الشخصيات الوهمية على الإنترنت والسبب في ذلك يعود إلى:

* إهمال بعض الأشخاص حذف اشتراكهم على المواقع بعد مغادرتهم لها. 

* بعض الرجال يقتنعون أو يسجلون بصفة نساء لكي يتمكنوا من معرفة الرسائل أو النصوص التي يمكنهم كتابتها.

□■□□■□

♠ وجود أنماط مختلفة من الاحتيال عبر الإنترنت ومنها:

* طلب مبلغ مالي كبير لأجل السفر واللقاء بدعوى عدم وجود إمكانيات لذلك.

* القدوم إلى الموعد واللقاء مع الشاب عدة مرات ثم تظهر فجأة مشكلة مادية كضياع أو نسيان الحقيبة أو الوقوع في أزمة مالية.  
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