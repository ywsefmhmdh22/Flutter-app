import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // Make sure BannerAdWidget is defined here if you use it

class SuccessfulMeetingPage extends StatefulWidget {
  @override
  _SuccessfulMeetingPageState createState() => _SuccessfulMeetingPageState();
}

class _SuccessfulMeetingPageState extends State<SuccessfulMeetingPage> {
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
                      'نصائح لقضاء موعد ناجح ',
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
♣ أنت يجب أن يكون عندك برنامج: متى وأين سيتم اللقاء؟ كم من الوقت ستمضي معها؟ ما هي الأنشطة والأشياء التي ستقومان بها، ما هي المواضيع التي ستتحدث معها حولها، ما هي الأماكن التي ستقومان بزيارتها، فالدراسات العلمية تؤكد أنه كلما زرتما أماكن أكثر كلما عشتما معًا تجارب أكثر خلال الموعد الواحد، كلما زادت الثقة بينكما، فالدماغ لا يحتفظ بالمدة بل بالانطباعات، عندما تزوران مواقع وأماكن متعددة يتولد شعور بأنكما تعرفان بعضكما منذ فترة طويلة، هذا سيكون مساعدًا لتطوير العلاقة بسرعة بينكما، قم بزيارة المقهى والحديقة والمكتبة والسوق والمعرض وغيرها.

♣ أنت يجب أن تتولى القيادة، يجب أن تعرف ماذا ستفعل وأن تكون كريمًا واثقًا من نفسك، تجيد التصرف ومرنًا.

♣ من الضروري أن تعرف أن اللقاء الأول يكون بمثابة اختبار للملائمة، فالمرأة تتواعد مع الرجل فقط عندما تجده جيدًا وتريد أن تتعارف عليه أكثر، أو أنها غير متأكدة من مشاعرها ورؤيتها نحوه وتريد أن تتعرف ذلك بصورة أفضل.

♣ فكرة لأجل الموعد أن تقوما بعمل شيء مشترك، لا تجلسا مقابل بعضكما، افعلا شيئًا، كن نشطًا، أنت عندك الإمكانية أن تعيش مع المرأة تجربة وأن تريها نفسك، قم بشيء رياضي كالتنس والبلياردو أو البولينج وغيرها، فالنساء تحب الرجال الذين يعملون شيئًا مختلفًا عما هو متوقع أو معتاد، هنَّ يحلمن بداخلهنَّ بالشخص الذي يأتي ويجتذبهنَّ كي يعشن تجربة غير اعتيادية.

♣ أنت يجب أن تعطي الفتاة خلال المحادثة انتباه غير مشتت، أغلق هاتفك المحمول وركز على الموعد، رنين الهاتف المستمر والرسائل الهاتفية النصية المتكررة أو النظر المتكرر إلى الساعة يولد الانزعاج عند الطرف الآخر، لا يوجد في هذه الساعة شيء أهم من الموعد مع الفتاة.

♣ إذا بدأت المرأة تتكلم في الموعد عن المشاكل والأحزان والهموم لا تستمع لها مطولًا، أمسك بيدها وقل لها: إنك مسرور لثقتها بك وأنك تفهمها وأنها يجب أن تنسى كل هذا وأن تمضي معك وقتًا جميلًا.

♣ أنت يجب أن تكون قادرًا على توليد مشاعر رومانسية عند المرأة، فكل امرأة عندها تطلع مؤكد تجاه الرومانسية في حياتها.
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
      bottomNavigationBar: BannerAdWidget(), // Ensure BannerAdWidget is defined in main.dart
    );
  }
}