import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    sendVisit('about_page');
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize = _fontSize + 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize - 2.0;
      if (_fontSize < 12.0) _fontSize = 12.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
                          // تصغير الخط
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
                          // تكبير الخط
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
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          'مرحبًا بك في تطبيق "مهارات جذب النساء الجميلات"',
                          style: TextStyle(
                            fontSize: _fontSize + 4,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),

                      _buildSimpleParagraph(
                        'يهدف هذا التطبيق إلى تزويدك بأفضل الأدوات والنصائح التي تحتاجها لتطوير مهاراتك في التواصل مع النساء الجميلات، وفهمهنَّ بصورةٍ أعمق. هنا ستجد مجموعةً كبيرةً من التقنيات والاستراتيجيات المجربة والمدروسة التي ستساعدك في جذب انتباههنَّ وبناء علاقةٍ ناجحةٍ ودائمة.',
                      ),
                      _buildSimpleParagraph(
                        'كثيرٌ من الرجال الذين يعانون من ضعف الاهتمام من الجنس اللطيف تبيَّن بعد تطوير مهاراتهم أنهم لم يدركوا العالم المحيط بهم إدراكًا جيِّدًا. حين تبدأ النظر إلى محيطك بوعيٍ أكبر، سيتغيَّر حظُّك عند الجنس الآخر بصورةٍ جذرية.',
                      ),
                      _buildSimpleParagraph(
                        'يظنُّ كثيرٌ من الرجال أنهم إن لم يكونوا أغنياء وذوي مظهرٍ جميلٍ وجذاب فحظهم سيكون ضئيلًا عند المرأة الجميلة. والحقيقة مختلفة تمامًا؛ فكثيرون يعانون في التعارف لأنهم لا يعرفون كيف يتعاملون مع النساء، ولا كيف تفكِّر المرأة وماذا تريد.',
                      ),
                      _buildSimpleParagraph(
                        'أصبح التعرُّف إلى الفتاة قبل التقدُّم رسميًّا فكرةً شائعةً ومألوفةً في كل مكان؛ وهذا يقتضي امتلاك الشاب درايةً كافيةً بالمهارات والمعارف ذات الصلة التي تُعينه على اختيار شريكة حياته وفارسة أحلامه. ولأن كثيرًا من الشبان يفتقرون إلى المعرفة بالكيفية الصحيحة للتعامل مع النساء، فإنهم يقعون في أخطاءٍ كثيرةٍ لا يدركونها؛ مما يقودهم إلى الخيبة والفشل والإحباط وضعف الثقة بالنفس.',
                      ),
                      _buildSimpleParagraph(
                        'إذا أردتَ معرفة الطرق المضمونة لتكون محظوظًا عند النساء، فستجد في هذا التطبيق مفاتيح النجاح في التعرُّف إلى النساء الجميلات. سواءً كنت تبحث عن شريكة الحياة وفارسة الأحلام، أو تعلّق قلبك بفتاةٍ معيّنة وتريدها أن تبادلك الشعور، ولم تعرف ما الذي ينبغي فعله لتحظى باهتمامها وقبولها وكيف تحرِّك مشاعرها نحوك؛ فهنا ستجد ما يؤثِّر حقًّا في المرأة، مع شرحٍ سهلٍ ومبسَّطٍ وأمثلةٍ مفصّلة: كيف يتعرَّف الرجل إلى المرأة؟ ماذا يقول؟ وما الذي يُستحسن أن يتجنّبه؟ وسأرشدك إلى الأشياء ذات التأثير الفعّال التي تُحرِّك اهتمام المرأة نحوك، وهي أمورٌ لا يعرفها إلا القليل.',
                      ),
                      _buildSimpleParagraph(
                        'لعلّك الآن متحمِّسٌ وتتساءل: ماذا أقول أو أفعل لأحظى باهتمام الفتاة الجميلة الجذّابة؟ كيف أتقرّب إليها بصورةٍ صحيحة؟ وكيف أُطوِّر علاقتي معها؟ وكيف أستطيع الفوز بقلب فتاةٍ جميلةٍ تقع في حبّي؟ كل إنسانٍ يرغب في تعلُّم المهارات التي ترفع كفاءته ليصبح صاحب تأثيرٍ جذّاب لا يُقاوَم عند النساء.',
                      ),
                      _buildSimpleParagraph(
                        'إن التقنيات والفنون والاستراتيجيات السهلة والبسيطة والمضمونة والمختبَرة التي أقدِّمها لك في هذا التطبيق وكتابي هي التي سترفع جاذبيتك وسحرك عند الجنس اللطيف، وهي جواز مرورك الأكيد والناجح إلى عالَمِهِنَّ. عبرها ستُحدِث فرقًا كبيرًا في علاقتك بهنَّ، وستتغيَّر حياتك كلِّيًّا إلى الأفضل في هذا المجال. وأنا على ثقةٍ تامّة بأن ما أقدِّمه لك سيمكِّنك من إحداث تميُّزٍ حقيقيٍّ في شخصيتك وطريقة تعاملك مع النساء، وسيرفع حظَّك أضعافًا مضاعفة. طبِّق هذه التقنيات وسترى الفارق.',
                      ),
                      _buildSimpleParagraph(
                        'في هذا التطبيق تطَّلع على كمٍّ كبيرٍ من المعلومات حول التعرُّف إلى النساء. كلُّ معلومةٍ تتعلَّمها وتحوِّلها إلى واقعٍ بالممارسة تُسجِّل لك نقطةً في رصيدك. وكلما جمعت نقاطًا أكثر زاد نجاحك في التعامل مع النساء؛ فكلما تعلَّمت وتدرَّبت على تقنيات أكثر ارتفعت أسهمك لديهنَّ، وكلما قلَّت أخطاؤك أصبحت أكثر جاذبية.',
                      ),
                      _buildSimpleParagraph(
                        'ينبغي لك أن تتعرَّف إلى عددٍ من النساء حتى تعجبك إحداهنَّ ويكون بينكما توافقٌ في كثيرٍ من الرؤى والأهداف والأمنيات. أمّا سائر النساء فهُنَّ مراحل على طريق الوصول إلى الهدف، إلا إن كان هدفك إحاطة نفسك بالمعجبات ونيل الاهتمام أينما كنت.',
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
          color: Colors.white.withOpacity(0.90),
          fontSize: _fontSize,
          height: 1.7,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}