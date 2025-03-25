import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// class ApiService {
//   static Future<dynamic> fetchData() async {
//     final prefs = await SharedPreferences.getInstance();
//        final userid = prefs.getString("userId");
//     final response = await http.get(Uri.parse('https://ludoadmin.wishufashion.com/index.php/api/Mobile_app/profile?userid=$userid'));
//     if (response.statusCode == 200) {
//       final data =json.decode(response.body);
//       print(data);print("ashuuuuu");
//       return data;
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }
// }
