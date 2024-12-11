import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/Ludo/UI/Homescreen/timer_page.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateJoinViewModel extends ChangeNotifier {
  String _generatedRoomCode = "";
  String get generatedRoomCode => _generatedRoomCode;

  String _userId = "";
  String get userId => _userId;

  clearData(context) {
    _generatedRoomCode = "";
    notifyListeners();
  }

  void generateRoomCode(context) {
    _generatedRoomCode = DateTime.now().millisecondsSinceEpoch.toString();
    notifyListeners();
    Utils.flushBarsuccessMessage("Room code generated: $_generatedRoomCode", context, Colors.white);
  }

  Future<void> startGame(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    Utils.flushBarsuccessMessage( "Game started with room code: $_generatedRoomCode", context, Colors.white);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigateToWaitingScreen(context, _generatedRoomCode);
    });
  }


  navigateToWaitingScreen(BuildContext context, String roomCode) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const TimerScreen()));

  }

  // Future<bool> joinRoomWithCode(context, String roomCode) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userId");
  //   final profileViewModel =
  //       Provider.of<ProfileViewModel>(context,listen: false).profileResponse?.data;
  //   DocumentReference roomRef =
  //   FirebaseFirestore.instance.collection('ludo').doc(roomCode);
  //   _generatedRoomCode = roomCode;
  //   DocumentSnapshot roomSnapshot = await roomRef.get();
  //   if (roomSnapshot.exists) {
  //     Map<String, dynamic> roomData =
  //     roomSnapshot.data() as Map<String, dynamic>;
  //     List<dynamic> players = roomData['players'];
  //
  //     if (roomData['isGameStart'] == false && players.length < 2) {
  //       players.add({
  //         'userId': userid,
  //         // 'image': AppConstants.imageurl + image.toString(),
  //         'image': "",
  //         'user_name':  profileViewModel?.username??""
  //       });
  //       await roomRef.update({
  //         'players': players,
  //         'isGameStart': true,
  //         'current_chance': "LudoPlayerType.red"
  //       });
  //       Utils.flushBarsuccessMessage( "Room joined successfully", context, Colors.white);
  //       _userId = userid.toString();
  //       notifyListeners();
  //       // Provider.of<LudoProvider>(context, listen: false)
  //       //     .setFireBasePlayers(players);
  //       return true;
  //     } else {
  //       Utils.flushBarErrorMessage( "No space available in this room to join the game", context, Colors.white);
  //
  //       return false;
  //     }
  //   } else {
  //     Utils.flushBarErrorMessage( "Entered room code does not exist", context, Colors.white);
  //     return false;
  //   }
  // }

}