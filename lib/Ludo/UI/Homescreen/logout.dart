import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'Loginpage.dart';
import 'jellybuttonn.dart';

class Mylogout extends StatefulWidget {
  const Mylogout({super.key});

  @override
  State<Mylogout> createState() => _MylogoutState();
}

class _MylogoutState extends State<Mylogout> {

  @override
  void dispose() {
    Audio.audioPlayers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
        child: Container(
          height: heights * 0.3,
          decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child: Image.asset(AppAsset.imagesCross, height: heights / 25),
                    onTap: () {

                      Audio.sound();
                      Navigator.pop(context);
                    }),
              ),
              Text("LOGOUT", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
              SizedBox(height: heights / 30),
              Text("Are you sure want to Logout?", style: RighteousMedium.copyWith(fontSize: heights * 0.023, color: Colors.white)),
              SizedBox(height: heights * 0.04),
              Container(
                width: widths * 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    JellyButtonn(
                        onTap: () async {
                          dispose();
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove('userId');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const numberone()));},
                        title: 'Yes'
                    ),
                    JellyButtonn(
                        onTap: () {
                          Audio.sound();
                          },
                        title: 'No'
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
