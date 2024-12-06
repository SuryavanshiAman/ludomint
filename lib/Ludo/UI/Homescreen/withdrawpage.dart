// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'jjellybutton.dart';

class withdraw_Page extends StatefulWidget {
  const withdraw_Page({Key? key}) : super(key: key);

  @override
  State<withdraw_Page> createState() => _withdraw_PageState();
}

class _withdraw_PageState extends State<withdraw_Page> {


  @override
  void initState() {
    Accountlist();
    // TODO: implement initState
    super.initState();
  }


  final TextEditingController  money= TextEditingController();


   bool isShow = false;



  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppAsset.assetsBgapp),
            ),
          ),
        ),
        title: Text("WITHDRAW ", style: RighteousMedium.copyWith(
            fontSize: heights * 0.025, color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            // alignment: Alignment.center,
            height: heights,
            width: widths,
            decoration: const BoxDecoration(image: DecorationImage(
                image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),
            child: Column(
              children: [
                SizedBox(height: heights*0.08,),

                Container(
                  width: widths*0.79,
                  decoration: BoxDecoration(color: const Color(0xff010a40).withOpacity(0.9),
                      border: Border.all( color: Colors.white, width: 2),borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: const Color(0xff010a40).withOpacity(0.9),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,

                      hint: Row(
                        children: [
                          SizedBox(width: widths / 60,),
                          const Icon(Icons.account_balance,color: Colors.white,size: 18,),
                          SizedBox(width: widths / 60,),
                          Image.asset(AppAsset.imagesTextfiled),
                          SizedBox(width: widths*0.04,),
                          Text("Select Your Method",style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white.withOpacity(0.6)),),
                        ],
                      ),
                      value: accountdata,
                      onChanged: (String? newValue) {
                        setState(() {
                          accountdata = newValue;
                        });
                        if (kDebugMode) {
                          print(accountdata);
                          print("accountdata");
                        }
                      },
                      items: account_data.map((item){
                        return DropdownMenuItem<String>(
                          value: item['name'],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item['name'], style: acmeRegular.copyWith(fontSize: widths * 0.04, color: Colors.white)),
                              Text(item['banck_detail'], style: acmeRegular.copyWith(fontSize: widths * 0.04, color: Colors.white)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: heights*0.04,),


                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: heights / 20, vertical: heights * 0.01),
                  child: TextField(
                    controller: money,
                    style: RighteousMedium.copyWith(
                        fontSize: heights * 0.019, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: heights / 50),
                        // Adjust padding as needed
                        counter: const Offstage(),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Color(0xFFF65054)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Color(0xFFF65054)),
                        ),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: widths / 26,),
                            Text("₹", style: RighteousMedium.copyWith(
                                fontSize: heights * 0.03, color: Colors.white)),
                            SizedBox(width: widths / 60,),
                            // Icon(Icons.phone,color: Colors.white),
                            Image.asset(AppAsset.imagesTextfiled),
                          ],

                        ),
                        hintText: "Enter Amount",
                        hintStyle: RighteousMedium.copyWith(
                            fontSize: heights * 0.019, color: Colors.white
                            .withOpacity(0.6)),
                        fillColor: const Color(0xff010a40).withOpacity(0.9),
                        filled: true

                    ),
                    // keyboardType: TextInputType.number,
                    // maxLength: 10,

                  ),
                ),
                SizedBox(height: heights / 20),

                isShow ==false?
                JellyButton(
                    onTap: () {
                      Withdrawalmoney(money.text);
                    },
                    title: 'Withdrawal'
                ):CircularProgressIndicator()

                // JellyButton(
                //     onTap: () {
                //       Withdrawalmoney(money.text);
                //     },
                //     title: 'Withdrawal'
                // )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  String? accountdata;
  List account_data = [];
  Future<String> Accountlist() async {

    if (kDebugMode) {
      print("vfuyfuyfc");
    }
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    if (kDebugMode) {
      print(userid);
    }

    final res = await http.get(Uri.parse("${AppConstants.withdrawDropdown}$userid"));
    final resBody = json.decode(res.body)['data'];
    if (kDebugMode) {
      print("hhhhhhhhhhhhh");
      print("${AppConstants.withdrawDropdown}$userid");
    }
    if (kDebugMode) {
      print(resBody);
    }
    setState(() {
      account_data = resBody;
    });
    return "Success";
  }

  Withdrawalmoney(String money) async {

    setState(() {
      isShow=true;
    });
    print("fuydftd");
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);

    final response = await http.post(Uri.parse(AppConstants.withdrawalMoney),
        headers: <String , String >{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{

          "userid": "$userid",
          "payment_type": accountdata.toString(),
          "amount":money.toString(),

        })
    );
    var data = jsonDecode(response.body);

    print(response.body);
    print(data);
    print("data");

    if(data["error"]=="200"){
      setState(() {
        isShow=false;
      });
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    }else{
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }

  }



}
