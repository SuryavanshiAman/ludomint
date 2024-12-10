import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/Ludo/UI/Homescreen/create_join_room_screen.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/repo/join_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinViewModel with ChangeNotifier {
  final _joinRepo = JoinRepository();

  bool _loading = false;
  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> joinApi(dynamic amount,dynamic status, context) async {
    setLoading(true);
    final roomCode = Provider.of<LudoProvider>(context,listen: false);
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print("Aman:$userid");
    print("userid:${ userid.toString()}",);
    print("amount:${ amount.toString()}");

    Map data={
      "userid":userid.toString(),
      "amount":amount.toString()
    };
print("SSSS:$data");
    _joinRepo.joinApi(data).then((value) {
      print("kkkk:$data");
      if (value['error'] == "200") {
        setLoading(false);
        if(status=="1"){
          Provider.of<LudoProvider>(context, listen: false).createRoom(context,);
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const CreateJoinRoomScreen(status: "1")));
            Utils.flushBarsuccessMessage(
                "Room code generated: ${roomCode.roomCode}",
                context,
                Colors.white);
          });
        }else{
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const CreateJoinRoomScreen(status: "2")));
        }

      }
      else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['msg'], context,Colors.white);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('joinApiError: $error');
      }
    });
  }

}