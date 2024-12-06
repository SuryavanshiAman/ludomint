// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';

class Mybank extends StatefulWidget {
  const Mybank({super.key});

  @override
  State<Mybank> createState() => _MybankState();
}

class _MybankState extends State<Mybank> {

  @override
  void initState() {
    bank_view();
    getprofile();
    super.initState();

  }
  bank_view(){
    bankname.text = bankA==null?"":bankA.toString();
    accountHolder.text =acholder_name==null?"":acholder_name.toString();
    accountName.text = accontno==null?"":accontno.toString();
    ifsc.text = ifsc_code==null?"":ifsc_code.toString();
  }
  final TextEditingController bankname = TextEditingController();
  final TextEditingController accountHolder = TextEditingController();
  final TextEditingController accountName = TextEditingController();
  final TextEditingController ifsc = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child:Container(
                         // height: heights,
                         //  width: widths,
              height: heights/2,
                          // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesNewbg),fit: BoxFit.fill)),
                          decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      child: Image.asset(AppAsset.imagesCross, height: heights/20),
                                      onTap: (){
                                        Audio.sound();
                                        Navigator.pop(context);
                                      },
                                    )
                                ),
                                Text("Bank Details",style: RighteousMedium.copyWith(fontSize: heights * 0.030, color: Colors.white)),
                                SizedBox(height: heights/80,),
                                Container(
                                  height: heights/12,
                                  width: widths/1.7,
                                  child: TextField(
                                    controller: bankname,
                                    style: RighteousMedium.copyWith(fontSize: heights * 0.02, color: Colors.white),
                                    decoration: InputDecoration(
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
                                        hintText: "Bank Name",
                                        hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                        fillColor:const Color(0xff010a40).withOpacity(0.9),
                                        filled: true
                                    ),
                                  ),
                                ),
                                Container(
                                  height: heights/12,
                                  width: widths/1.7,
                                  child: TextField(
                                    controller: accountHolder,
                                    style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                    decoration: InputDecoration(
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
                                        hintText: "Account Holder Name",
                                        hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                        fillColor:const Color(0xff010a40).withOpacity(0.9),
                                        filled: true
                                    ),
                                  ),
                                ),
                                Container(
                                  height: heights/12,
                                  width: widths/1.7,
                                  child: TextField(
                                    controller: accountName,
                                    style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                    decoration: InputDecoration(
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
                                        hintText: "Account Number",
                                        hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                        fillColor:const Color(0xff010a40).withOpacity(0.9),
                                        filled: true
                                    ),
                                    maxLength: 16,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Container(
                                  height: heights/12,
                                  width: widths/1.7,
                                  child: TextField(
                                    controller: ifsc,
                                    style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                    decoration: InputDecoration(
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
                                        hintText: "IFSC Code",
                                        hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                        fillColor:const Color(0xff010a40).withOpacity(0.9),
                                        filled: true
                                    ),
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                JellyButton(
                                    onTap: () {
                                      Audio.sound();
                                      Bank_details(bankname.text,accountHolder.text,accountName.text,ifsc.text);

                                    },
                                    title: 'Submit'
                                ),
                                // TextButton(
                                //     onPressed: (){
                                //       Audio.sound();
                                //       Bank_details(accountHolder.text,accountName.text,ifsc.text);
                                //
                                //     },
                                //     child: Image.asset(AppAsset.buttonSubmit,height: heights/26)
                                // )
                              ],
                            ),
                        )),
        ),
      );
  }
  Bank_details(String bankname, String accountHolder,String accountName,String ifsc) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.post(
      Uri.parse(AppConstants.bankDetails),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "bankname":bankname,
        "acholder_name":accountHolder,
        "accontno":accountName,
        "ifsc_code":ifsc,
        "userid":"$userid",

      })
    );

    var data = jsonDecode(response.body);

    if(data["error"]=="200"){
      setState(() {
        getprofile();
      });
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    }else{
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }

  }


}


