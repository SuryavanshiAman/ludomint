import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constant/api constant.dart';


var Rules;
var Status;
var Howtouse;
var refral_work;

Future<void> getrules() async {
  print("ffffffffff");
  // final prefs = await SharedPreferences.getInstance();
  // final userid = prefs.getString("userId");
   final url = Uri.parse(AppConstants.rules);
  final response = await http.get(
    url,

  );
  print("fgggghgggg");
  if(response.statusCode==200){
    print(response.statusCode);
    print("guygugu");
    final responseData = json.decode(response.body)["data"];
    Rules = responseData["rules"];
    print(Rules);
    print("Rules");
    Status = responseData["status"];
    Howtouse = responseData["how_to_use"];
    refral_work = responseData["refral_work"];
    print(responseData);
    print("guygugu");

  }else{
    throw Exception("load to display");
  }
}