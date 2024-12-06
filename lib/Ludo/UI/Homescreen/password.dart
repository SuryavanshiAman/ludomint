import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'gamepage.dart';
import 'jjellybutton.dart';


class Mypassword extends StatefulWidget {
  const Mypassword({super.key});

  @override
  State<Mypassword> createState() => _MypasswordState();
}

class _MypasswordState extends State<Mypassword> {

   final TextEditingController currentpass =TextEditingController();
   final TextEditingController pass= TextEditingController();
   final TextEditingController confirmpass =TextEditingController();


   @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child: SingleChildScrollView(
          child: Container(
            height: heights * 0.6,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(AppAsset
            //             .imagesNewgolden),
            //         fit: BoxFit.fill)),
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      child: Image.asset(AppAsset.imagesCross, height: heights/20),
                      onTap: () {
                        Audio.sound();
                        Navigator.pop(context);
                      }),
                ),
                Text("CHANGE PASSWORD", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                SizedBox(height: heights / 20),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: heights /3.5,
                    // color: Colors.yellowAccent,
                    child: Column(
                      children: [
                        TextField(
                          controller: currentpass,
                          style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                          decoration:
                          InputDecoration(
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
                                borderRadius: BorderRadius.all(Radius.circular(12.0),
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
                              hintText: "Current Password",
                              hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              labelStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              fillColor: Color(0xff010a40).withOpacity(0.9),
                              filled: true
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: heights / 40),
                        TextField(
                          controller: pass,
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
                                borderRadius: BorderRadius.all(Radius.circular(12.0),
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
                              hintText: "Password",
                              hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              labelStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              fillColor: Color(0xff010a40).withOpacity(0.9),
                              filled: true
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: heights / 40),
                        TextField(
                          controller: confirmpass,
                          style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                          decoration:
                          InputDecoration(
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
                                borderRadius: BorderRadius.all(Radius.circular(12.0),
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
                              hintText: "Confirm password",
                              hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              labelStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                              fillColor: Color(0xff010a40).withOpacity(0.9),
                              filled: true
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                JellyButton(onTap: (){
                  Audio.sound();
                  Change_password(currentpass.text,pass.text,confirmpass.text);
                },
                    title: "Submit"
                )
                // TextButton(
                //     onPressed: () {
                //       Audio.sound();
                //       Change_password(currentpass.text,pass.text,confirmpass.text);
                //       // Navigator.pushReplacement(
                //       //     context,
                //       //     MaterialPageRoute(builder: (context) => Numberthree()));
                //     },
                //     child: Image.asset(AppAsset.buttonSubmitRemovebgPreview, height: heights / 20))
              ],
            ),
          ),
        ));
  }
   Change_password(String currentpass,String pass,String confirmpass) async{
     final prefs = await SharedPreferences.getInstance();
     final userid = prefs.getString("userId");
     final response = await http.post(
         Uri.parse(AppConstants.changepassord),
         headers: <String,String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
         body:  jsonEncode( <String,String>{
           "id":"$userid",
           "old_password": currentpass,
           "new_password":pass,
           "confirm_password":confirmpass,
         })
     );

     var data = jsonDecode(response.body);
     if(data["error"]=="200"){

       Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => Numberthree()));

     }else {
       Utils.flushBarErrorMessage(data["msg"], context, Colors.white);

     }

   }
}


