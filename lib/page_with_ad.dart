import 'package:flutter/material.dart';
import 'ad_banner.dart'; // لازم نستورد البنر

class PageWithAd extends StatelessWidget {
  final Widget child;

  const PageWithAd({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          const AdBanner(), // الإعلان البنر تحت الصفحة
        ],
      ),
    );
  }
}