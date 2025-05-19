import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';

class Mypaytm extends StatefulWidget {
  const Mypaytm({super.key});

  @override
  State<Mypaytm> createState() => _MypaytmState();
}

class _MypaytmState extends State<Mypaytm> {

  @override
  void initState() {

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<ProfileViewModel>(context,listen: false).profileApi();
    //
    // });
    super.initState();
  }








  final TextEditingController paytmHname = TextEditingController();
  final TextEditingController paytmno = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child: Container(
          height: heights/2.6,
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
                              Text("Paytm Details",style: RighteousMedium.copyWith(fontSize: heights * 0.030, color: Colors.white)),
                              SizedBox(height: heights/40,),
                              Container(
                                height: heights/10,
                                width: widths/1.7,
                                child: TextField(
                                  controller: paytmHname,
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
                                      hintText: "Paytm Holder Name",
                                      hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                      fillColor:Color(0xff010a40).withOpacity(0.9),
                                      filled: true
                                  ),
                                ),
                              ),
                              Container(
                                height: heights/10,
                                width: widths/1.7,
                                child: TextField(
                                  controller: paytmno,
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
                                      hintText: "Paytm Number",
                                      hintStyle:  RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
                                      fillColor:Color(0xff010a40).withOpacity(0.9),
                                      filled: true
                                  ),
                                  maxLength: 11,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              JellyButton(
                                  onTap: () {
                                    Audio.sound();
                                    paytm_details(paytmHname.text,paytmno.text);

                                  },
                                  title: 'Submit'
                              ),
                              // TextButton(
                              //     onPressed: (){
                              //       Audio.sound();
                              //       // Navigator.pop(context);
                              //       paytm_details(paytmHname.text,paytmno.text);
                              //     },
                              //     child: Image.asset(AppAsset.buttonSubmit,height: heights/26)
                              // )
                            ],
                          ),

          ),
        ),
      );

  }

  paytm_details(String paytmHname,String paytmno) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.post(
      Uri.parse(AppConstants.paytmDetails),
      headers: <String , String >{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ptm_holder_name":paytmHname,
        "paytm_no":paytmno,
        "userid":"$userid",

      })
    );
    var data = jsonDecode(response.body);

    if(data["error"]=="200"){
      Provider.of<ProfileViewModel>(context,listen: false).profileApi();
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    }else{
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }

  }


}

