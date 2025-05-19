import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import 'Ludo/UI/Homescreen/api/apiprofile.dart';
import 'Ludo/UI/Homescreen/jjellybutton.dart';
import 'Ludo/UI/constant/api constant.dart';
import 'Ludo/UI/constant/images.dart';
import 'Ludo/UI/constant/style.dart';
import 'Ludo/UI/constant/utilll.dart';
import 'audio.dart';

class email_Page extends StatefulWidget {
  const email_Page({super.key});

  @override
  State<email_Page> createState() => _email_PageState();
}

class _email_PageState extends State<email_Page> {

  // @override
  // void initState() {
  //   bank_view();
  //   getprofile();
  //   super.initState();
  //
  // }
  //
  // @override
  // void dispose() {
  //   getprofile();
  //   super.dispose();
  // }
  // bank_view(){
  //   emailCont.text = emailId==null?"":emailId.toString();
  //
  // }

  final TextEditingController emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Dialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
          child:Container(
            height: heights/3,
            // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesNewbg),fit: BoxFit.fill)),
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
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
                Text("Email Detail",style: RighteousMedium.copyWith(fontSize: heights * 0.030, color: Colors.white)),
                SizedBox(height: heights/40,),
                Container(
                  height: heights/10,
                  width: widths/1.7,
                  child: TextField(
                    controller: emailCont,
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
                        hintText: "Enter your email",
                        hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                        fillColor:Color(0xff010a40).withOpacity(0.9),
                        filled: true
                    ),
                  ),
                ),
                JellyButton(
                    onTap: () {
                      Profile_update(emailCont.text);
                      // Upi(upiID.text);
                      Audio.sound();
                    },
                    title: 'Submit'
                ),

              ],
            ),
          )
      ),
    );

  }
  // Upi(String upiID) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userId");
  //   final response = await http.post(
  //       Uri.parse(AppConstants.UPI),
  //       headers: <String,String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         "upi_id":upiID,
  //         "userid":"$userid",
  //
  //       })
  //   );
  //
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print("👍👍👍👍👍👍👍");
  //
  //   if(data["error"]=="200"){
  //     Navigator.pop(context);
  //     Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
  //   }else{
  //     Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
  //   }
  //
  // }
  Profile_update(String emailCont) async {
    final profileVM= Provider.of<ProfileViewModel>(context,listen: false);


    print("guycyg");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    print(userId);
    print("🌐🌐");

    final response = await http.post(
        Uri.parse(AppConstants.profileupdate),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String >{
          "userid":"$userId",
          "email": emailCont

        })


    );
    var data = jsonDecode(response.body);
    print(data);
    print("👍👍👍👍update");

    if(data["error"]=="200"){
     profileVM.profileApi();
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);


    }else {

      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);

    }

  }
}

