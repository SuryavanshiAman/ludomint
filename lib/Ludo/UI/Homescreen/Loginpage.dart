import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'Register.dart';
import 'jellybuttonn.dart';
import 'jjellybutton.dart';
import 'otppage.dart';

class numberone extends StatefulWidget {
  const numberone({super.key});

  @override
  State<numberone> createState() => _numberoneState();
}

class _numberoneState extends State<numberone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ConnectivityConstants.initConnectivity();
  }

  // @override
  // void dispose() {
  //   connectionStatus;
  //   super.dispose();
  // }

  // ConnectivityResult connectionStatus = ConnectivityResult.none;

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();

  bool loading = false;
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(39)),
                child: Container(
                  height: heights * 0.3,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage(
                  //             AppAsset.imagesNewbg), fit: BoxFit.fill)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.yellow.shade800, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            child: Image.asset(AppAsset.imagesCross,
                                height: heights / 25),
                            onTap: () {
                              Audio.sound();
                              Navigator.pop(context);
                            }),
                      ),
                      Text("EXIT",
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.028, color: Colors.white)),
                      SizedBox(height: heights / 30),
                      Text("Are you sure want to exit?",
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.023, color: Colors.white)),
                      SizedBox(height: heights * 0.04),
                      Container(
                        width: widths * 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            JellyButtonn(
                                onTap: () {
                                  SystemNavigator.pop();
                                },
                                title: 'Yes'),
                            JellyButtonn(
                                onTap: () {
                                  Navigator.pop(context, false);
                                },
                                title: 'No'),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
          body:
              // connectionStatus == ConnectivityResult.none?
              // Container(
              //   height: heights*0.09,
              //   width: widths*0.10,
              //   child: Text("No internet connection",style: robotoRegular.copyWith(fontSize: widths*0.03),),
              // ):
              SingleChildScrollView(
        child: Container(
          height: heights,
          width: widths,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAsset.imagesPlainnew),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Image.asset(AppAsset.imagesLogonew),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: heights / 20),
                    child: TextField(
                      controller: phoneCon,
                      style: RighteousMedium.copyWith(
                          fontSize: heights * 0.019, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                                  heights / 50), // Adjust padding as needed
                          counter: const Offstage(),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Color(0xFFF65054)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Color(0xFFF65054)),
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: widths / 60,
                              ),
                              const Icon(Icons.phone, color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),
                          hintText: "Mobile Number",
                          hintStyle: RighteousMedium.copyWith(
                              fontSize: heights * 0.019,
                              color: Colors.white.withOpacity(0.6)),
                          fillColor: const Color(0xff010a40).withOpacity(0.9),
                          filled: true),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: heights / 20),
              loading == false
                  ? JellyButton(
                      onTap: () {
                        Audio.sound();

                        // User_login(phoneCon.text,passCon.text);
                        login_page(
                          phoneCon.text,
                        );
                      },
                      title: 'Verify')
                  : Container(
                      height: heights / 10,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAsset.imagesLoader),
                              fit: BoxFit.cover)),
                    ),
            ],
          ),
        ),
      )),
    );
  }

  login_page(String phoneCon) async {
    setState(() {
      loading = true;
    });

    final response = await http.post(Uri.parse(AppConstants.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "phone": phoneCon,
        }));

    var jsonlogin = jsonDecode(response.body);

    if (jsonlogin["error"] == "200") {
      // var userid= jsonlogin['id']['id'];
      var status = jsonlogin['status'];
      var User_id = jsonlogin['userid'];
      otpurl(phoneCon, status, User_id);

      // Utils.flushBarsuccessMessage(jsonlogin["msg"], context, Colors.white);
    } else if (jsonlogin["error"] == "503") {
      setState(() {
        loading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Numbertwo(
                    phone: phoneCon,
                  )));
      //var userid= jsonlogin['id']['id'];
      Utils.flushBarErrorMessage(jsonlogin["msg"], context, Colors.white);
    } else {
      setState(() {
        loading = false;
      });

      Utils.flushBarErrorMessage(jsonlogin["msg"], context, Colors.white);
    }
  }

  otpurl(String phonenumber, status, user_id) async {
    final response = await http.get(
      phonenumber == "9999999999"
          ? Uri.parse(
              '${AppConstants.Send_otp}mobile=$phonenumber&digit=4&mode=test')
          : Uri.parse(
              '${AppConstants.Send_otp}mobile=$phonenumber&digit=4&mode=live'),
    );

    var data = jsonDecode(response.body);
    if (data["error"] == "200") {
      setState(() {
        loading = false;
      });
      var otp = data['otp'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => otp_Page(
                    phone: phonenumber,
                    status: status,
                    userid: user_id,
                    otp: otp.toString(),
                  )));
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    } else {
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }
  }
}
