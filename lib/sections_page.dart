import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart'; // سأستخدم InAppReview أيضًا للتحقق
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'About_Page.dart';
import 'tip_Page.dart';
import 'attract_page.dart';
import 'pdfbook_page.dart';
import 'experience_page.dart';
import 'intellectual_property_page.dart';
import 'privacy_policy_page.dart';
import 'report_problem_page.dart';
import 'contactus_page.dart';
import 'RelationshipPath_Page.dart';

class SectionsPage extends StatefulWidget {
  const SectionsPage({super.key});

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdLoaded = false;
  int _clickCount = 0;
  static const int _adDisplayThreshold = 3;
  final String _interstitialAdUnitId = "ca-app-pub-8081293973220877/1489894188";

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
    _loadClickCount();
    // تم تغيير هذا: سيتم استدعاء _showReviewPopup() مباشرة بدون أي شروط هنا
    // سنقوم بإدارة منطق الظهور داخل الدالة نفسها.
    _showReviewPopup();
  }

  Future<void> _loadClickCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _clickCount = prefs.getInt('clickCount') ?? 0;
    });
  }

  Future<void> _saveClickCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('clickCount', count);
  }

  // تم تعديل هذه الدالة لإزالة التحقق من hasShownReviewThisSession
  void _showReviewPopup() async {
    // يمكن إضافة تأخير بسيط هنا لضمان أن الواجهة قد تم بناؤها
    Future.delayed(const Duration(milliseconds: 500), () {
      showDialog(
        context: context,
        barrierDismissible: false, // يمنع إغلاق النافذة بالنقر خارجها
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Center(
              child: Text(
                'تقييم التطبيق',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            content: const Text(
              'إذا أعجبك التطبيق، نرجو تقييمنا بخمسة نجوم لدعمنا.', // تم تغييرها إلى 5 نجوم
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(); // إغلاق النافذة
                  const url = 'https://play.google.com/store/apps/details?id=com.tla.bookapp';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تعذر فتح رابط التقييم')),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'تقييم الآن',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // إغلاق النافذة
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
                child: const Text(
                  'ليس الآن',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
          _isInterstitialAdLoaded = false;
        },
      ),
    );
  }

  void _handleNavigationAndAd(Widget page) async {
    _clickCount++;
    await _saveClickCount(_clickCount);

    if (_clickCount % _adDisplayThreshold == 0 &&
        _isInterstitialAdLoaded &&
        _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          _isInterstitialAdLoaded = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          _loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _interstitialAd = null;
          _isInterstitialAdLoaded = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          _loadInterstitialAd();
        },
      );
      _interstitialAd!.show();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return PopupMenuButton<Widget>(
              icon: const Icon(Icons.menu, color: Colors.blueAccent),
              offset: Offset(
                (MediaQuery.of(context).size.width * 0.5) - 150,
                AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 5,
              ),
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
                PopupMenuItem<Widget>(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                _buildPopupMenuItem('حقوق الملكية الفكرية',
                    () => _handleNavigationAndAd(const IntellectualPropertyPage())),
                _buildPopupMenuItem('سياسة الخصوصية',
                    () => _handleNavigationAndAd(const PrivacyPolicyPage())),
                _buildPopupMenuItem('الإبلاغ عن مشكلة في التطبيق',
                    () => _handleNavigationAndAd(const ReportProblemPage())),
                _buildPopupMenuItem('تواصل معنا',
                    () => _handleNavigationAndAd(const ContactUsPage())),
              ],
            );
          },
        ),
        title: const Text(
          'مهارات جذب النساء الجميلات',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/couple.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sectionButton('نبذة عن التطبيق',
                      leadingWidget: const Icon(Icons.phone_android, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const AboutPage())),
                  sectionButton('مسار العلاقة مع المرأة',
                      leadingWidget: const Icon(Icons.favorite, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const RelationshipPathPage())),
                  sectionButton('نصائح للمزيد من الفائدة',
                      leadingWidget: const Icon(FontAwesomeIcons.commentDots, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const TipsPage())),
                  sectionButton('المقالات',
                      leadingWidget: const Icon(Icons.article, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const AttractPage())),
                  sectionButton('الكتاب PDF',
                      leadingWidget: const Icon(Icons.menu_book, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const PDFBookPage())),
                  sectionButton('منتدى تبادل التجارب',
                      leadingWidget: const Icon(Icons.forum, color: Colors.blueAccent),
                      onTap: () => _handleNavigationAndAd(const ExperiencePage())),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: shareOrRateButton(
                            text: 'مشاركة التطبيق',
                            icon: Icons.share,
                            onTap: () => Share.share(
                                'حمّل تطبيق مهارات جذب النساء من هنا: https://yourapp.link'),
                            isIconTrailing: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: shareOrRateButton(
                            text: 'تقييم التطبيق',
                            icon: Icons.star,
                            onTap: () async {
                              const url = 'https://play.google.com/store/apps/details?id=com.tla.bookapp';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('تعذر فتح رابط التقييم')),
                                );
                              }
                            },
                            isIconTrailing: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }

  PopupMenuEntry<Widget> _buildPopupMenuItem(String title, VoidCallback onTap) {
    return PopupMenuItem<Widget>(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF8E8F9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionButton(String title, {required Widget leadingWidget, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: leadingWidget,
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  Widget shareOrRateButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isIconTrailing = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isIconTrailing
                ? [
                    Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                    const SizedBox(width: 8),
                    Icon(icon, color: Colors.blueAccent),
                  ]
                : [
                    Icon(icon, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                  ],
          ),
        ),
      ),
    );
  }
}