import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../services/api_service.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا
import 'package:connectivity_plus/connectivity_plus.dart'; // استيراد حزمة الاتصال

class PDFBookPage extends StatelessWidget {
  const PDFBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // لون الخلفية أبيض
        elevation: 0, // إزالة أي ظل
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // سهم الرجوع للخلف بلون أسود ليكون مرئيا على الخلفية البيضاء
          onPressed: () {
            Navigator.pop(context); // للرجوع للصفحة السابقة
          },
        ),
        title: const Text(
          'الكتاب pdf', // تم تعديل ترتيب الكلمات هنا
          textDirection: TextDirection.rtl, // لضمان عرض النص من اليمين لليسار
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold, // يمكنك إضافة تنسيقات أخرى إذا أردت
          ),
        ),
        centerTitle: true, // لتركيز العنوان في المنتصف
      ),
      body: Stack(
        children: [
          // صورة الخلفية
          SizedBox.expand(
            child: Image.asset(
              'assets/pdf_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // لتجميع الأزرار وتثبيتها عموديًا
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // لتوسيط الأزرار عموديا
            children: [
              // Spacer لرفع الأزرار للأعلى بمقدار 1 ملم
              const Spacer(flex: 120), // تم زيادة الـ flex لرفع الأزرار أكثر

              // الزر الأول: الجزء الأول
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7), // إضافة مسافة أفقية وعمودية
                child: buildButton(context, 'pdf الجزء الأول', 1, 168),
              ),

              // الزر الثاني: الجزء الثاني
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7), // إضافة مسافة أفقية وعمودية
                child: buildButton(context, ' pdf الجزء الثاني', 169, 250),
              ),
              const Spacer(flex: 99), // تم تقليل الـ flex لجعل الأزرار أعلى
            ],
          ),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }

  Widget buildButton(BuildContext context, String text, int startPage, int endPage) {
    return SizedBox( // تم إضافة SizedBox للتحكم في عرض الزر
      height: 50, // تم تحديد ارتفاع ثابت للأزرار
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // تم تصغير الـ padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // تم تصغير الـ border radius قليلاً
          ),
          side: const BorderSide(color: Colors.blue),
          elevation: 3,
        ),
        onPressed: () async { // جعل onPressed دالة غير متزامنة
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
              MaterialPageRoute(
                builder: (context) =>
                    PDFViewerPage(startPage: startPage, endPage: endPage),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios, color: Colors.blue, size: 18), // تم تصغير حجم الأيقونة
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 15), // تم تصغير حجم الخط
              ),
            ),
            const Icon(Icons.picture_as_pdf, color: Colors.blue, size: 18), // تم تصغير حجم الأيقونة
          ],
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatefulWidget {
  final int startPage;
  final int endPage;

  const PDFViewerPage(
      {super.key, required this.startPage, required this.endPage});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPdfPath;
  late PDFViewController _pdfViewController;
  bool isControllerReady = false;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    final bytes = await rootBundle.load('assets/book.pdf');
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/book.pdf');

    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    setState(() {
      localPdfPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'), // تم تعديل العنوان هنا
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: localPdfPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPdfPath!,
              autoSpacing: true,
              enableSwipe: true,
              swipeHorizontal: false,
              onRender: (_pages) async {
                isControllerReady = true;
                await _pdfViewController.setPage(widget.startPage - 1);
              },
              onViewCreated: (controller) {
                _pdfViewController = controller;
              },
              onPageChanged: (int? current, int? total) async {
                if (current != null &&
                    (current + 1 < widget.startPage ||
                        current + 1 > widget.endPage)) {
                  await _pdfViewController.setPage(widget.startPage - 1);
                }
              },
            ),
    );
  }
}