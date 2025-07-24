import 'package:flutter/material.dart';
import 'package:maharat_jazb_alnisa/main.dart'; // يمكنك حذفه إذا لم يكن مطلوبًا

// BannerAdWidget placeholder (حل المشكلة)
class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade100,
      height: 50,
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

class PartnerSelectionPage extends StatefulWidget {
  @override
  _PartnerSelectionPageState createState() => _PartnerSelectionPageState();
}

class _PartnerSelectionPageState extends State<PartnerSelectionPage> {
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
                      'المعايير الأنثوية في انتقاء الشريك',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الأشياء التي تجذب المرأة نحو الرجل هي امتلاك واحدة أو أكثر من الصفات التالية: وهي إما الغنى، أو السلطة والنفوذ، أو الشهرة، أو الموهبة، أو المنزلة الاجتماعية الرفيعة، أو الجمال، أو الشخصية، والشيء الذي نريد العمل عليه هنا هو الشخصية.',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '1. سمات الشخصية التي تجذب المرأة:',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    ...[
                      '∞ المظهر (النظافة والأناقة).',
                      '∞ الثقة بالنفس.',
                      '∞ الروح المرحة والفكاهة.',
                      '∞ الإرادة القوية والإصرار على تحقيق الأهداف.',
                      '∞ الغموض.',
                      '∞ امتلاك قناعات وآراء خاصة.',
                      '∞ الذوق في كل شيء، في انتقاء الأطعمة والمشروبات، في انتقاء الملبوسات...',
                      '∞ مسحة من المستوى الثقافي.',
                      '∞ الرومانسية.',
                      '∞ الذكاء بصورة عامة والذكاء العاطفي بصورة خاصة.',
                      '∞ المهارة والكفاءة الجنسية.',
                      '∞ القدرة على التعبير عن الأشياء والآراء والأفكار والمواقف.',
                      '∞ القدرة على رواية القصص والتحدث عن الأشياء المختلفة بطريقة مثيرة.',
                      '∞ القدرة على التفاعل الاجتماعي وتكوين العلاقات العامة والصداقات.',
                      '∞ الخبرات والكفاءات في المجالات المختلفة.',
                      '∞ التميز عن الأقران.',
                      '∞ حب المغامرة، الحماسة، الجرأة.',
                      '∞ الصدق',
                    ].map((text) => _buildBulletPoint(text, _fontSize)).toList(),
                    const SizedBox(height: 20),
                    Text(
                      '2. الشخصيات من الرجال التي لا تنجذب إليها النساء:',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: _fontSize + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    ...[
                      '• ضعيف الشخصية',
                      '• الكذاب والمخادع',
                      '• البخيل',
                      '• المهمل والفوضوي',
                      '• الغيور',
                      '• المتهور',
                      '• المنغلق',
                      '• غير الوفي',
                      '• الذي لا يصغي إليها',
                    ].map((text) => _buildBulletPoint(text, _fontSize)).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }

  Widget _buildBulletPoint(String text, double currentFontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: currentFontSize,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}