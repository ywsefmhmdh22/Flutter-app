import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExperiencePage(),
  ));
}

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final TextEditingController _experienceController = TextEditingController();
  List<Map<String, dynamic>> _experiences = [];

  @override
  void initState() {
    super.initState();
    _loadExperiences();
  }

  Future<void> _loadExperiences() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('experiences') ?? [];
    setState(() {
      _experiences = saved
          .map((e) => Map<String, dynamic>.from(jsonDecode(e)))
          .toList();
    });
  }

  Future<void> _saveExperiences() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _experiences.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('experiences', encoded);
  }

  void _addExperience(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _experiences.insert(0, {
        'text': text.trim(),
        'replies': [],
      });
      _experienceController.clear();
    });
    _saveExperiences();
  }

  void _addReply(int index, String reply) {
    if (reply.trim().isEmpty) return;
    setState(() {
      _experiences[index]['replies'].add(reply.trim());
    });
    _saveExperiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          "منتدى تبادل التجارب",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 8,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Directionality(
        // <--- هنا يتم تحديد اتجاه النص للتطبيق بأكمله (RTL)
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "مرحبًا بك في منتدى تبادل التجارب",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "في هذا المنتدى، يمكنك مشاركة موقف أو مشكلة واجهتك خلال محاولاتك للتعارف على فتاة أحلامك، والحصول على حلول من خلال تبادل الآراء مع مستخدمي التطبيق الآخرين. يُعد هذا المنتدى مصدر دعم مستمر لك في رحلتك للتعارف، ويمكنك الرجوع إليه متى احتجت لذلك.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _experienceController,
                maxLines: 4,
                textDirection: TextDirection.rtl, // <--- تحديد اتجاه الكتابة من اليمين لليسار
                textAlign: TextAlign.right, // <--- محاذاة النص المكتوب لليمين
                decoration: InputDecoration(
                  hintText: 'اكتب تجربتك هنا...',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () => _addExperience(_experienceController.text),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _experiences.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.forum_outlined,
                              size: 60, color: Colors.grey[400]),
                          const SizedBox(height: 10),
                          const Text(
                            "لم تتم إضافة أي تجارب بعد.",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textDirection: TextDirection.rtl, // <--- ضمان اتجاه النص
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _experiences.length,
                      itemBuilder: (context, index) {
                        final exp = _experiences[index];
                        final replies = List<String>.from(exp['replies']);
                        final replyController = TextEditingController();

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[50],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    exp['text'],
                                    style: const TextStyle(
                                        fontSize: 15, height: 1.4),
                                    textDirection: TextDirection.rtl, // <--- اتجاه نص التجربة
                                    textAlign: TextAlign.right, // <--- محاذاة نص التجربة
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (replies.isNotEmpty)
                                  const Text(
                                    "الردود:",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl, // <--- اتجاه نص "الردود"
                                  ),
                                for (var reply in replies)
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      reply,
                                      textDirection: TextDirection.rtl, // <--- اتجاه نص الرد
                                      textAlign: TextAlign.right, // <--- محاذاة نص الرد
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: replyController,
                                  textDirection: TextDirection.rtl, // <--- تحديد اتجاه الكتابة من اليمين لليسار
                                  textAlign: TextAlign.right, // <--- محاذاة النص المكتوب لليمين
                                  decoration: InputDecoration(
                                    hintText: 'اكتب ردّك هنا...',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.send,
                                          color: Colors.blueAccent),
                                      onPressed: () {
                                        _addReply(index, replyController.text);
                                        replyController.clear();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}