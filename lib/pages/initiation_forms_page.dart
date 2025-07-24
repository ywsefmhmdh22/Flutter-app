import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

class InitiationFormsPage extends StatefulWidget {
  @override
  _InitiationFormsPageState createState() => _InitiationFormsPageState();
}

class _InitiationFormsPageState extends State<InitiationFormsPage> {
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
                          'اشكال المبادره بالتعارف',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '''
للمبادرة بالتعارف ثلاثة أشكال:

1 ) إذا رأيت فتاة أثارت إعجابك، فأبدِ لها اهتمامًا إيجابيًّا من خلال بناء اتصال بصري مترافق مع مداعبتك لشعر رأسك أو وضع يديك على الذقن كما في الصورة التي في الصفحة القادمة، انظر إلى وجه الفتاة في عينيها، وفقط في عينيها لمدة خمس إلى عشر ثوانٍ (تجنب الحملقة لأنها ستولد شعورًا مريبًا عندها، فالنظرة يجب أن تكون ودّية هادئة وحنونة تظهر الرغبة في التقارب)، تحاشى النظر إلى جسدها أو مفاتنها فهذا يثير غضبها، النظر في عينيها يكون بمثابة إرسال رسالة أولى بأنك مهتم ومعجب بها.

      كرر ذلك حتى تستجيب لك وتبدأ بالنظر إليك، تجول وبدل مكان وقوفك وقف في مكان آخر، تابع مرة أخرى ردّة فعلها، وهكذا حتى تبدأ هي بالنظر إليك وإظهار الاهتمام بك، عندما تنظر إلى الفتاة ويكون لديها بالمثل الرغبة بالتعارف، فإنها ترد النظرة وترد الابتسام وربما تداعب شعرها أو أي شيء بحوزتها كعقد الرقبة، وعندها يتوجب عليك الاقتراب منها بهدوء والمبادرة بمحادثة عامة ولطيفة معها.
قد يحدث في بعض الأحيان أن يظهر رد فعل الفتاة على رسالتك هذه بقطع الاتصال البصري معك والنظر إلى الأرض أو الجانب أو الأعلى، فكيف تستطيع فهم رد فعل الفتاة هذا؟
'''
                      ,
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15), // Space between text and image
                    Image.asset(
                      'assets/images/gaze_example.jpg', // Make sure to change this path if it's different in your project
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 15), // Space after image
                    Text(
                      '''في الحقيقة إنه عندما تنظر الفتاة بشكل خجول نحو الأرض، تكون هذه بمثابة دعوة لك لتبادر بالكلام معها والتعارف عليها. ولكن ماذا يكون عندما تنظر الفتاة إلى الجانب؟ عندما تنظر الفتاة إلى الجانب فهذا يعني أنها لا تملك القرار بعد تجاهك، أي صنف من الرجال أنت، هي ما تزال مترددة بشأنك، وهنا يتوجب عليك أن تتريث وتعيد المحاولة في وقت آخر. أما عندما تنظر الفتاة نحو الأعلى، فهذا يعني أنها تكون منزعجة ولم تجدك شخصًا مُريحًا، وهنا يتوجب عليك أن تدعها وشأنها. 

2 ) لا تستدعي جميع الحالات استخدام التقنية السابقة، فبعض الحالات يكون البدء  بالمحادثة متاحًا من دون توليد اهتمام سابق عند الفتاة، فالفتيات اللواتي يجمعك بهنَّ رابط كزميلات الدراسة أو العمل، كذلك بنات الحارة والفتيات اللاتي يعملن في المحلات التجارية كالمكتبات ومحلات الأزياء والصيدليات وغيرها يمكن الاقتراب منهنَّ والبدء في محادثتهنَّ في موضوع ملائم لطبيعة الرابط بينكما، كالحديث في أماكن الدراسة عن مواعيد المحاضرات والامتحانات، المدرس الجديد، إجراءات التسجيل في الجامعة أو غيرها من أمور الدراسة، في مكان العمل يمكن طرح موضوع متعلق بقوانين أو ظروف أو مشاكل العمل والزملاء، في الحارة يمكن الحديث عن أحداث تجري في الحارة، جار جديد، خصومة، طريق مسدود، أعمال حفريات أو إصلاح، في المحلات التجارية يمكن طلب النصيحة حول منتج ما وطريقة استخدامه، ويمكن هنا أن تسألها إذا كانت استخدمت هذا المنتج شخصيًّا وكيف وجدتْه (والمهم هنا هو كسر حاجز الجليد بينكما). 

3 ) الدراسات تؤكد حقيقة علمية بأن المرأة هي من يبدأ الخطوة الأولى بالتعارف على الرجل الذي أثار إعجابها من خلال إظهارها علامات الاهتمام والانجذاب تجاهه، الكثير من الرجال لا ينتبهون إلى إشارات التودد والرغبة في التعارف والتقارب المرسلة من الطرف الآخر مثل النظر إلى وجه الشاب والابتسام له (فالنساء لا تنظر في وجوه الرجال الغرباء صدفة)، وهنا يتوجب على الشاب إذا شعر بالانجذاب أيضًا نحو هذه الفتاة أن يستجيب لهذه الإشارات بإرسال إشارات التودد والرغبة في التقارب والتعارف مثل: إنشاء اتصال بصري، الابتسام، مداعبة الشعر والاقتراب من الفتاة بهدوء والمبادرة بمحادثة عامة ولطيفة معها.
'''
                      ,
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
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