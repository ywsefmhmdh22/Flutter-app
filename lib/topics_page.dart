 import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; // Import the ad package
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا

// استورد كل الصفحات من مجلد pages
import 'pages/Partner_Selection_Page.dart';
import 'pages/female_interest_page.dart';
import 'pages/confidence_page.dart';
import 'pages/speech_skills_page.dart';
import 'pages/emotional_dependence_page.dart';
import 'pages/chemistry_page.dart';
import 'pages/change_routine_page.dart';
import 'pages/women_needs_page.dart';
import 'pages/women_traits_page.dart';
import 'pages/women_types_page.dart';
import 'pages/body_language_page.dart';
import 'pages/domineering_behavior_page.dart';
import 'pages/dealing_tricks_page.dart';

import 'pages/initiation_forms_page.dart';
import 'pages/start_conversation_page.dart';
import 'pages/conversation_tips_page.dart';

import 'pages/build_attraction_page.dart';
import 'pages/build_emotional_attachment_page.dart';

import 'pages/advance_attraction_page.dart';
import 'pages/deepen_attachment_page.dart';

import 'pages/phone_numbers_exchange_page.dart';
import 'pages/phone_calls_page.dart';

import 'pages/request_page.dart';
import 'pages/invitation_page.dart';

import 'pages/successful_meeting_page.dart';
import 'pages/meeting_places_page.dart';
import 'pages/meeting_suggestions_page.dart';
import 'pages/shopping_dinner_invite_page.dart';

// Your BannerAdWidget is assumed to be in main.dart or accessible.
// For this example, let's assume it's just a placeholder if not defined.
class BannerAdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: Colors.grey[200],
      child: const Text('Banner Ad Placeholder'),
    );
  }
}


class TopicsPage extends StatefulWidget {
  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  int _clickCount = 0; // Added click counter

  final String _adUnitId = 'ca-app-pub-8081293973220877/1489894188'; // Test Ad Unit ID for Android Interstitial.
  // Replace with your actual AdMob Interstitial Ad Unit ID
  // For iOS: ca-app-pub-3940256099942544/4414689593
  // For Android: ca-app-pub-3940256099942544/1033173712

  final List<TopicSection> sections = [
    TopicSection(
      title: 'أولاً : بناء الأرضية اللازمة',
      topics: [
        Topic(title: 'المعايير الأنثوية في انتقاء الشريك', pageBuilder: (_) => PartnerSelectionPage()),
        Topic(title: 'لمن تهتم الفتيات في اماكن الدراسه', pageBuilder: (_) => FemaleInterestPage()),
        Topic(title: 'أهمية الثقة بالنفس وتوكيد الذات', pageBuilder: (_) => ConfidencePage()),
        Topic(title: 'تقوية المهارات في الحديث', pageBuilder: (_) => SpeechSkillsPage()),
        Topic(title: 'العوز والحاجة (التسول العاطفي)', pageBuilder: (_) => EmotionalDependencePage()),
        Topic(title: 'كيمياء الجذب', pageBuilder: (_) => ChemistryPage()),
        Topic(title: 'تغيير الروتين وتجديد نمط حياتك', pageBuilder: (_) => ChangeRoutinePage()),
        Topic(title: ' حاجات النساء', pageBuilder: (_) => WomenNeedsPage()),
        Topic(title: 'صفات النساء', pageBuilder: (_) => WomenTraitsPage()),
        Topic(title:  'أنواع النساء ', pageBuilder: (_) => WomenTypesPage()),
        Topic(title: ' لغة الجسد في الحب', pageBuilder: (_) => BodyLanguagePage()),
        Topic(title: 'التصرف المسيطر', pageBuilder: (_) => DomineeringBehaviorPage()),
        Topic(title: 'التعامل مع ألاعيب النساء', pageBuilder: (_) => DealingTricksPage()),
      ],
    ),
    TopicSection(
      title: 'ثانياً : المبادره بالتعارف',
      topics: [
        Topic(title: 'اشكال المبادرة بالتعارف', pageBuilder: (_) => InitiationFormsPage()),
        Topic(title: 'البدء بمحادثة التعارف', pageBuilder: (_) => StartConversationPage()),
        Topic(title: 'نصائح لأجل المبادره بالتعارف', pageBuilder: (_) => ConversationTipsPage()),
      ],
    ),
    TopicSection(
      title: 'ثالثاً : بناء الجاذبيه والارتباط العاطفي',
      topics: [
        Topic(title: 'بناء الجاذبية', pageBuilder: (_) => BuildAttractionPage()),
        Topic(title: 'بناء الارتباط العاطفي', pageBuilder: (_) => BuildEmotionalAttachmentPage()),
      ],
    ),
    TopicSection(
      title: 'رابعاً : التقدم في بناء الجاذبيه وتعميق الارتباط العاطفي',
      topics: [
        Topic(title: 'التقدم في بناء الجاذبية', pageBuilder: (_) => AdvanceAttractionPage()),
        Topic(title: 'تعميق الارتباط العاطفي', pageBuilder: (_) => DeepenAttachmentPage()),
      ],
    ),
    TopicSection(
      title: 'خامساً : تبادل أرقام الهواتف والاتصال الهاتفي',
      topics: [
        Topic(title: 'تبادل أرقام الهواتف', pageBuilder: (_) => PhoneNumbersExchangePage()),
        Topic(title: 'الاتصال الهاتفي', pageBuilder: (_) => PhoneCallsPage()),
      ],
    ),
    TopicSection(
      title: 'سادساً : المواعدة',
      topics: [
        Topic(title: 'طريقة الطلب من المراه', pageBuilder: (_) => RequestPage()),
        Topic(title: 'طريقة الدعوة', pageBuilder: (_) => InvitationPage()),
      ],
    ),
    TopicSection(
      title: 'سابعاً: الرومانسية',
      topics: [
        Topic(title: 'نصائح لقضاء موعد ناجح', pageBuilder: (_) => SuccessfulMeetingPage()),
        Topic(title: 'اماكن اللقاء', pageBuilder: (_) => MeetingPlacesPage()),
        Topic(title: 'بعض الاقتراحات لأجل لقاء مميز', pageBuilder: (_) => MeetingSuggestionsPage()),
        Topic(title: 'الدعوة لتناول الغداء أو العشاء', pageBuilder: (_) => ShoppingDinnerInvitePage()),
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
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
          _isAdLoaded = true;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
          _interstitialAd = null;
          _isAdLoaded = false;
        },
      ),
    );
  }

  void _showInterstitialAd(BuildContext context, WidgetBuilder pageBuilder) {
    _clickCount++;
    if (_clickCount % 3 == 0 && _interstitialAd != null && _isAdLoaded) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
          debugPrint('$ad onAdShowedFullScreenContent.');
        },
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          debugPrint('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          _loadInterstitialAd(); // Load a new ad for the next time
          Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          _loadInterstitialAd(); // Load a new ad even if it failed to show
          Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
        },
      );
      _interstitialAd!.show();
      _clickCount = 0; // Reset the counter after showing the ad
    } else {
      debugPrint('Ad not shown, navigating directly. Click count: $_clickCount');
      Navigator.push(context, MaterialPageRoute(builder: pageBuilder));
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
        title: const Text(
          'التعارف في الحياة الواقعية',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB7A6F6),
      ),
      body: SafeArea(
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
                    color: const Color(0xFFB7A6F6),
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
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        // Call the new showInterstitialAd method here
                        _showInterstitialAd(context, topic.pageBuilder!);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.rotate(
                            angle: 3.14159,
                            child: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade500, size: 20),
                          ),
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
                              color: Color(0xFF3B2F2F),
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