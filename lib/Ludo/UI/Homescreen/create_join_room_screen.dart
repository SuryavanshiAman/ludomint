import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:ludomint/Ludo/UI/Homescreen/api/apiprofile.dart';
import 'package:ludomint/Ludo/UI/constant/api%20constant.dart';
import 'package:ludomint/Ludo/UI/constant/clipboard.dart';
import 'package:ludomint/Ludo/UI/constant/images.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:ludomint/audio.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/main.dart';
import 'package:ludomint/view_model/create_joine_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'jjellybutton.dart';

class CreateJoinRoomScreen extends StatefulWidget {
  final String status;
  const CreateJoinRoomScreen({super.key, required this.status});

  @override
  State<CreateJoinRoomScreen> createState() => _CreateJoinRoomScreenState();
}

class _CreateJoinRoomScreenState extends State<CreateJoinRoomScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CreateJoinViewModel>(context, listen: false)
          .clearData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final cJVMCon = Provider.of<CreateJoinViewModel>(context);
    final ludo = Provider.of<LudoProvider>(context);
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        children: [
          Container(
            height: widget.status == "1" ? heights * 0.6 : heights * 0.45,
            width: widths * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.yellow.shade800, width: 3),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heights / 25,
                ),
                Text(
                  "Play with friends!",
                  style:
                      TextStyle(fontSize: heights * 0.025, color: Colors.white),
                ),
                SizedBox(height: heights / 80),
                Text(
                  "Create an room to play with your friends, share room code with your friends and start game.",
                  style:
                      TextStyle(fontSize: heights * 0.020, color: Colors.white),
                ),
                SizedBox(height: heights / 80),
                Text(
                  "Click on join room enter valid room code and start the game.",
                  style:
                      TextStyle(fontSize: heights * 0.020, color: Colors.white),
                ),
                SizedBox(
                  height: heights / 24,
                ),
                if (cJVMCon.generatedRoomCode.isEmpty)
                  widget.status == "2" ? joinWithRoomCode() : Container(),
                const SizedBox(
                  height: 10,
                ),
                widget.status == "1" ? generateRoomAndStartGame() : Container()
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: heights / 20,
                width: widths / 10,
                // color: Colors.yellow,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAsset.imagesCross),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final joinRoomCon = TextEditingController();
  Widget shareRoomCode() {
    final cJVMCon = Provider.of<CreateJoinViewModel>(context);
    final roomCode = Provider.of<LudoProvider>(context, listen: false);
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          "Room Code",
          style: TextStyle(
            fontSize: heights * 0.018,
            color: Colors.yellow,
          ),
        ),
        SizedBox(height: heights / 80),
        Container(
          height: heights / 26,
          width: widths / 2.5,
          color: Colors.indigo.shade900,
          child: Row(
            children: [
              SizedBox(
                height: heights / 30,
                width: widths / 3,
                child: Center(
                    child: Text(roomCode.roomCode.toString(),
                        style: TextStyle(
                            fontSize: heights * 0.018, color: Colors.white))),
              ),
              SizedBox(
                height: heights / 30,
                width: widths / 15,
                child: InkWell(
                  onTap: () {
                    copyToClipboard(roomCode.roomCode.toString(), context);
                  },
                  child: const Icon(
                    Icons.content_copy,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        JellyButton(
            color: CupertinoColors.activeOrange,
            onTap: () {
              Audio.sound();

              setState(() {
                share();
              });
            },
            title: "Share room code"),
      ],
    );
  }

  Widget joinWithRoomCode() {

    return Column(
      children: [
        TextField(
          controller: joinRoomCon,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: "Enter room code here...",
              constraints: BoxConstraints(
                maxWidth: width / 1.5,
                maxHeight: 45,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Colors.white,
              filled: true),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        JellyButton(
            onTap: () {
              Audio.sound();
              joinApi(joinRoomCon.text.trim());
            },
            title: "Join  Room"),

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
bool circular=false;
  Widget generateRoomAndStartGame() {
    final cJVMCon = Provider.of<CreateJoinViewModel>(
      context,
    );
    return Column(
      children: [
        circular==false? JellyButton(
            color: CupertinoColors.activeOrange,
            onTap: () {
              setState(() {
                circular=true;
              });
              Audio.sound();
              cJVMCon.startGame(context);
            },
            title: "Start game"):CircularProgressIndicator(),
        shareRoomCode()
      ],
    );
  }

  Future<void> share() async {
    final roomCode = Provider.of<LudoProvider>(context, listen: false);
    await FlutterShare.share(
        title: 'Play with friends',
        text: '*${"LudoMint"}* \n  Create room and play ludo with your friends. Entry amount is ₹${roomCode.entryAmount}',
        linkUrl: 'Room Code: ${roomCode.roomCode}',
        chooserTitle: 'Room Code: ${roomCode.roomCode}');
  }
  joinApi(dynamic roomCode) async {
    print("🤡🤡🤡🤡");
    final cJVMCon = Provider.of<CreateJoinViewModel>(context,listen: false);
    final ludo = Provider.of<LudoProvider>(context,listen: false);
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    print("Aman:$userId");
    print("Aman:$roomCode");
    final response = await http.post(
        Uri.parse("https://root.ludomint.in/index.php/api/Mobile_app/join_roomcode"),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic >{
          "userid":userId,
          "roomcode":roomCode,
          "status":"1"
        })
    );
    print("Aman${response.body}");
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      print(data);
      print("👍👍👍👍update");
      if(data["error"]=="200"){
        ludo.joinRoom(context, joinRoomCon.text.trim()).then((value) {
          cJVMCon.navigateToWaitingScreen(
              context, joinRoomCon.text.trim());
        });
        setState(() {
          getprofile();
        });
      }
      else {
        Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
      }
    }
    else{
      throw Exception("error");
    }

  }
}
