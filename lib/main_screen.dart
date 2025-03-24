import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ludomint/Ludo/UI/Homescreen/api/apiprofile.dart';
import 'package:ludomint/Ludo/UI/Homescreen/jellybuttonn.dart';
import 'package:ludomint/Ludo/UI/Homescreen/test2.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:ludomint/audio.dart';
import 'package:ludomint/widgets/board_widget.dart';
import 'package:ludomint/widgets/dice_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Ludo/UI/Homescreen/gamepage.dart';
import 'Ludo/UI/Homescreen/jjellybutton.dart';
import 'Ludo/UI/constant/api constant.dart';
import 'Ludo/UI/constant/images.dart';
import 'Ludo/UI/constant/style.dart';
import 'constants.dart';
import 'ludo_provider.dart';
import 'main.dart';
import 'view_model/firebase_view_model.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final String selectedamount;
  const MainScreen({super.key, required this.selectedamount});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ConfettiController? _confettiController;
  bool showGif = true;
  bool isSwitched = false;
  bool isSwitchedtwo = false;
  bool isPlayer1Turn = true;

  @override
  void initState() {
    Provider.of<LudoProvider>(context, listen: false)
        .listenToGameUpdates(context);
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showGif = false;
      });
    });
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    // TODO: implement initState
    getUserId();
    super.initState();
  }

  void _triggerConfetti() {
    _confettiController!.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String userid = '';
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString("userId") ?? '0';
    });
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  String roomCode = "";
  bool win = false;
  @override
  Widget build(BuildContext context) {
    final ludoProvider = Provider.of<LudoProvider>(context);
    final documentID = Provider.of<FirebaseViewModel>(context);
    final docId = documentID.table.toString();
    CollectionReference ludoCollection =
        FirebaseFirestore.instance.collection('ludo');
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(39)),
                child: Container(
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.yellow.shade800, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            child: Image.asset(AppAsset.imagesCross,
                                height: height / 25),
                            onTap: () {
                              Audio.sound();
                              Navigator.pop(context);
                            }),
                      ),
                      Text("EXIT",
                          style: RighteousMedium.copyWith(
                              fontSize: height * 0.028, color: Colors.white)),
                      SizedBox(height: height / 30),
                      Text("Are you sure you  want to quit game?",
                          style: RighteousMedium.copyWith(
                              fontSize: height * 0.023, color: Colors.white)),
                      SizedBox(height: height * 0.04),
                      SizedBox(
                        width: width * 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            JellyButtonn(
                                onTap: () {
                                  winningMatch(userid, 0, roomCode);
                                  ludoProvider.removePlayerData(context);
                                  FirebaseFirestore.instance.collection('ludo').doc(roomCode).update({
                                    'loserId': userid,
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Numberthree()));
                                  Audio.audioPlayer.stop();
                                  Audio.audioPlayers.stop();
                                },
                                title: 'Yes'),
                            JellyButtonn(
                                onTap: () {
                                  Navigator.pop(context, false);
                                },
                                title: 'No'),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
          body: StreamBuilder<DocumentSnapshot>(
        stream: ludoCollection.doc(docId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: CircularProgressIndicator());
          }
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Stack(children: [
            _buildDynamicContent(context, data),
          ]);
        },
      )),
    );
  }

  LudoProvider ludoProvider = LudoProvider();
  Widget appBarContent(data) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: height / 10,
        width: width / 0.1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppAsset.imagesClassicupper))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height / 30,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade800, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.turn_left_outlined,
                      color: Colors.yellowAccent,
                    )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text("Game Mode Online",
                        style: RighteousMedium.copyWith(
                            fontSize: height * 0.025, color: Colors.yellow))),
                Center(
                    child: Text("Amount:" "₹" + data['entryAmount'].toString(),
                        style: RighteousMedium.copyWith(
                            fontSize: height * 0.02, color: Colors.yellow))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width / 7,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade800, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo),
                child: IconButton(
                  icon: const Icon(Icons.settings, color: Colors.yellowAccent),
                  onPressed: () {
                    showModalBottomSheet(
                        elevation: 5,
                        backgroundColor: Colors.purple.shade800,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: height * 0.02),
                              Text(
                                "Settings",
                                style: RighteousRegular.copyWith(
                                    fontSize: width * 0.06,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: height * 0.02),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.volume_up,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "Sounds",
                                          style: RighteousRegular.copyWith(
                                              fontSize: width * 0.05,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Switch(
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                            });
                                          },
                                          activeTrackColor:
                                              Colors.lightGreenAccent,
                                          activeColor: Colors.green,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.vibration_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "Vibration",
                                          style: RighteousRegular.copyWith(
                                              fontSize: width * 0.05,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Switch(
                                          value: isSwitchedtwo,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitchedtwo = value;
                                            });
                                          },
                                          activeTrackColor:
                                              Colors.lightGreenAccent,
                                          activeColor: Colors.green,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                indent: 10,
                                endIndent: 10,
                              ),
                              JellyButton(
                                  onTap: () async {
                                    Dialog(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(39)),
                                        child: Container(
                                          height: height * 0.3,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow.shade800,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: height / 25),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              Text("EXIT",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              height * 0.028,
                                                          color: Colors.white)),
                                              SizedBox(height: height / 30),
                                              Text(
                                                  "Are you sure you  want to quit game?",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              height * 0.023,
                                                          color: Colors.white)),
                                              SizedBox(height: height * 0.04),
                                              SizedBox(
                                                width: width * 4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    JellyButtonn(
                                                        onTap: () {
                                                          ludoProvider
                                                              .removePlayerData(
                                                                  context);
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Numberthree()));
                                                          Audio.audioPlayer
                                                              .stop();
                                                          Audio.audioPlayers
                                                              .stop();
                                                        },
                                                        title: 'Yes'),
                                                    JellyButtonn(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context, false);
                                                        },
                                                        title: 'No'),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                                    ludoProvider.dispose();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Numberthree()));
                                  },
                                  title: "Leave Game"),
                              SizedBox(height: height * 0.03),
                            ],
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicContent(BuildContext context, Map<String, dynamic> data) {
    roomCode = data['roomCode'].toString();
    CollectionReference ludoCollection =
        FirebaseFirestore.instance.collection('ludo');
    Map<String, dynamic> player1Data =
        (data['1'] != null && data['1'].isNotEmpty)
            ? json.decode(data['1'])
            : {};
    Map<String, dynamic> player2Data =
        (data['2'] != null && data['2'].isNotEmpty)
            ? json.decode(data['2'])
            : {};
    Map<String, dynamic> player3Data =
        (data['3'] != null && data['3'].isNotEmpty)
            ? json.decode(data['3'])
            : {};
    Map<String, dynamic> player4Data =
        (data['4'] != null && data['4'].isNotEmpty)
            ? json.decode(data['4'])
            : {};

    dynamic myPLayerData;
    if (player1Data['id'] == userid) {
      myPLayerData = 1;
    } else if (player3Data['id'] == userid) {
      myPLayerData = 3;
    }
    final List<Map<String, dynamic>> playerData = [
      player1Data,
      player2Data,
      player3Data,
      player4Data
    ];

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          appBarContent(data),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardWidget(),
            ],
          ),
          userDiseDesing(player1Data),
          oppentsTurn(player3Data),
          Consumer<LudoProvider>(builder: (context, value, child) {
            if (data['3'].isEmpty || data['1'].isEmpty) {
              if(data['loserId'] != "" && data['loserId'] != userid){
                if (win == false) {
                  winningMatch(userid, data['entryAmount'].toString(),
                      data['roomCode'].toString());
                }
                win = true;
              }
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Numberthree()));
              });

              return Container(
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: height * 0.09,
                      ),
                      Image.asset("assets/images/thankyou.gif"),
                      const Text("Thank you for playing 😙",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center),
                      Text(
                          // value.winners.length == 1
                          //     ? "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}"
                          //     :
                          data['3'].isEmpty
                              ? "The Winners is:${player1Data['name']} "
                              : "The Winners is:${player3Data['name']} ",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 20),
                      const Text("Refresh your browser to play again",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            } else if (data["winnerId"] != null) {
              print("💕💕💕");
              if (win == false) {
                winningMatch(data["winnerId"], data['entryAmount'].toString(),
                    data['roomCode'].toString());
              }
              win = true;
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Numberthree()));
              });
              if (data["winnerId"] == userid) {
                return Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: height * 0.09,
                        ),
                        Image.asset("assets/images/thankyou.gif"),
                        const Text("Thank you for playing 😙",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center),
                        Text(
                            // value.winners.length == 1
                            //     ? "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}"
                            //     : data['3'].isEmpty
                            //     ?
                            "The Winners is:${name} ",
                            // : "The Winners is:${player3Data['name']} ",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center),
                        const Divider(color: Colors.white),
                        const SizedBox(height: 20),
                        const Text("Refresh your browser to play again",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              } else {
                if (win == false) {
                  winningMatch(
                      data["winnerId"], 0, data['roomCode'].toString());
                }
                win = true;
                return Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: height * 0.09,
                        ),
                        Image.asset("assets/images/loos.png"),
                        const Text("Thank you for playing 😙",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center),
                        const Text("You Loos the match",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center),
                        const Divider(color: Colors.white),
                        const SizedBox(height: 20),
                        const Text("Refresh your browser to play again",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              }
            } else {
              print("else too executed");
              return const SizedBox.shrink();
            }
          }),
          showGif
              ? Container(
                  height: height / 5,
                  width: width / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAsset.imagesLetsplay),
                          fit: BoxFit.fill)),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget userDiseDesing(playerData) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Consumer<LudoProvider>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(bottom: heights / 11, left: heights / 30),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: heights / 9,
            width: widths / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAsset.imagesClassicdiceone),
                    fit: BoxFit.fill)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: heights / 60),
                  child: Column(
                    children: [
                      Text(playerData['name'].toString(),
                          // username == null ? "" : username.toString(),
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.018, color: Colors.white)),
                      Container(
                        height: heights / 19,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(AppAsset.imagesAvatar0),
                            ),
                            border: Border.all(color: Colors.white),
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heights / 15,
                  width: widths / 10,
                  child: value.currentPlayer.type == LudoPlayerType.blue
                      ? const DiceWidget()
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isUserTurn = true;
  Widget oppentsTurn(player2Data) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Consumer<LudoProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.only(top: heights / 10, right: heights / 35),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: heights / 9,
              width: widths / 3.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAsset.imagesClassicdicetwo),
                      fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: heights / 15,
                    width: widths / 10,
                    child: value.currentPlayer.type == LudoPlayerType.green
                        ? const DiceWidget()
                        : const SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      children: [
                        Text(player2Data['name'].toString(),
                            // "Computer",
                            style: RighteousMedium.copyWith(
                                fontSize: heights * 0.018,
                                color: Colors.white)),
                        Container(
                          height: heights / 19,
                          width: widths / 10,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(AppAsset.imagesAvatar0),
                              ),
                              border: Border.all(color: Colors.white),
                              color: Colors.black),
                        ),
                        const Text(
                          // 'Score: ${value.totalPoints}',
                          'Score:10',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  winningMatch(dynamic id, dynamic amount, dynamic roomCode) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");

    print("Aman:$userId");
    print(
      "userid:${userId.toString()}",
    );
    print("amount:${amount.toString()}");
    final response = await http.post(Uri.parse(AppConstants.winningMatch),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "userid": id.toString(),
          "amount": amount.toString(),
          "roomcode": roomCode,
          "status": "2"
        }));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);
      print("👍👍👍👍update");

      if (data["error"] == "200") {
        setState(() {
          getprofile();
        });
      } else {
        Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
      }
    } else {
      throw Exception("error");
    }
  }
}
