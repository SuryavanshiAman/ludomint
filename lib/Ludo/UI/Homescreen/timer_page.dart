
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/generated/assets.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/main_screen.dart';
import 'package:ludomint/view_model/firebase_view_model.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 10;
  Timer? _timer;
  Timer? _blinkingTimer;
  bool _hasNavigated = false;
  bool _isBlinking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer(context);
    });
  }

  void _startTimer(context) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds == 0) {
          _timer?.cancel();
          _startBlinking();
          print("lllll");
          _checkForPlayers(context); // Check for players after timer ends
          print("lllll");
        } else {
          _seconds--;
        }
      });
    });
  }

  void _startBlinking() {
    _blinkingTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _isBlinking = !_isBlinking; // Toggle visibility for blinking effect
        });
      }
    });
  }

  void _checkForPlayers(context) {
    if (!_hasNavigated) {
      print("mmmm");
      final documentID = Provider.of<FirebaseViewModel>(context, listen: false);
      final ludoProvider = Provider.of<LudoProvider>(context, listen: false);
      final docId = documentID.table.toString();
      CollectionReference ludoCollection = FirebaseFirestore.instance.collection('ludo');

      ludoCollection.doc(docId).get().then((snapshot) {
        print("pppp");
        if (snapshot.exists) {
          print("kkk");
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          String player1 = data['1'] ?? '';
          String player2 = data['2'] ?? '';
          String player3 = data['3'] ?? '';
          String player4 = data['4'] ?? '';

          bool allPlayersPresent = player1.isNotEmpty &&
              player2.isNotEmpty &&
              player3.isNotEmpty &&
              player4.isNotEmpty;
          bool twoPlayersPresent = player1.isNotEmpty && player3.isNotEmpty;

          // if (ludoProvider.playerQuantity != 2 ? allPlayersPresent : twoPlayersPresent) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     String argument = ModalRoute.of(context)!.settings.arguments.toString();
          //     Navigator.pushReplacementNamed(context, RoutesName.ludoHomeScreen, arguments: argument);
          //     _hasNavigated = true;
          //   });
          // }
          if (ludoProvider.playerQuantity != 2 ? allPlayersPresent : twoPlayersPresent) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(context, MaterialPageRoute(builder: (coontext)=>MainScreen(selectedamount:ludoProvider.entryAmount.toString())));
              // Navigator.pushReplacementNamed(context, RoutesName.ludoHomeScreen, arguments: argument);
              _hasNavigated = true;
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _blinkingTimer?.cancel();
    super.dispose();
  }
  // Future<Future> onWillPop() async {
  //
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const BackPopup();
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    _checkForPlayers(context);
    final ludoProvider = Provider.of<LudoProvider>(context);
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesTimerPageBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesTimerPage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text(
                      _seconds.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    const Text(
                      "Start Game...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              if (_seconds == 0)
                AnimatedOpacity(
                  opacity: _isBlinking ? 1.0 : 0.0, // Toggle opacity
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    "Waiting for other participants...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
    //   PopScope(
    //     canPop:ludoProvider.status==true? false:true,
    //     onPopInvoked: (v) {
    //   ludoProvider.status==true?
    //   onWillPop():null;
    //     },
    //   child: Scaffold(
    //     body: Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       decoration: const BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage(Assets.imagesTimerPageBg),
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //       child: Center(
    //         child: Column(
    //           children: [
    //             Spacer(),
    //             Container(
    //               height: MediaQuery.of(context).size.height * 0.45,
    //               width: double.infinity,
    //               decoration: const BoxDecoration(
    //                 image: DecorationImage(
    //                   image: AssetImage(Assets.imagesTimerPage),
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //               child: Column(
    //                 children: [
    //                   SizedBox(height: MediaQuery.of(context).size.height * 0.1),
    //                   Text(
    //                     _seconds.toString(),
    //                     style: const TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 60,
    //                       fontWeight: FontWeight.w900,
    //                     ),
    //                   ),
    //                   SizedBox(height: MediaQuery.of(context).size.height * 0.15),
    //                   const Text(
    //                     "Start Game...",
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: MediaQuery.of(context).size.height * 0.1),
    //             if (_seconds == 0)
    //               AnimatedOpacity(
    //                 opacity: _isBlinking ? 1.0 : 0.0, // Toggle opacity
    //                 duration: const Duration(milliseconds: 500),
    //                 child: const Text(
    //                   "Waiting for other participants...",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 24,
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                 ),
    //               ),
    //             SizedBox(height: MediaQuery.of(context).size.height * 0.1),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
