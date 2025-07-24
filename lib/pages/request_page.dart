import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
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
                      'طريقة الطلب من المرأة',
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
يمكن للطلب من المرأة أن يتم باستخدام أكثر من طريقة:

*1) استخدم أسلوب الأمر:*
(النساء يجذبها أن تكون منقادة من قبل الرجال الأقوياء).
*أمثلة:*
♫- تعالي غدًا لنحضر سويًّا فيلمًا في السينما.
♫- حضري نفسكِ لنزور حديقة الحيوان السبت القادم.
♫- سأصطحبكِ معي في نزهة الخميس القادم.

ولإضفاء شيء من التلطيف على هذه الطريقة تستطيع أن تقول لها:
♫- بما أنكِ لستِ منشغلة غدًا، إذن تعالي لنحضر سويًّا فيلمًا في السينما.
♫- بعد هذا الأسبوع المليء بالضغوط، يجب أن نرفه عن أنفسنا قليلًا، حضري نفسكِ لنزور حديقة الحيوان السبت القادم.
♫- لقد كنت منشغلًا طوال الأسبوع الماضي ولكني لم أنساكِ، حضري نفسكِ سأصطحبكِ معي في نزهة الخميس القادم.

*2) استخدم طريقة السؤال المتلاعب:*
(أنت تعطي خيارين وعليها أن تختار أحدهما).
*أمثلة:*
♫- هل ترين أن نذهب لنتنزه قليلًا في الحديقة، أم أنكِ ترين أن نشرب شيئًا باردًا؟
♫- أرغب في أن نذهب لشرب القهوة معًا، ماذا يكون عندكِ الأسبوع القادم الأحد أو الاثنين؟
♫- أرغب في أن أراكِ مرة أخرى، ما رأيكِ أن يتم ذلك الخميس القادم أو ترين أن أتصل بكِ غدًا؟

فكر عندما تطلب من الفتاة شيئًا، ماذا يمكن لها أن تجيب؟ عندما تعطيها خيارًا واحدًا، بالطبع لن تجد لنفسها سوى الرد بـ: (لا)، بالمثل يكون عندما تستخدم طريقة السؤال البديل، والتي من خلالها تعطي المرأة إمكانية الجواب بأنه لا يوجد لديها الرغبة أو الوقت لتمضيه معك.

ومن الأمثلة على طريقة السؤال البديل:
♫ هل أنتِ مستعجلة؟ أم أننا نستطيع أن نتحدث معًا لبعض الوقت؟
♫ هل تريدين أن تبقي لوحدكِ؟ أم أنني أستطيع الجلوس معكِ؟
♫ هل أنتِ منشغلة؟ أم أننا نستطيع الذهاب لنتمشى معًا قليلًا؟

عندما تعطيها خيارًا واحدًا كأن تقول لها: ما رأيكِ أن نذهب لنشرب شيئًا؟ سيكون جوابها (لا). كذلك أيضًا عندما تستخدم طريقة السؤال البديل كأن تقول لها: هل أنتِ مستعجلة؟ أم أننا نستطيع أن نتحدث معًا لبعض الوقت؟ فأنت تعطيها خيارا أن تقول لك: لا، أنا مستعجلة. ولاكن
.عندما تستخدم طريقة السؤال المتلاعب فأنت تشترط بشكل ضامن وواثق بأن المرأة هكذا أو هكذا عندها كل الرغبة والوقت لتمضيه معك، وبأن الموضوع يتمحور فقط: بماذا ستمضي المرأة الوقت معك؟ فعندما تقول لها: ما رأيكِ أن نذهب لنتنزه قليلًا في الحديقة، أم أنكِ ترين أن نشرب شيئًا باردًا؟ سيكون أمامها خياران وغالبًا ستختار أحدهما، وكل منهما في صالحك، هذا لا يعني أن المرأة لن تقول: (لا)، ولكن هذا سيكون غير لائق ومهذب، وستحتاج هنا إلى عذر مقنع تبين لك من خلاله لماذا ترفض كلا العرضين.

*3 ) الاستشارة الملعوبة:*

أنت تعرض شيئين، وتخبرها -على سبيل المثال- أن هناك حفلة طلابية أو مهرجانًا للتسوق يقامان في وقت واحد وبأنك ترغب أن ترى أحدهما، ولكنك مازلت مترددًا في القرار ثم تطلب استشارتها: أيًّا من الحدثين تنصحك أن تشاهد؟ أنت تجلبها أن تبدي رأيها، بعد أن تبدي رأيها وتضع الأسباب لذلك، أبلغها بأنها أقنعتك وبأنك تقترح عليها أن تشاهداه معًا.

*4 ) أن تضع لها سؤالًا تمهيديًّا غير مباشر:*

أنت تسألها إذا ما كانت لا تتورع عن تجربة أي شيء جديد، تجربة مطعم جديد، ممارسة هواية جديدة، وعندما يكون جوابها بأنها بالفعل من هذا النوع من الناس الذين يحبون التعرف على أشياء جديدة تستطيع أن تقول لها: أنتِ قلتِ مؤخرًا بأنكِ لا تتورعين عن تجربة شيء جديد، في أول الحارة افتتحت صالة جديدة للبولينج، الصالة تبدو رائعة ومجهزة بصورة جيدة، دعينا نذهب ونجرب سويًّا لعبة البولينج
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