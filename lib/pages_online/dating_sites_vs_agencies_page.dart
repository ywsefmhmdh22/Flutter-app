import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart';// تأكد من وجود BannerAdWidget هنا

class DatingSitesVsAgenciesPage extends StatefulWidget {
  @override
  _DatingSitesVsAgenciesPageState createState() => _DatingSitesVsAgenciesPageState();
}

class _DatingSitesVsAgenciesPageState extends State<DatingSitesVsAgenciesPage> {
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
                      ' مواقع التعارف ووكالات التعارف',
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
خصائص مواقع التعارف:

المزايا:
○ تستطيع محادثة كل فتاة على النت في الموقع، أي خيارات كبيرة في التعارف.
○ يجب أن تدفع اشتراكات غير كبيرة أو ربما مجانية.

العيوب:
● تحتاج إلى صبر كبير للحصول على أول رد من فتاة على الموقع.
● مبالغ الاشتراك المنخفضة تسمح بدخول أعداد كبيرة من المنافسين.
● كثرة وجود الشخصيات الوهمية.
● الشخص يحتاج الكثير من الوقت والخبرة لمعرفة الشخصيات الحقيقية من الوهمية.
● إمكانية الوقوع ضحية للاحتيال، فالموقع غالبًا لا يكون مسؤولًا.
● أعداد النساء النشطة في البحث عن الشريك تكون أقل بشكل واضح من أعداد الرجال.
● وجود الكثير من الملفات القديمة الميتة.
● توضع عليك كامل المسؤولية في البحث عن الشريك على عكس وكالات التعارف.
● المنافسة قوية لا تهدأ.
● النساء يملكن خيارات أكبر وعلى العكس خيارات أقل بالنسبة للرجال.
● تستغرق وقتًا أكبر في قراءة كل ملف وعدد الملفات التي يجب أن تقرأها، إضافة إلى عدد الرسائل التي يجب أن ترسلها.

خصائص وكالات التعارف:

المزايا:
○ تعتمد على مطابقة المواصفات المطلوبة لكل من الشريكين حسب العرض والطلب وهنا تكون نسب التوافق كبيرة بين الشريكين.
○ بعض المواقع تعطي الفرصة لمدة محدودة يومين أو ثلاثة، لاختبار مدى إمكانية استخدام الموقع، حيث يقدم لك الموقع عدد الشخصيات الموافقة لك وملفات تعريفها دون إظهار الصور غالبًا وعدم إمكانية البدء بالمراسلة قبل تسديد الاشتراك.
○ توفر الوقت والجهد.
○ تتناسب مع الجادين في البحث عن الشريك بسبب الرسوم المرتفعة.
○ لا تعطى النساء أعدادًا كبيرة من الخيارات وتخفض مستوى المنافسة مع الرجال الآخرين.
○ مستوى الإحباط أقل في الحصول على الشريك.
○ لا يجد الوهميّون والمحتالون مكانًا لهم هنا بسبب تحقق الموقع من هوية المستخدم.

العيوب:
● تكاليف أكبر قد تصل إلى أضعاف تكاليف مواقع التعارف (على حسب المهام التي يتولى الموقع القيام بها نيابة عنك).
● التواصل محصور بالأشخاص المطابقين لهدف البحث عند كلا الجنسين وهنا ينحصر الخيار في أعداد محدودة من المرشحين، الأشخاص الآخرون في الموقع لا يمكن بلوغهم (هذا العدد يتعلق طبعًا بعدد المسجلين في الموقع ويمكن لشخص أن يحصل على أكثر من مائة عرض ولشخص آخر على عشرين عرض فقط)، بالطبع هذه المواقع لا تخبر عن عدد المسجلين فيها.
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