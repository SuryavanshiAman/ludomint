import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ludomint/Ludo/UI/constant/api%20constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/ruleapi.dart';
import 'logout.dart';
import 'package:http/http.dart' as http;

class Mysettings extends StatefulWidget {
  const Mysettings({super.key});

  @override
  State<Mysettings> createState() => _MysettingsState();
}

class _MysettingsState extends State<Mysettings> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  bool gamechat = false;
  bool Vibration = false;
  bool Sound = false;
@override
  void initState() {
  policy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery
        .of(context)
        .size
        .height;
    final widths = MediaQuery
        .of(context)
        .size
        .width;
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Container(
        // height: heights * 0.6,
        width: widths * 0.8,
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade800, width: 3),
            borderRadius: BorderRadius.circular(40)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child:
                    Image.asset(AppAsset.imagesCross, height: heights / 20),
                    onTap: () {
                      Audio.sound();
                      Navigator.pop(context);
                    }),
              ),
              // SizedBox(height: heights/60,),
              Text("SETTINGS",
                  style: RighteousMedium.copyWith(
                      fontSize: heights * 0.028, color: Colors.white)),
              SizedBox(height: heights * 0.04),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About Us',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                    child: InkWell(
                                                        child: Image.asset(
                                                            AppAsset
                                                                .imagesCross,
                                                            height: heights /
                                                                20),
                                                        onTap: () {
                                                          Audio.sound();
                                                          Navigator.pop(
                                                              context);
                                                        })),
                                              ),
                                              Center(
                                                  child: Text("About Us",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10),
                                                height: heights / 2.5,
                                                // color: Colors.yellowAccent,
                                                child: const SingleChildScrollView(
                                                    child: Text(
                                                      """Welcome to Ludo Mint!

Ludo Mint is a premier skill-based gaming platform dedicated to providing an engaging and competitive environment for Ludo enthusiasts. Our mission is to bring the traditional game of Ludo into the digital age, allowing players from around the world to connect, compete, and showcase their strategic prowess.

At Ludo Mint, we believe in fair play, fun, and continuous improvement. Our platform is designed with advanced algorithms to ensure a level playing field, where skill and strategy triumph over luck. Whether you are a casual player looking to enjoy a quick game or a serious competitor aiming to top the leaderboards, Ludo Mint offers a seamless and exhilarating gaming experience.

Join us on this exciting journey and become a part of the Ludo Mint community!
""",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),

                                              // Text(
                                              //     Rules == null
                                              //         ? ""
                                              //         : Rules.toString(),
                                              //     style: GoogleFonts.robotoSlab(
                                              //         textStyle: TextStyle(
                                              //             color: Colors.white,
                                              //             fontSize: heights / 20))),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Contact Us',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              Center(
                                                  child: Text("Contact Us",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              const Text(
                                                "We value your feedback and are here to assist you with any queries or concerns. Please feel free to reach out to us through any of the following method:",
                                                style:
                                                TextStyle(color: Colors.white),
                                              ),
                                              const ListTile(
                                                leading: Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: Text(
                                                  "Email: support@ludomint.com",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                contentPadding: EdgeInsets.all(
                                                    0),
                                              ),
                                              const Text(
                                                "Our customer support team is available from Monday to Friday, 9:00 AM to 6:00 PM (EST). We strive to respond to all inquiries within 24 hours.",
                                                style:
                                                TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Privacy Policy',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              Center(
                                                  child: Text("Privacy Policy",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10),
                                                height: heights / 2.5,
                                                // color: Colors.yellowAccent,
                                                child:  SingleChildScrollView(
                                                  child: HtmlWidget(
                                                     privacy.toString(),
                                                    textStyle: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Terms of Service',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              Center(
                                                  child: Text(
                                                      "Terms of Service",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10),
                                                height: heights / 2.5,
                                                // color: Colors.yellowAccent,
                                                child: SingleChildScrollView(
                                                    child: HtmlWidget(
                                                      term.toString(),
                                                      textStyle: TextStyle(color: Colors.white),
                                                    ),),
                                              ),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Refund Policy',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              Center(
                                                  child: Text("Refund Policy",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10),
                                                height: heights / 2.5,
                                                // color: Colors.yellowAccent,
                                                child:  SingleChildScrollView(
                                                    child: HtmlWidget(
                                                      refund.toString(),
                                                      textStyle: TextStyle(color: Colors.white),
                                                    ),),
                                              ),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gamer Rules',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.rule_folder,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(39)),
                                        child: Container(
                                          height: heights * 0.6,
                                          width: widths * 0.8,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                    child: InkWell(
                                                        child: Image.asset(
                                                            AppAsset
                                                                .imagesCross,
                                                            height: heights /
                                                                20),
                                                        onTap: () {
                                                          Audio.sound();
                                                          Navigator.pop(
                                                              context);
                                                        })),
                                              ),
                                              Center(
                                                  child: Text("RULES",
                                                      style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                          heights * 0.028,
                                                          color:
                                                          Colors.white))),
                                              SizedBox(
                                                height: heights / 30,
                                              ),
                                              Container(
                                                height: heights / 2.5,
                                                // color: Colors.yellowAccent,
                                                child: SingleChildScrollView(
                                                  child: HtmlWidget(
                                                    Rules == null
                                                        ? "pg-dghp[,h["
                                                        : Rules.toString(),
                                                    textStyle: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),

                                              // Text(
                                              //     Rules == null
                                              //         ? ""
                                              //         : Rules.toString(),
                                              //     style: GoogleFonts.robotoSlab(
                                              //         textStyle: TextStyle(
                                              //             color: Colors.white,
                                              //             fontSize: heights / 20))),
                                            ],
                                          ),
                                        )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: const Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Change Password',
              //             style: RighteousMedium.copyWith(
              //                 fontSize: heights * 0.019, color: Colors.white)),
              //         InkWell(
              //             onTap: () {
              //               Audio.sound();
              //               showDialog(
              //                   context: context,
              //                   builder: (context) => const Mypassword());
              //             },
              //             child: Container(
              //               height: heights / 20,
              //               width: widths / 10,
              //               decoration: BoxDecoration(
              //                   color: Colors.green,
              //                   border:
              //                       Border.all(color: Colors.yellow, width: 2),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: const Icon(Icons.remove_red_eye,
              //                   size: 17, color: Colors.white),
              //             ))
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: heights * 0.01,
              // ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logout',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.019, color: Colors.white)),
                      InkWell(
                        onTap: () {
                          Audio.sound();
                          showDialog(
                              context: context,
                              builder: (context) => const Mylogout());
                        },
                        child: Container(
                          height: heights / 20,
                          width: widths / 10,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border:
                              Border.all(color: Colors.yellow, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.logout_outlined,
                              size: 17, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  var privacy;
  var refund;
  var term;


  // return responseData;

  Future<void> policy() async{
    print("♟️♟️♟️♟️♟️");

    final url = Uri.parse(AppConstants.privacy);
    final response = await http.get(
      url,
    );
    print("Aman:$url");

    if(response.statusCode==200){

      final responseData = json.decode(response.body)["data"];
      print("😂😂😂😂😂response");
      print(responseData["privacy policy"]);
      setState(() {
        privacy = responseData["privacy policy"];
        refund = responseData["refund policy"];
        term = responseData["terms and condition"];
      });

      return responseData;

    }else{
      throw Exception("failed to load data");
    }
  }

}

String referalCode = 'initialData';
Future<void> share() async {
  await FlutterShare.share(
      title: 'Referral Code :',
      text: 'Join Now & Get Exiting Prizes. here is my Referral Code : ',
      linkUrl: "",
      chooserTitle: 'Referrel Code : ');
}
