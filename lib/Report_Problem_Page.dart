import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main.dart'; // تأكد من أن BannerAdWidget موجود في هذا الملف أو مساره صحيح
import '../services/api_service.dart'; // تأكد من صحة مسار الخدمة

class ReportProblemPage extends StatefulWidget {
  const ReportProblemPage({super.key});

  @override
  State<ReportProblemPage> createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneModelDetailsController = TextEditingController();

  String? _selectedPhoneBrand;

  final List<String> _phoneBrands = [
    'غير محدد',
    'Samsung',
    'Apple (iPhone)',
    'Xiaomi',
    'Huawei',
    'Oppo',
    'Vivo',
    'Realme',
    'OnePlus',
    'Google Pixel',
    'Nokia',
    'Motorola',
    'LG',
    'Sony',
    'HTC',
    'BlackBerry',
    'Other (يرجى التحديد في الإصدار)',
  ];

  Future<void> sendEmail() async {
    final String email = 'Ahmadyassinq@gmail.com';
    final String subject = Uri.encodeComponent("بلاغ مشكلة من التطبيق");

    String messageBody = """
    نوع الهاتف: ${_selectedPhoneBrand ?? 'غير محدد'}
    تفاصيل موديل الهاتف: ${_phoneModelDetailsController.text.isNotEmpty ? _phoneModelDetailsController.text : 'غير محدد'}

    وصف المشكلة:
    ${_messageController.text}
    """;

    final String body = Uri.encodeComponent(messageBody);

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر فتح تطبيق البريد.')),
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _phoneModelDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'الإبلاغ عن مشكلة',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        // <--- وضع Directionality هنا لتطبيق RTL على كل محتوى الجسم
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.report_problem_rounded, size: 90, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                'ساعدنا في تحسين التطبيق',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedPhoneBrand,
                    hint: const Text('اختر نوع الهاتف', style: TextStyle(color: Colors.grey), textDirection: TextDirection.rtl,), // <--- هنا
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPhoneBrand = newValue;
                      });
                    },
                    items: _phoneBrands.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, textDirection: TextDirection.rtl,), // <--- وهنا
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              buildInputField(
                controller: _phoneModelDetailsController,
                label: 'موديل وإصدار الهاتف',
                icon: Icons.smartphone,
              ),
              const SizedBox(height: 12),

              // حقل وصف المشكلة
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 12),
                      child: TextField(
                        controller: _messageController,
                        maxLines: 6,
                        textDirection: TextDirection.rtl, // <--- تحديد اتجاه الكتابة من اليمين لليسار
                        textAlign: TextAlign.right, // <--- محاذاة النص المكتوب لليمين
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12, // <--- تم التعديل إلى right بدلاً من left لوضع العنوان لليمين
                      child: Row(
                        children: [
                          const Icon(Icons.description, color: Colors.deepPurple, size: 24),
                          const SizedBox(width: 8),
                          const Text(
                            'وصف المشكلة بالتفصيل',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (_messageController.text.isNotEmpty) {
                    sendEmail();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('يرجى ملء حقل وصف المشكلة.')),
                    );
                  }
                },
                child: const Text(
                  'إرسال البلاغ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    bool alignLabel = false,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textDirection: TextDirection.rtl, // <--- تحديد اتجاه الكتابة من اليمين لليسار
      textAlign: TextAlign.right, // <--- محاذاة النص المكتوب لليمين
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
        ),
        alignLabelWithHint: alignLabel,
      ),
    );
  }
}