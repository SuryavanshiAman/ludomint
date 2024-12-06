import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'Loginpage.dart';
import 'jjellybutton.dart';
import 'otppage.dart';

class Numbertwo extends StatefulWidget {
  final String phone;
  const Numbertwo({super.key, required this.phone});

  @override
  State<Numbertwo> createState() => _NumbertwoState();
}

class _NumbertwoState extends State<Numbertwo> {
  bool invisible = true;

  bool?check1= false,
      check2 = true,
      check3 = false;

  final TextEditingController mobilenum = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController username = TextEditingController();
  // final TextEditingController password = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController refer = TextEditingController();

@override
  void initState() {
  mobilenum.text= widget.phone;

    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.indigo[900],
        body: SingleChildScrollView(child:Container(
          height: heights,
          width: widths,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesPlainnew),fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Image.asset(AppAsset.imagesLogonew, height: heights/4,)),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: heights/40,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widths/10),
                    child: TextField(
                      controller: mobilenum,
                        readOnly: true,
                        style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: heights/50), // Adjust padding as needed
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
                          suffixIcon: InkWell(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const numberone()));
                          },
                              child: const Icon(Icons.edit,color: Colors.white)),
                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: widths/60,),
                              const Icon(Icons.phone,color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),

                          fillColor: const Color(0xff010a40).withOpacity(0.9),
                          filled: true
                      ),

                    ),
                  ),
                  SizedBox(height: heights/100,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: heights/20),
                    child: TextField(
                      controller: name,
                      style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: heights/50), // Adjust padding as needed
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
                              SizedBox(width: widths/60,),
                              const Icon(Icons.person,color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),
                          hintText: "Name",
                          hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white.withOpacity(0.6)),

                          // Icon(Icons.remove_red_eye, color: Colors.white,),
                          fillColor: const Color(0xff010a40).withOpacity(0.9),
                          filled: true
                      ),

                    ),
                  ),
                  SizedBox(height: heights/100,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: heights/20),
                    child: TextField(
                      controller: username,
                        style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: heights/50), // Adjust padding as needed
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
                              SizedBox(width: widths/60,),
                              const Icon(Icons.person,color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),
                          hintText: "Username",
                          hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white.withOpacity(0.6)),

                          // Icon(Icons.remove_red_eye, color: Colors.white,),
                          fillColor: const Color(0xff010a40).withOpacity(0.9),
                          filled: true
                      ),

                    ),
                  ),
                  SizedBox(height: heights/100,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: heights/20),
                    child: TextField(
                      controller: age,
                        style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: heights/50), // Adjust padding as needed

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
                              SizedBox(width: widths/60,),
                              const Icon(Icons.format_list_numbered,color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),
                          hintText: "Age",
                          hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white.withOpacity(0.6)),

                          fillColor: const Color(0xff010a40).withOpacity(0.9),
                          filled: true
                      ),
                      obscureText: invisible,
                    ),
                  ),
                  SizedBox(height: heights/100,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: heights/20),
                    child: TextField(
                      controller: refer,
                        style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: heights/50), // Adjust padding as needed
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
                              SizedBox(width: widths/60,),
                              const Icon(Icons.share,color: Colors.white),
                              Image.asset(AppAsset.imagesTextfiled)
                            ],
                          ),

                          hintText: "Enter Refer Code(Optional)",
                          hintStyle: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white.withOpacity(0.6)),
                          fillColor:  const Color(0xff010a40).withOpacity(0.9),
                          filled: true
                      ),

                    ),
                  ),

                ],
              ),
              SizedBox(height: heights/40,),
              Container(
                // color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        activeColor: Colors.deepOrange,
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        value: check1,
                        onChanged: (bool?value)
                        {
                          setState(() {
                            check1 = value;
                          });
                        }
                    ),
                    Text("I have read and agreed PRIVACY POLICY \n and USER AGREEMENT", style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white),)
                  ],
                ),
              ),
              SizedBox(height: heights/40,),
              check1 ==true?
              JellyButton(
                  onTap: () {
                    if(check1==false){
                      Fluttertoast.showToast(
                          msg: "Please agree terms and condition",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{print("Api hit");}
                    Audio.sound();
                    // User_register(username.text,password.text,confirmpass.text,mobilenum.text,refer.text);
                     Register(mobilenum.text,name.text,username.text,age.text,refer.text);
                  },
                  title: 'Register'
              ):Container(),
            ],
          ),
        )
        )

    );
  }
  Register(String mobilenum,String name,String username, String age,  String refer ) async {
    final response = await http.post(

      Uri.parse(AppConstants.register),
      headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode( <String,String>{
          "phone":mobilenum,
          "name": name,
          "username": username,
          "age": age,
          "refral_code":refer,
        }),

    );
    var data = jsonDecode(response.body);
    print("😂😂😂😂");
    print(data);
    print("😂😂😂😂");
    if(data["error"]=="200"){
      var status= data['status'];
      var User_id= data['id'];
      otpurl(mobilenum,status,User_id);
    }else {
      Utils.flushBarErrorMessage( data["msg"], context, Colors.white);
    }
  }


  otpurl(String phonenumber, String status,String user_id) async {


    final response = await http.get(
      Uri.parse('${AppConstants.Send_otp}mobile=$phonenumber&digit=4&mode=test'),
    );


    var data = jsonDecode(response.body);
    if(data["error"]=="200"){
      var otp=  data['otp'];
      Navigator.push(context, MaterialPageRoute(builder: (context)=>otp_Page(phone: phonenumber, status: status, userid: user_id, otp:otp,)));
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);

    }else {

      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);

    }
  }

}

