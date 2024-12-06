import 'dart:async';
import 'package:flutter/material.dart';

import '../../../audio.dart';
import '../../../main_screen.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';

class Matching extends StatefulWidget {
  final String selectedPrice;
  const Matching({super.key, required this.selectedPrice});
  // const Matching({super.key});


  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  bool showGif = true;
  bool isTimerRunning = false;


  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  void StartTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void startTimer() {
    isTimerRunning = true;
    Timer(Duration(seconds: 5), () {
      // Code to be executed after the timer expires
      print('Timer has expired!');

      // Set the flag to false to allow starting the timer again
      isTimerRunning = false;
    });
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }


  @override
  void initState() {
    StartTimer();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showGif = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(10));

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      // backgroundColor: Colors.indigo.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height*0.8,
            width: width*0.8,
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40),
            image: DecorationImage(image: AssetImage(AppAsset.imagesClassicroom))
            ),
            child: Column(
              children: [
                SizedBox(height: height*0.115),
                Text("PLAY ONLINE", style: RighteousMedium.copyWith(fontSize: height * 0.025, color: Colors.white),),
                SizedBox(height: height*0.089,),
                Padding(
                  padding: EdgeInsets.only(left: width*0.08),
                  child: Container(
                    height: height*0.035,
                    width: width*0.12,
                    alignment: Alignment.centerLeft,
                    // color: Colors.yellow,
                    child: Text("120",style: RighteousMedium.copyWith(fontSize: width*0.04,color: Colors.orangeAccent,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: height*0.07,),
                Padding(
                  padding: EdgeInsets.only(left: width*0.09),
                  child: Container(
                    height: height*0.02,
                    width: width*0.09,
                    // color: Colors.purple,
                    alignment: Alignment.centerLeft,
                    child: Text(widget.selectedPrice,style: RighteousMedium.copyWith(fontSize: width*0.03,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
                    // child: Text("20",style: RighteousMedium.copyWith(fontSize: width*0.03,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
                )),
                SizedBox(height: height*0.12),
                Padding(
                  padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(AppAsset.imagesAvatar0),
                          ),
                          Container(
                            height: height*0.02,
                            width: width*0.15,
                            decoration: BoxDecoration(color: Colors.indigo.shade900,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.lightBlue)),
                            child: Center(child: Text(username==null?"":username.toString(),style: RighteousRegular.copyWith(fontSize: width*0.03,color: Colors.white),)),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          showGif?
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(AppAsset.imagescontestant),
                          )
                         :CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(AppAsset.imagesAvatar4),
                          ),
                          Container(
                            height: height*0.02,
                            width: width*0.15,
                            decoration: BoxDecoration(color: Colors.indigo.shade900,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.lightBlue)),
                            child: Center(child: Text("???",style: RighteousRegular.copyWith(fontSize: width*0.03,color: Colors.white),)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height*0.14),
                JellyButton(
                    onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen(selectedamount: widget.selectedPrice.toString())));
                },
                    title: "Lets Play",
                  color: Colors.deepOrange,
                )





              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              child: Image.asset(AppAsset.imagesCross,
                  height: height / 20),
              onTap: () {
                Audio.sound();
                Navigator.pop(context);
              },
            ),
          ),

        ],
      ),
    );


  }
}
