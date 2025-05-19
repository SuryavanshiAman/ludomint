// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import '../constant/utilll.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';

class Myupi extends StatefulWidget {
  const Myupi({super.key});

  @override
  State<Myupi> createState() => _MyupiState();
}

class _MyupiState extends State<Myupi> {
  // @override
  // void initState() {
  //   bank_view();
  //   super.initState();
  //
  // }

  // bank_view(){
  //   upiIDCont.text = upi_id==null?"":upi_id.toString();
  //
  // }

  final TextEditingController upiIDCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Dialog(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
          child: Container(
            height: heights / 3,
            // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesNewbg),fit: BoxFit.fill)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade800, width: 3),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset(AppAsset.imagesCross,
                          height: heights / 20),
                      onTap: () {
                        Audio.sound();
                        Navigator.pop(context);
                      },
                    )),
                Text("UPI Details",
                    style: RighteousMedium.copyWith(
                        fontSize: heights * 0.030, color: Colors.white)),
                SizedBox(
                  height: heights / 40,
                ),
                Container(
                  height: heights / 10,
                  width: widths / 1.7,
                  child: TextField(
                    controller: upiIDCont,
                    style: RighteousMedium.copyWith(
                        fontSize: heights * 0.018, color: Colors.white),
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
                      hintText: "UPI Id",
                      hintStyle: RighteousMedium.copyWith(
                          fontSize: heights * 0.018, color: Colors.white),
                      fillColor: const Color(0xff010a40).withOpacity(0.9),
                      filled: true,
                    ),
                    maxLength: 10,
                  ),
                ),
                JellyButton(
                    onTap: () {
                      Upi(upiIDCont.text);
                      Audio.sound();
                    },
                    title: 'Submit'),
              ],
            ),
          )),
    );
  }

  Upi(String upiIDCont) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
   final profileVM= Provider.of<ProfileViewModel>(context,listen: false);

    final response = await http.post(Uri.parse(AppConstants.UPI),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "upi_id": upiIDCont,
          "userid": "$userid",
        }));

    var data = jsonDecode(response.body);
    if (kDebugMode) {
      print(data);
    }
    if (kDebugMode) {
      print("👍👍👍👍👍👍👍");
    }

    if (data["error"] == "200") {
      profileVM.profileApi();
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    } else {
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }
  }
}
