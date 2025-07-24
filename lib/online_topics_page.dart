import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main.dart';
import '../services/api_service.dart';

// استيراد الصفحات
import 'pages_online/online_dating_pros_cons_page.dart';
import 'pages_online/women_principles_online_page.dart';
import 'pages_online/women_criteria_online_page.dart';
import 'pages_online/online_phenomena_analysis_page.dart';
import 'pages_online/dating_sites_vs_agencies_page.dart';
import 'pages_online/dealing_with_scammers_online_page.dart';
import 'pages_online/online_dating_registration_page.dart';
import 'pages_online/motivating_response_tips_page.dart';
import 'pages_online/first_message_writing_page.dart';
import 'pages_online/build_attraction_online_page.dart';
import 'pages_online/build_emotional_attachment_online_page.dart';
import 'pages_online/advance_attraction_online_page.dart';
import 'pages_online/deepen_attachment_online_page.dart';
import 'pages_online/phone_numbers_exchange_online_page.dart';
import 'pages_online/phone_calls_online_page.dart';
import 'pages_online/online_dating_method_page.dart';
import 'pages_online/meeting_instructions_page.dart';

class OnlineTopicsPage extends StatefulWidget {
  @override
  _OnlineTopicsPageState createState() => _OnlineTopicsPageState();
}

class _OnlineTopicsPageState extends State<OnlineTopicsPage> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  final String _adUnitId = 'ca-app-pub-8081293973220877/1489894188';

  static const Color sectionColor = Color(0xFFC1AFFF); // ← مكانه الصحيح هنا داخل state

  final List<TopicSection> sections = [
    TopicSection(
      title: 'أولاً : بناء الأرضية اللازمة',
      topics: [
        Topic(title: 'مزايا وعيوب البحث عن طريق الإنترنت', pageBuilder: (_) => OnlineDatingProsConsPage()),
        Topic(title: 'مبادئ النساء في التعارف ', pageBuilder: (_) => WomenPrinciplesOnlinePage()),
        Topic(title: 'معايير النساء في اختيار الشريك ', pageBuilder: (_) => WomenCriteriaOnlinePage()),
        Topic(title: 'تحليل بعض الظواهر ', pageBuilder: (_) => OnlinePhenomenaAnalysisPage()),
        Topic(title: ' مواقع التعارف ووكالات التعارف', pageBuilder: (_) => DatingSitesVsAgenciesPage()),
        Topic(title: 'التعامل مع المحتالين والوهميين ', pageBuilder: (_) => DealingWithScammersOnlinePage()),
        Topic(title: 'التسجيل في مواقع التعارف ', pageBuilder: (_) => OnlineDatingRegistrationPage()),
      ],
    ),
    TopicSection(
      title: 'ثانياً : المبادرة بالتعارف',
      topics: [
        Topic(title: 'تعليمات لتحفيز المرأة للرد على رسالتك', pageBuilder: (_) => MotivatingResponseTipsPage()),
        Topic(title: 'تعليمات لأجل كتابة الرسالة الأولى', pageBuilder: (_) => FirstMessageWritingPage()),
      ],
    ),
    TopicSection(
      title: 'ثالثاً : بناء الجاذبية والارتباط العاطفي',
      topics: [
        Topic(title: 'بناء الجاذبية', pageBuilder: (_) => BuildAttractionOnlinePage()),
        Topic(title: 'بناء الارتباط العاطفي', pageBuilder: (_) => BuildEmotionalAttachmentOnlinePage()),
      ],
    ),
    TopicSection(
      title: 'رابعاً : التقدم في بناء الجاذبية وتعميق الارتباط العاطفي',
      topics: [
        Topic(title: 'التقدم في بناء الجاذبية', pageBuilder: (_) => AdvanceAttractionOnlinePage()),
        Topic(title: 'تعميق الارتباط العاطفي', pageBuilder: (_) => DeepenAttachmentOnlinePage()),
      ],
    ),
    TopicSection(
      title: 'خامساً : تبادل أرقام الهواتف والاتصال الهاتفي',
      topics: [
        Topic(title: 'تبادل أرقام الهواتف', pageBuilder: (_) => PhoneNumbersExchangeOnlinePage()),
        Topic(title: 'الاتصال الهاتفي', pageBuilder: (_) => PhoneCallsOnlinePage()),
      ],
    ),
    TopicSection(
      title: 'سادساً : المواعدة',
      topics: [
        Topic(title: 'عمل موعد مع المرأة على الإنترنت', pageBuilder: (_) => OnlineDatingMethodPage()),
        Topic(title: 'تعليمات لاجل موعد ناجح', pageBuilder: (_) => MeetingInstructionsPage()),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _isAdLoaded = false;
        },
      ),
    );
  }

  void _showInterstitialAd(BuildContext context, WidgetBuilder pageBuilder) {
    if (_interstitialAd != null && _isAdLoaded) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          _loadInterstitialAd();
          Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          _loadInterstitialAd();
          Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
        },
      );
      _interstitialAd!.show();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
      _loadInterstitialAd();
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
      appBar: AppBar(
        title: const Text('التعارف عن طريق الإنترنت', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true, // هنا تم إضافة الخاصية لجعل العنوان في المنتصف
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: sectionColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: sections.length,
                itemBuilder: (context, sectionIndex) {
                  final section = sections[sectionIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: sectionColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerRight,
                        child: Text(
                          section.title,
                          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      ...section.topics.asMap().entries.map((entry) {
                        final index = entry.key;
                        final topic = entry.value;
                        final letter = String.fromCharCode('A'.codeUnitAt(0) + index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              elevation: 2,
                              side: const BorderSide(color: Color(0xFFD4D4E9)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: topic.pageBuilder != null
                                ? () {
                                    _showInterstitialAd(context, topic.pageBuilder!);
                                  }
                                : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF5D5C8A), size: 20),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    topic.title,
                                    style: const TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  letter,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF5D5C8A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}

class Topic {
  final String title;
  final WidgetBuilder? pageBuilder;

  Topic({required this.title, this.pageBuilder});
}

class TopicSection {
  final String title;
  final List<Topic> topics;

  TopicSection({required this.title, required this.topics});
}