import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constant/api constant.dart';


var Rules;
var Status;
var Howtouse;
var refral_work;

Future<void> getrules() async {
  print("ffffffffff");
   final url = Uri.parse(AppConstants.rules);
  final response = await http.get(
    url,

  );
  if(response.statusCode==200){
    print(response.statusCode);
    final responseData = json.decode(response.body)["data"];
    Rules = responseData["rules"];
    Status = responseData["status"];
    Howtouse = responseData["how_to_use"];
    refral_work = responseData["refral_work"];

  }else{
    throw Exception("load to display");
  }
}