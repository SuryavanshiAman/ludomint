import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api constant.dart';


var whatsapp;
var status;
var telegram;
var youtube;


Future<void> getlinks() async{
  // final prefs = await SharedPreferences.getInstance();
  // final userid = prefs.getString("userId");
  final url = Uri.parse(AppConstants.links);
  final response = await http.get(
    url,

  );
  if(response.statusCode==200){

    final responseData = json.decode(response.body)["data"][0];
    whatsapp = responseData["whatsapp"];
    status= responseData["status"];
    telegram = responseData["telegram"];
    youtube = responseData["youtube"];

  }else{
    throw Exception("failed to load data");
  }
}




