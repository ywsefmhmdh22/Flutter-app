import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendVisit(String pageName) async {
  final url = Uri.parse('http://10.253.4.163:3000/api/visit');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'page': pageName}),
  );

  if (response.statusCode == 200) {
    print('تم تسجيل الزيارة للصفحة $pageName');
  } else {
    throw Exception('فشل تسجيل الزيارة');
  }
}