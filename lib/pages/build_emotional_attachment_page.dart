import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // تأكد من أن BannerAdWidget معرف هنا

class BuildEmotionalAttachmentPage extends StatefulWidget {
  const BuildEmotionalAttachmentPage({super.key});

  @override
  _BuildEmotionalAttachmentPageState createState() => _BuildEmotionalAttachmentPageState();
}

class _BuildEmotionalAttachmentPageState extends State<BuildEmotionalAttachmentPage> {
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
                          'بناء الارتباط العاطفي',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
تقنيات بناء الارتباط العاطفي يتم البدء بها منذ اللقاء الأول مع الفتاة بالتوازي مع بناء الجاذبية، فبناء الارتباط العاطفي ليس منفصلًا عن بناء الجاذبية، والفصل بينهما في الكتاب جاء لتوضيح الأشياء التي تقود إلى بناء الجاذبية والأشياء التي تقود إلى بناء الارتباط العاطفي.

### 1. طرح مواضيع أو أسئلة تولد مشاعر إيجابية
مثال 1: ما الشعور الذي ينتابكِ، إذا كنتِ تجلسين بجانب المذياع، وفجأة جاءت أغنيتكِ المفضلة؟
مثال 2: أتذكرين كيف كان شعوركِ عندما أبلغوكِ بنجاحكِ في امتحان الشهادة الثانوية؟
مثال 3: هل تعرفين ذاك الشعور عندما يحقق المرء أجمل أمنياته؟ كيف كانت مشاعركِ عندما قرأتِ نتائج المسابقة ووجدتِ اسمكِ بين الناجحين؟
مثال 4: لا أستطيع أن أتخيل في الشتاء شيئًا أجمل من حبات الثلج في أول تساقطها على الأرض والأشجار والبيوت، إنه لمنظر جميل ساحر! هل تحبين الثلج؟ ما هي أجمل ذكرياتكِ مع الثلج؟

### 2. أخذ كلمات المرأة وإعادة صياغتها وإرجاعها لها بحيث تكون تأكيد وموافقة لرأيها
هي تقول: كم أحب ذلك الشعور، عندما أجلس في الشتاء على كرسي إلى جانب المدفأة، وأنا ملتحفة بحرام ناعم، أسمع صوت زخات المطر في الخارج، وأرى حباته المتساقطة على بلور النافذة تنساب برفق.
فأقول لها: كم إنه لشعور جميل، خاصة عندما يجلس المرء وبجانبه كوب من الشاي الساخن أو الكاكاو يرتشف منها وهو يتأمل منظر حبات المطر المتساقطة على بلور النافذة.

### 3. رواية القصص العاطفية بصورة خاصة والقصص المثيرة بصورة عامة
لكي تقود محادثة عاطفية مع المرأة يجب أن تروي قصصًا حميمية ممتعة، قصصًا عاطفية ومثيرة وعن عالم الرفاهية، بعد ذلك تضع أسئلة عاطفية، أنت يجب أن تثير عاطفة المرأة، تجعلها حزينة، تجعلها مبتسمة، مرتبكة، كل نوع من تحريك المشاعر عند المرأة هو نقطة في صالحك. فالنساء تتناول القصة بشكل مختلف عن الرجال، هنَّ لا يتبعن المنحى الرئيسي للقصة، هنَّ يتبعن الاتصالات المتشعبة (أي ما خلف القصة)، يجب الانتباه لما تحويه القصة من معاني: العائلة، الأصدقاء، النجاح، حولك شخصيًّا. وإليك بعض الأمثلة:

قصة عاطفية (1):
عندما كنت عائدًا البارحة إلى البيت وجدت في الطريق قطة صغيرة، كانت تبدو جميلة، كانت جائعة تموء وهي ترتجف، فكرت أن أحضرها معي إلى البيت، لم تكن قادرة على المشي، في البيت أحضرت لها أمي صحنًا من الحليب الساخن وأجلستها بجانب المدفأة على مسند صغير وبدأت تداعبها، القطة بدأت تتحسن رويدًا رويدًا، لتبدأ بعدها في اللعب في أرض الغرفة، كانت تتقرب باستمرار من أختي الصغيرة تريد أن تلعب معها (لا يوجد شيء يحرك مشاعر المرأة مثل قصة الحيوان الحزينة والبطل).

قصة عاطفية (2):
عندما كنت البارحة مع أهلي في قطاف الكرز، سقطت ابنة أختي الصغيرة من على الشجرة، لقد كسر ساقها، لقد كنت طوال البارحة معها في المستوصف.
كيف تحلل المرأة القصة؟ هو عنده عائلة كبيرة، هم أسرة مترابطة، هم يتعاونون مع بعضهم البعض.

قصة مثيرة:
هل تعلمين أن 25 بالمائة من الطبعات في إنكلترا تخرب، بسبب الأشخاص الذين يجلسون عليها، لتصوير مؤخرتهم.

قصة عن عالم الرفاهية:
عندما أريد أن أغزو عالم الأحاسيس والرفاهية عندها أستطيع أن أروي لها عن هذه الأشياء، عندما أستطيع أن أخلق الخيال أن المرأة معي ستحقق أحلامها أكون قد ربحت.
إذا كنت تتحدث عن السفر إلى الجزر الإسبانية، فتحدث بصورة مصورة وبإسهاب عن الجمال والطبيعة والطقس والأكل اللذيذ والعصير والاستجمام وحمام الزهور، وأتم حديثك بأنك تريد أن تقوم بذلك معها يومًا ما، كي تتنزها معًا وتستمتعا معًا بمنظر الغروب. ليس من الضروري أن تسافر إلى هناك، صف لها أنكما معًا سيكون هذا أجمل.

### 4. تقنية النسخ الكربوني (محاكاة لغة جسد الفتاة)
قم بمحاكاة لغة جسد الفتاة (عكس حركات جسدها) بطريقة لطيفة وخفية، ولا تحاكي الإيماءات السلبية، ولا تفرط في المحاكاة، حتى لا يكون ملفتًا للانتباه، قلد حركات رأس الفتاة، وضعية وقوفها، وضعية جلوسها، إيماءاتها، تعابير وجهها، وضعية سيقانها...... عمومًا تعتبر محاكاة لغة جسد شخص ما وطريقته في الكلام بطريقة لطيفة وخفية دون إفراط ودون أن تشعره بأنك تقلده في تصرفاته وحركاته وسيلة فعالة في بناء التقارب والحميمية، حيث إنه يجد فيك شيئًا منه دون أن يدركه، فأنت تقول له بأسلوب غير مباشر: نحن متوافقان تمامًا، فلغة جسدينا متناغمة ونملك نفس المشاعر والميول، فتناغم الحركات يولد الشعور بالانسجام والأمان بين المتحاورين، ومن المرجح عندما تملك الناس مشاعر أو طرق تفكير موحدة أن تتولد بينهم الألفة والمحبة. وعندما يقوم الرجل بمحاكاة تعبير وجه المرأة وإيماءات جسدها يتولد انطباع لديها بأنه رجل لطيف وحنون وجذاب.
علاوة على محاكاة لغة الجسد، حاول أن تنتبه إلى المفردات والعبارات والجمل الأكثر استخدامًا في حديثها، واستخدمها في حديثك بصورة خفية وبدون مبالغة، والهدف من ذلك إرسال رسالة مفادها (أنا مثلك وأشبهك تمامًا مما سيحدث نوعًا من التقارب على مستوى اللاوعي).

أمثلة توضيحية عن المحاكاة
* هي تضع يدها على حافة كرسيها، أنت تحاكيها بوضع يدك على حافة كرسيك في نفس اللحظة.
* هي تمد يدها لتناول كوبها من العصير، أنت تحاكيها بمد يدك لتناول كوبك من العصير في نفس اللحظة.
* هي تمسك كوبها من العصير بكلتا اليدين، أنت تحاكيها بمسك كوبك من العصير بكلتا اليدين في نفس اللحظة.
* هي تبتسم فابتسم، هي تضحك فاضحك، تحك كوعها فحك كوعك، هي تضع رجلًا على رجل فضع رجلًا على رجل في نفس اللحظة.
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
                    const SizedBox(height: 16.0), // مسافة قبل الصورة
                    Center(
                      child: Image.asset(
                        'assets/images/emotional_attachment_example.jpg', // مسار الصورة الجديد هنا
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16.0), // مسافة بعد الصورة
                    Text(
                      '''
أمثلة توضيحية مصورة عن المحاكاة
''',
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
      // --- Ad banner added here ---
      bottomNavigationBar: BannerAdWidget(),
      // ----------------------------
    );
  }
}