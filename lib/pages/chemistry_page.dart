import 'package:flutter/material.dart';

// BannerAdWidget جاهز هنا كعنصر ثابت للإعلانات
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

class ChemistryPage extends StatefulWidget {
  @override
  _ChemistryPageState createState() => _ChemistryPageState();
}

class _ChemistryPageState extends State<ChemistryPage> {
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
                          'كيمياء الجذب ',
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
كيمياء الجذب (كيمياء الحب)

ما الحب؟ هل خطر لك من قبل أن تسأل: لماذا ننجذب لشخص محدد ولا ننجذب لشخص آخر؟ لماذا باعتقادك يُثير شخص انتباهنا من اللحظة الأولى بينما يبقى آخر لفترة سنوات طويلة غير ملفت لانتباهنا؟ ما الذي يشعرنا أن شخصًا ما مناسب لنا أو لا؟

الحب: مجموعة من العمليات الكيميائية التي تجري في الدماغ بتأثير محفز أو أكثر، على سبيل المثال: النظر إلى شخص يبدو لنا جذابًا، هذا المحفز البصري ينتقل من الجهاز العصبي المحيطي إلى الجهاز العصبي المركزي حيث تجري هناك عمليات كيميائية متعددة تؤدي إلى إفراز الإندروفينات، فإذا كنت محاطًا بأناس مريحين وسعداء فعلى الأرجح ستقلد وتعكس تعبيرهم وتصبح حلو المزاج، وعلى العكس عندما تكون محاطًا بأشخاص تعساء، وهذا ما يفسر سبب ابتسامنا في وجه من نراه مبتسمًا، فالابتسام يؤثر على جهازنا العصبي اللا إرادي، وعندما يتعلق الموضوع بالحب من أول نظرة يكون البصر هو صاحب الدور الحاسم، فالعلماء يُرجعون ذلك إلى أننا ننجذب للشخص الذي يذكرنا بأناس يبدون لنا الكثير، هذه المشاعر التي يولدها فينا أناس معينون ننقلها إلى أناس آخرين بسبب مظهرهم.

المحفزات السمعية: فإثارة الضحك -على سبيل المثال- عند الشخص الآخر عبر رواية طرفة أو هفوة يُحفز إفراز الإندروفينات، والمعروفة بكونها المسؤولة عن تحسين المزاج وتخفيف الضغط العصبي.

المحفزات اللمسية: حيث تؤدي المداعبة والتقبيل إلى تحفيز إفراز هرمون الأكسيتوسين عند الزوجة، ويوازيه هرمون الفازوبريسين عند الرجل والمسئولان عن الرغبة بالتقارب وتوثيق رباط الحب بين الطرفين.

إلى جانب المحفزات السابقة توجد المحفزات الشمية، الشيء الحاسم هنا هو الفورمونات، كل إنسان يرسل إشارات في صورة مواد كيميائية، والتي تحرر تفاعلًا كيميائيًّا عند المستقبل عبر حاسة الشم، حيث تحفز الفورمونات إنتاج الإندروفين، المعروف أنه إحدى هرمونات السعادة، والذي يعطينا الشعور بالولع تجاه الشخص الآخر. الهرمون الثاني هو السيروتونين الذي يحفز المنطقة المسؤولة عن التفاعل العاطفي في قشرة المخ ويجلب على الشعور بالرضا ويخفض المشاعر السلبية كالخوف. الهرمون الثالث هو الدوبامين الذي يحثنا على الحركة ويعطينا الشعور بالنشاط، بل أيضًا السعادة حيث إن الحركة تحفز مرة أخرى إفراز هرمون الإندروفين. والهرمون الرابع هو النورادرينالين والذي يحفز الجهاز العصبي المركزي والذي يعطينا الشعور بالنشاط والحيوية.

ولكن إذا كانت الفورمونات تفرز من أجسام جميع الناس، فلماذا لا نجد التأثير نفسه عند جميع الناس؟ في الحقيقة يوجد الكثير من العوامل التي تحول دون تأثير هذه الفورمونات، فبعض الناس اعتاد على الاستحمام يوميًّا، الأمر الذي يؤدي إلى إزالة الفورمونات التي يفرزها جسده، كذلك أيضًا فإن مقدار الفورمونات التي يفرزها جسم شخص ما يختلف عن مقدارها عند شخص آخر، وتأثر المستقبل يختلف من إنسان إلى آخر، ففي حين يتأثر بعض الناس بكميات قليلة من الفورمونات نجد أن البعض الآخر يحتاج إلى كميات أكبر، على العموم أَوَدُّ الإشارة هنا إلى أن رائحة تعرق الرجل هي واحدة من الأشياء التي تجذب المرأة إلى الرجل بقوة، هذه الرائحة تكون جذابة ومثيرة عندما تكون ضمن الحدود الطبيعية، الإفراط في الاستحمام يقود إلى إزالة هذه الرائحة، وبالتالي فقدان عنصر هام من عناصر الجاذبية، وفي المقابل فإن إهمال النظافة الشخصية وقلة الاستحمام يؤدي إلى تكون الروائح الكريهة والمنفرة، فاحرص على التوازن بين كلا الأمرين.
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
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}