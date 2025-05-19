import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ludo_score/generated/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/images.dart';
import 'Loginpage.dart';
import 'gamepage.dart';

class FSplashscreen extends StatefulWidget {
  const FSplashscreen({super.key});

  @override
  State<FSplashscreen> createState() => _FSplashscreenState();
}

class _FSplashscreenState extends State<FSplashscreen> {
  @override
  void initState() {
    tanisha();
    super.initState();
  }

  tanisha() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId") ?? '0';

    userid != '0'
        ? Timer(
            const Duration(seconds: 4),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Numberthree())))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const numberone()));
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Colors.indigo[900],
        body: Container(
      height: sHeight,
      width: sWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover)),
      // child: Column(
      //   children: [
      //     Image.asset(
      //       AppAsset.imagesAppIcon,
      //       width: sWidth / 1.2,
      //     ),
      //     // SizedBox(height: sHeight/1.4),
      //     Container(
      //       height: sHeight / 10,
      //       decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               image: AssetImage(AppAsset.imagesLoader),
      //               fit: BoxFit.cover)),
      //     )
      //   ],
      // ),
    ));
  }
}
