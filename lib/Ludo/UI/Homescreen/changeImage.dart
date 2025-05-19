import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class Selectimage extends StatefulWidget {
  const Selectimage({super.key});

  @override
  State<Selectimage> createState() => _SelectimageState();
}

class _SelectimageState extends State<Selectimage> {
  var mydata;

  File? file;
  final picker = ImagePicker();

  void _choose() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
        // Navigator.pop(context);
        final bytes = File(pickedFile.path).readAsBytesSync();

        String img64 = base64Encode(bytes);
        setState(() {
          mydata = img64;
        });
        setState(() {});
        // mydata = img64;
        if (kDebugMode) {
          print('Thi');
          print(img64);
        }
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  void _camera() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
        // Navigator.pop(context);
        final bytes = File(pickedFile.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        setState(() {
          mydata = img64;
        });
        setState(() {});
        // mydata = img64;
        if (kDebugMode) {
          print('Abhinav');
        }
        if (kDebugMode) {
          print(img64);
        }
        if (kDebugMode) {
          print('Thi');
        }
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final profileVM = Provider.of<ProfileViewModel>(context);
    final profileData = profileVM.profileModelData;
    return Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child: Container(
          height: heights / 2,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow.shade800, width: 3),
              borderRadius: BorderRadius.circular(40)),
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
                  },
                ),
              ),
              Text(
                "Select Image",
                style: RighteousMedium.copyWith(
                    fontSize: heights * 0.030, color: Colors.white),
              ),
              SizedBox(
                height: heights / 15,
              ),
              (file != null)
                  ? CircleAvatar(
                      backgroundImage: FileImage(file!),
                      radius: heights / 20,
                    )
                  : profileData?.data?.image == null
                      ? CircleAvatar(
                          radius: heights / 20,
                          backgroundImage:
                              const AssetImage(AppAsset.imagesAvatar3))
                      : CircleAvatar(
                          radius: heights / 28,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            AppConstants.imageurl + profileData?.data?.image,
                          ),
                        ),
              SizedBox(height: heights / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: _camera,
                      child: const CircleAvatar(
                        child: Icon(Icons.camera_alt_outlined),
                      )),
                  InkWell(
                      onTap: _choose,
                      child: const CircleAvatar(
                        child: Icon(Icons.folder),
                      )),
                ],
              ),
              SizedBox(
                height: heights / 20,
              ),
              JellyButton(
                  onTap: () {
                    Audio.sound();
                    image_update();
                    // Navigator.pop(context);
                  },
                  title: 'Save'),
            ],
          ),
        ));
  }

  image_update() async {
    if (kDebugMode) {
      print("abhi");
    }
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    if (kDebugMode) {
      print(userId);
    }
    final response = await http.post(Uri.parse(AppConstants.profileupdate),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "userid": "$userId",
          "image": mydata,
        }));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body);
        print("👍👍👍👍update");
      }
      if (data["error"] == "200") {
        final profileVM = Provider.of<ProfileViewModel>(context,listen: false);
           profileVM.profileApi();
        Navigator.pop(context);
        Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
      } else {
        Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
      }
    } else {
      throw Exception("error");
    }
  }
}
