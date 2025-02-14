import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'api/apiprofile.dart';
import 'gamepage.dart';
import 'jellybuttonnn.dart';
import 'jjellybutton.dart';

class otp_Page extends StatefulWidget {
  final String phone;
   final String otp;
  final String status;
  final String userid;
  const otp_Page({
    Key? key,
    required this.phone,
     required this.otp,
    required this.status,
    required this.userid,
  }) : super(key: key);

  @override

  State<otp_Page> createState() => _otp_PageState();
}

class _otp_PageState extends State<otp_Page> {
  int _secondsRemaining = 20;
  late Timer _timer;
  bool _timerExpired = false;
  bool isOtpVarified = false;
  bool loading = false;
  TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    print("🌐🌐🌐");
    print(widget.userid);
    print(widget.phone);
    print(widget.status);
    getprofile();
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timerExpired = true;
          _timer.cancel(); // Cancel the timer when it reaches 0.
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void _handleResendButtonPressed() {
    // Implement the logic to resend your message or code here.
    // For demonstration purposes, we reset the timer.
    setState(() {
      _secondsRemaining = 20;
      _timerExpired = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timerExpired = true;
          _timer.cancel();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //
      //   // backgroundColor: Colors.transparent,
      //   leading: IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAsset.imagesPlainnew), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            // shrinkWrap: true,
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 350),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                  icon: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
                ),
              ),
              SizedBox(height: height*0.03,),
              Center(
                child: Container(
                    child: Image.asset(
                  AppAsset.imagesLogonew,
                  height: height * 0.2,
                )),
              ),
              Center(
                child: Text(
                  "Verification",
                  style: RighteousMedium.copyWith(
                      fontSize: height * 0.05, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  "Enter the code sent to the number",
                  style: RighteousMedium.copyWith(
                      fontSize: height * 0.02, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  widget.phone,
                  style: RighteousMedium.copyWith(
                      fontSize: height * 0.02, color: Colors.white),
                ),
              ),
              // SizedBox(height: height*0.03,),
              // Text(
              //   '$_secondsRemaining⏳ ',
              //   style: TextStyle(fontSize: 24),
              // ),
              SizedBox(height: height*0.06,),
              Pinput(
                length: 4,
                controller: _textController,
                showCursor: true,
                autofillHints: [AutofillHints.oneTimeCode],
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                onCompleted: (value) {
                  setState(() {
                    // otpCode = value;
                  });
                },
              ),
              // TextField(
              //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
              //   controller: _textController,
              //   autofillHints: [AutofillHints.oneTimeCode],
              //   keyboardType: TextInputType.visiblePassword,
              //   maxLength: 6,
              //   style: TextStyle(fontSize: 32),
              // ),
              SizedBox(height: height*0.05),
          JellyButton(
              onTap: () {
                if(_textController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please enter  OTP", context, Colors.white);
                }else{
                  veryfyotp(_textController.text,widget.phone,widget.otp,widget.status,widget.userid);
                }
              },
              title: 'Verify'),
              SizedBox(height: height*0.05),
              _timerExpired?
              JellyButtonnn(
                  onTap: (){
                    otpurl(widget.phone,widget.status,widget.userid);
                    // resendOtp(_textController.text);
                    _handleResendButtonPressed;
                    }, title: "Resend")
                  :Text(
                '⏳$_secondsRemaining ',
                style: TextStyle(fontSize: 24,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
  veryfyotp(String _textController,String phonenumber,String otp,String status,String user_id) async {
    print(_textController);
    print('wwwwwwwwwwwwww');
    print(otp);
    print('otpvvvvvv');
    print('otpvvvvvv');
    final prefs = await SharedPreferences.getInstance();
    final key = 'userId';
    final userId = user_id.toString();
    prefs.setString(key, userId);
    final response = await http.get(
      Uri.parse('${AppConstants.OTP_verify}mobile=$phonenumber&otp=$_textController'),);
    var data = jsonDecode(response.body);
    if(data["error"]=="200"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Numberthree()));
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);

    }else {

      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);

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
    if(data["error"]=="200"){
      var otp=  data['otp'];
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);

    }else {

      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);

    }
  }


}
