// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'package:ludomint/Ludo/UI/Homescreen/paytmDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../../../emailpage.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'UPIdetails.dart';
import 'api/apiprofile.dart';
import 'bankDetails.dart';
import 'changeImage.dart';
import 'jellybuttonnn.dart';
import 'jjellybutton.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {



 @override
  void initState() {
   getprofile();
   changeusername_view();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    getprofile();
    super.dispose();
  }

 changeusername_view(){
   changeusername.text = username==null?"":username.toString();
   nameCont.text = name==null?"":name.toString();
 }




  final TextEditingController changeusername = TextEditingController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child: Stack(
          children: [
            Container(
              height: heights*0.6,
              width: widths*0.8,
              decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                           SizedBox(height: heights/20,),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:50),
                                          child: InkWell(
                                            // // onTap:_camera,
                                            child:
                                            // file != null
                                            //     ? CircleAvatar(
                                            //   backgroundImage: FileImage(file!),
                                            //   radius: heights/28,
                                            // ) :
                                          image== null
                                                ?
                                            CircleAvatar(
                                              radius: heights/28,
                                              backgroundImage: const AssetImage(AppAsset.imagesAvatar1,),
                                            )
                                                : CircleAvatar(
                                              backgroundColor: Colors.white,
                                              backgroundImage: NetworkImage(
                                                AppConstants.imageurl +
                                                    image.toString(),
                                              ),
                                              radius: heights/28,
                                            ),

                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text( name==null?"":name.toString(), style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),
                                              Text(RndId==null?"":RndId.toString(), style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: widths/20,),
                                        InkWell(
                                            child:const Icon(Icons.edit, color: Colors.blueAccent) ,
                                            onTap: (){
                                              Audio.sound();
                                              showDialog(context: context,
                                                  builder: (ctx) => Dialog(
                                                    backgroundColor: Colors.black,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
                                                    child:Container(
                                                        height: heights/2.4,
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
                                                            Text("Change Username",style: RighteousMedium.copyWith(fontSize: heights * 0.030, color: Colors.white)),
                                                            Padding(
                                                              padding: const EdgeInsets.all(10),
                                                              child: Container(
                                                                height: heights/10,
                                                                width: widths/1.7,
                                                                child: TextField(
                                                                  controller: changeusername,
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
                                                                      hintText: "Enter your username",
                                                                      hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                                      fillColor:const Color(0xff010a40).withOpacity(0.9),
                                                                      filled: true
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(10),
                                                              child: Container(
                                                                height: heights/10,
                                                                width: widths/1.7,
                                                                child: TextField(
                                                                  controller: nameCont,
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
                                                                      hintText: "Re-enter your name",
                                                                      hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                                      fillColor:const Color(0xff010a40).withOpacity(0.9),
                                                                      filled: true
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            JellyButton(
                                                                onTap: () {
                                                                  Profile_update(changeusername.text,nameCont.text);
                                                                  Audio.sound();
                                                                  },
                                                                title: 'Submit'
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                  )
                                              );
                                            }
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only( top: 5,left: 30),
                                      child: Row(
                                        children: [
                                          JellyButtonnn(
                                             onTap: () {
                                               Audio.sound();
                                               showDialog(context: context, builder: (context)=>Selectimage());
                                               },
                                             title: 'Change'
                                         ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Container(
                                              width: widths/4.6,
                                              decoration: BoxDecoration(color: Colors.white,
                                                  border: Border.all(color: Colors.white, width: 2),
                                                  borderRadius: BorderRadius.circular(9)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.monetization_on_rounded,color: Colors.red,size: 20,),
                                                  Text(wallet==null?"":wallet.toString(),  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.black),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: heights/26,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: heights/25,
                                          width: widths/1.6,
                                          decoration: BoxDecoration(color: const Color(0xff010a40),
                                              border: Border.all(color: Colors.white, width: 2),
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: heights/70),
                                            child: Row(
                                              children: [
                                                Text('Username',  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                const Spacer(),
                                                Container(
                                                  width: widths*0.23,
                                                  // color: Colors.yellow,
                                                  child: Text(username==null?"":username.toString(),
                                                    style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white),
                                                    textAlign: TextAlign.end,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: heights/90,),
                                        Container(
                                          height: heights/25,
                                          width: widths/1.6,
                                          decoration: BoxDecoration(color:  const Color(0xff010a40),
                                              border: Border.all(color: Colors.white, width: 2),
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: heights/70),
                                            child: Row(
                                              children: [
                                                // SizedBox(width: widths/40,),
                                                Text('Mobile No.',  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                const Spacer(),
                                                Text(mobilenumber==null?"":mobilenumber.toString(),  style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(color: Colors.yellow.shade800,endIndent: 19,indent: 19,thickness: 1.1,),
                                        InkWell(
                                          onTap: (){
                                            showDialog(context: context, builder: (context) =>const email_Page());
                                          },
                                          child: Container(
                                            height: heights/25,
                                            width: widths/1.6,
                                            decoration: BoxDecoration(color:  const Color(0xff010a40),
                                                border: Border.all(color: Colors.white, width: 2),
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: heights/70),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  // SizedBox(width: widths/40,),
                                                  Text('Email Id',  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                  const Spacer(),
                                                  Container(
                                                    width: widths/3,
                                                    // color: Colors.yellowAccent,
                                                    child: Text(emailId==null?"Fill Your Email":emailId.toString(),
                                                      style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.end,
                                                    overflow: TextOverflow.ellipsis,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(color: Colors.yellow.shade800,endIndent: 19,indent: 19,thickness: 1,),
                                        InkWell(
                                          onTap: (){
                                            showDialog(context: context, builder: (context) =>const Mybank());
                                          },
                                          child: Container(
                                            height: heights/25,
                                            width: widths/1.6,
                                            decoration: BoxDecoration(color:  const Color(0xff010a40),
                                                border: Border.all(color: Colors.white, width: 2),
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: heights/70),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  // SizedBox(width: widths/40,),
                                                  Text('Bank Account',  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                  const Spacer(),
                                                  Container(
                                                    width: widths/4.1,
                                                    // color: Colors.yellowAccent,
                                                    child: Text(bankA==null?"Fill Your Bank Details":bankA.toString(),
                                                      style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                      maxLines: 1,
                                                      textAlign: TextAlign.end,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(color: Colors.yellow.shade800,endIndent: 19,indent: 19,thickness: 1,),
                                        InkWell(
                                          onTap: (){
                                            showDialog(context: context, builder: (context) =>const Mypaytm());
                                            },
                                          child: Container(
                                            height: heights/25,
                                            width: widths/1.6,
                                            decoration: BoxDecoration(color:  const Color(0xff010a40),
                                                border: Border.all(color: Colors.white, width: 2),
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: heights/70),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Paytm Account',  style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                  const Spacer(),
                                                  Container(
                                                      width: widths/4.1,
                                                      // color: Colors.yellowAccent,

                                                      child: Text(paytmA==null?"Fill Your Paytm Details":paytmA.toString(),
                                                        style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                      maxLines: 1,
                                                        textAlign: TextAlign.end,
                                                        overflow: TextOverflow.ellipsis,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(color: Colors.yellow.shade800,endIndent: 19,indent: 19,thickness: 1,),
                                        InkWell(
                                          onTap: (){
                                            showDialog(context: context, builder: (context) =>const Myupi());

                                          },
                                          child: Container(
                                            height: heights/25,
                                            width: widths/1.6,
                                            decoration: BoxDecoration(color:  const Color(0xff010a40),
                                                border: Border.all(color: Colors.white, width: 2),
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: heights/70),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  // SizedBox(width: widths/40,),
                                                  Text('UPI', style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),),
                                                  const Spacer(),
                                                  Container(
                                                      width: widths/4.1,
                                                      // color: Colors.yellowAccent,
                                                      child: Text(upi_id==null?"Fill Your UPI Details":upi_id.toString(),
                                                        style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                                        maxLines: 1,
                                                        textAlign: TextAlign.end,
                                                        overflow: TextOverflow.ellipsis,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Audio.sound();
                  Navigator.pop(context);
                },
                child: Container(
                  height: heights / 20,
                  width: widths / 10,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesCross), fit: BoxFit.fill)),
                ),
              ),
            ),

                          ],
                        ),
      );


  }


  Profile_update(String changeusername,String nameCont) async {
    if (kDebugMode) {
      print("guycyg");
    }
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    if (kDebugMode) {
      print(userId);
      print(changeusername);
      print(nameCont);
    }


    final response = await http.post(

      Uri.parse(AppConstants.profileupdate),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic >{
        "userid":"$userId",
        "username": changeusername,
        "name": nameCont,
        // "image":mydata,

      })


    );
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
        print("👍👍👍👍update");
      }
      if(data["error"]=="200"){
        getprofile();
        Navigator.pop(context);
        Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);

      }
      else {
        Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
      }
    }
    else{
      throw Exception("error");
    }

  }

}


