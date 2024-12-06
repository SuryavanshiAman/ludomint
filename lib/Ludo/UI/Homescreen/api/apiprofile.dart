import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/api constant.dart';


  var username;
  var name;
  var mobilenumber;
  var emailId;
  var bankA;
  var paytmA;
  var upi;
  var RndId;
  var acholder_name;
  var accontno;
  var ifsc_code;
  var ptm_holder_name;
  var paytm_no;
  var upi_id;
  var image;
  var wallet;
  var referalcode;
  var winning;
  var bonus;


  // return responseData;

  Future<void> getprofile() async{
    print("♟️♟️♟️♟️♟️");
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");

    final url = Uri.parse("${AppConstants.profile}$userid");
    final response = await http.get(
     url,
   );
    print(username);

   if(response.statusCode==200){

     final responseData = json.decode(response.body)["data"];
     print("😂😂😂😂😂response");
     print(responseData);
     username = responseData["username"];
     name = responseData["name"];
     mobilenumber = responseData["phone"];
     emailId = responseData["email"];
     bankA = responseData["bankname"];
     paytmA = responseData["paytm_no"];
     upi = responseData["upi_id"];
     RndId = responseData["rand_id"];
     acholder_name = responseData["acholder_name"];
     accontno= responseData["accontno"];
     ifsc_code= responseData["ifsc_code"];
     ptm_holder_name= responseData["ptm_holder_name"];
     paytm_no= responseData["paytm_no"];
     upi_id= responseData["upi_id"];
     image= responseData["image"];
     wallet= responseData["wallet"];
     referalcode= responseData["codes"];
     winning= responseData["winning"];
     bonus= responseData["bonus"];

 return responseData;

   }else{
     throw Exception("failed to load data");
   }
  }
