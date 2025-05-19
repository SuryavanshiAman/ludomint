// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:ludo_score/Ludo/UI/constant/api%20constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// var username;
// var ref_id;
// var bonus;
//
// // return responseData;
//
// Future<void> getreferhistory() async{
//   print("♟️♟️♟️♟️♟️");
//   final prefs = await SharedPreferences.getInstance();
//   final userid = prefs.getString("userId");
//
//   final url = Uri.parse("${AppConstants.referhistory}$userid");
//   final response = await http.get(
//     url,
//   );
//   print(username);
//
//   if(response.statusCode==200){
//
//     final responseData = json.decode(response.body)["data"];
//     print("😂😂😂😂😂response");
//     print(responseData);
//     username = responseData["username"];
//     ref_id = responseData["ref_id"];
//     bonus = responseData["bonus"];
//
//
//     return responseData;
//
//   }else{
//     throw Exception("failed to load data");
//   }
// }
//
//
//
