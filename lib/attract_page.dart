import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // استيراد حزمة الاتصال
import 'topics_page.dart' as topics;
import 'online_topics_page.dart' as online;
import 'main.dart'; // يحتوي على BannerAdWidget الصحيح

class AttractPage extends StatefulWidget {
  const AttractPage({super.key});

  @override
  _AttractPageState createState() => _AttractPageState();
}

class _AttractPageState extends State<AttractPage> {
  @override
  void initState() {
    super.initState();
    sendVisit('attract_page'); // تسجيل زيارة صفحة المقالات
  }

  // دالة مشتركة للتحقق من الاتصال والانتقال للصفحة
  Future<void> _checkConnectivityAndNavigate(BuildContext context, Widget page) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // لا يوجد اتصال بالإنترنت
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك.')),
      );
    } else {
      // يوجد اتصال بالإنترنت، يمكن الانتقال للصفحة
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // لتوسيع الجسم خلف إعلان AdMob
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "المقالات",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/final_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // الأزرار
          Align(
            alignment: const FractionalOffset(0.5, 0.55),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAttractButton(
                    title: "التعارف في الحياة الواقعية",
                    onPressed: () {
                      _checkConnectivityAndNavigate(context, topics.TopicsPage());
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomAttractButton(
                    title: "التعارف عن طريق الإنترنت",
                    onPressed: () {
                      _checkConnectivityAndNavigate(context, online.OnlineTopicsPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(), // إعلان البانر من main.dart
    );
  }
}

class CustomAttractButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed; // لا نحتاج لتغيير هذه إلى Future<void> Function()

  const CustomAttractButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed, // سنقوم بالتحقق في onPressed الخاص بـ AttractPage
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blueAccent),
          ),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.blueAccent,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}