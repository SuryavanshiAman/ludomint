import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/timer_page.dart';
import 'package:ludo_score/Ludo/UI/constant/utilll.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateJoinViewModel extends ChangeNotifier {
  // String _generatedRoomCode = "";
  // String get generatedRoomCode => _generatedRoomCode;
  //
  // final String _userId = "";
  // String get userId => _userId;
  //
  // clearData(context) {
  //   _generatedRoomCode = "";
  //   notifyListeners();
  // }

  // void generateRoomCode(context) {
  //   _generatedRoomCode = DateTime.now().millisecondsSinceEpoch.toString();
  //   notifyListeners();
  //   Utils.flushBarsuccessMessage("Room code generated: $_generatedRoomCode", context, Colors.white);
  // }

  // Future<void> startGame(BuildContext context) async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   Utils.flushBarsuccessMessage( "Game started with room code: $_generatedRoomCode", context, Colors.white);
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
  //   });
  // }


  // navigateToWaitingScreen(BuildContext context, String roomCode) {
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => const TimerScreen()));
  //
  // }
}