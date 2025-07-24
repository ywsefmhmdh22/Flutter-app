import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main.dart'; // تأكد من وجود BannerAdWidget هنا

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.privacy_tip_rounded, size: 90, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Your Privacy Matters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: '1. Information Collection'),
                  SectionText(
                    text:
                        'We collect non-personal data such as device type and operating system for analytical purposes and to improve user experience. We do not collect any personal data without user consent.',
                  ),
                  SizedBox(height: 10),
                  SectionTitle(title: '2. Use of Data'),
                  SectionText(
                    text:
                        'The data is used to enhance performance, personalize content, display relevant ads, and ensure application security.',
                  ),
                  SizedBox(height: 10),
                  SectionTitle(title: '3. Information Sharing'),
                  SectionText(
                    text:
                        'We do not share your information with any third parties, except for entities involved in analytics and advertising services, in compliance with the law.',
                  ),
                  SizedBox(height: 10),
                  SectionTitle(title: '4. Security'),
                  SectionText(
                    text:
                        'We are committed to protecting your information using the latest security measures and take any potential breaches very seriously.',
                  ),
                  SizedBox(height: 10),
                  SectionTitle(title: '5. User Rights'),
                  SectionText(
                    text:
                        'You have the full right to know, modify, or delete any data related to you, and you can contact us at any time.',
                  ),
                  SizedBox(height: 10),
                  SectionTitle(title: '6. Changes'),
                  SectionText(
                    text:
                        'We may update the privacy policy from time to time, and you will be notified of any significant changes through the application.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Thank you for using our application, we appreciate your trust.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      // --- هنا تم إضافة إعلان البانر ---
      bottomNavigationBar: BannerAdWidget(),
      // -------------------------------
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14.5,
        height: 1.6,
        color: Colors.black87,
      ),
      textAlign: TextAlign.justify,
    );
  }
}