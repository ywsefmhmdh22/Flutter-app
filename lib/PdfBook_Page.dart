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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'الكتاب pdf',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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

          // الأزرار
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 120),

              // الزر الأول
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
                child: buildButton(context, 'pdf الجزء الأول', 1, 168),
              ),

              // الزر الثاني
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
                child: buildButton(context, ' pdf الجزء الثاني', 169, 250),
              ),
              const Spacer(flex: 99),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(), // إعلان البنر هنا
    );
  }

  Widget buildButton(
      BuildContext context, String text, int startPage, int endPage) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(color: Colors.blue),
          elevation: 3,
        ),
        onPressed: () async {
          var connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult.contains(ConnectivityResult.none)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك.')),
            );
          } else {
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
            const Icon(Icons.arrow_back_ios, color: Colors.blue, size: 18),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            const Icon(Icons.picture_as_pdf, color: Colors.blue, size: 18),
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
        title: const Text('PDF'),
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
      bottomNavigationBar: BannerAdWidget(), // إعلان البنر هنا أيضًا
    );
  }
}