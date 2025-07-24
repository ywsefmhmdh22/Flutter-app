import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا

class IntellectualPropertyPage extends StatelessWidget {
  const IntellectualPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'حماية الملكية الفكرية',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.shield_outlined, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                'حقوق النشر والملكية الفكرية',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'هذا التطبيق محمي بموجب قوانين حقوق النشر والملكية الفكرية.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'يُمنع منعًا باتًا إعادة نشر أو توزيع أو نسخ أي جزء من محتوى هذا التطبيق أو الكتاب المرفق به، سواء كان ذلك ملفًا أو نصًا أو صورًا أو تصاميم، إلا بإذن خطيٍّ مسبق من مطور التطبيق.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'جميع المحتويات داخل التطبيق أو الكتاب مملوكة حصريًا لصاحبها، وأي محاولة لاستخدامها بشكل غير قانوني قد تؤدي إلى اتخاذ إجراءات قانونية ضد المخالف.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'نحن نُقدِّر التزام المستخدمين بحقوق الملكية الفكرية، ونشكر لكم احترامكم وتفهمكم.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'مع تحيات فريق التطوير.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}