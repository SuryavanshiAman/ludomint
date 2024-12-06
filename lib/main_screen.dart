import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ludomint/widgets/board_widget.dart';
import 'package:ludomint/widgets/dice_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Ludo/UI/Homescreen/api/apiprofile.dart';
import 'Ludo/UI/Homescreen/gamepage.dart';
import 'Ludo/UI/Homescreen/jjellybutton.dart';
import 'Ludo/UI/constant/images.dart';
import 'Ludo/UI/constant/style.dart';
import 'constants.dart';
import 'ludo_provider.dart';
import 'main.dart';
import 'view_model/firebase_view_model.dart';

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
    super.initState();

  }

  void _triggerConfetti() {
    _confettiController!.play();
  }

  @override
  void dispose() {
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final documentID = Provider.of<FirebaseViewModel>(context);
    final docId = documentID.table.toString();
    CollectionReference ludoCollection =
    FirebaseFirestore.instance.collection('ludo');
    return Scaffold(
      body:  StreamBuilder<DocumentSnapshot>(
        stream: ludoCollection.doc(docId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: CircularProgressIndicator());
          }
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;

          return Stack(
              children: [
                _buildDynamicContent(context, data),

              ]);
        },
      )
      // Container(
      //   decoration: const BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       appBarContent(),
      //        const Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           BoardWidget(),
      //         ],
      //       ),
      //
      //
      //       userDiseDesing(),
      //
      //       oppentsTurn(),
      //
      //       Consumer<LudoProvider>(
      //         builder: (context, value, child) => value.winners.length == 1
      //             ? Container(
      //                 color: Colors.black.withOpacity(0.8),
      //                 child: Center(
      //                   child: Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: [
      //                       TextButton(
      //                         onPressed: () {
      //                           _triggerConfetti(); // Trigger confetti animation here
      //                         },
      //                         child: Column(
      //                           children: [
      //                             Text(
      //                               "Celebrate",
      //                               style: RighteousRegular.copyWith(
      //                                   fontSize: widths * 0.04,
      //                                   color: Colors.white),
      //                             ),
      //                             Align(
      //                               alignment: Alignment.center,
      //                               child: ConfettiWidget(
      //                                 confettiController: _confettiController!,
      //                                 blastDirectionality: BlastDirectionality
      //                                     .explosive, // don't specify a direction, blast randomly
      //                                 shouldLoop:
      //                                     false, // start again as soon as the animation is finished
      //                                 colors: const [
      //                                   Colors.green,
      //                                   Colors.blue,
      //                                   Colors.pink,
      //                                   Colors.orange,
      //                                   Colors.purple
      //                                 ], // manually specify the colors to be used
      //                                 createParticlePath:
      //                                     drawStar, // define a custom shape/path.
      //                               ),
      //                             ),
      //
      //                             //TOP CENTER - shoot down
      //                             Align(
      //                               alignment: Alignment.topCenter,
      //                               child: ConfettiWidget(
      //                                 confettiController: _confettiController!,
      //                                 blastDirectionality:
      //                                     BlastDirectionality.explosive,
      //                                 emissionFrequency: 0.01,
      //                                 numberOfParticles: 20,
      //                                 maxBlastForce: 100,
      //                                 minBlastForce: 80,
      //                                 gravity: 0.3,
      //                               ),
      //                             ),
      //                             Align(
      //                               alignment: Alignment.topCenter,
      //                               child: ConfettiWidget(
      //                                 confettiController: _confettiController!,
      //                                 blastDirection: pi / 2,
      //                                 maxBlastForce:
      //                                     5, // set a lower max blast force
      //                                 minBlastForce:
      //                                     2, // set a lower min blast force
      //                                 emissionFrequency: 0.05,
      //                                 numberOfParticles:
      //                                     50, // a lot of particles at once
      //                                 gravity: 1,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: heights * 0.09,
      //                       ),
      //                       Image.asset("assets/images/thankyou.gif"),
      //                       const Text("Thank you for playing 😙",
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 20),
      //                           textAlign: TextAlign.center),
      //                       Text(
      //                           "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
      //                           style: const TextStyle(
      //                               color: Colors.white, fontSize: 30),
      //                           textAlign: TextAlign.center),
      //                       const Divider(color: Colors.white),
      //                       const SizedBox(height: 20),
      //                       const Text("Refresh your browser to play again",
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 10),
      //                           textAlign: TextAlign.center),
      //                     ],
      //                   ),
      //                 ),
      //               )
      //             : const SizedBox.shrink(),
      //       ),
      //       showGif
      //           ? Container(
      //               height: heights / 5,
      //               width: widths / 2,
      //               decoration: const BoxDecoration(
      //                   image: DecorationImage(
      //                       image: AssetImage(AppAsset.imagesLetsplay),
      //                       fit: BoxFit.fill)),
      //             )
      //           : Container(),
      //     ],
      //   ),
      // ),
    );
  }

  LudoProvider ludoProvider = LudoProvider();
  Widget appBarContent() {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: heights / 10,
        width: widths / 0.1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppAsset.imagesClassicupper))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: heights / 30,
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
                            fontSize: heights * 0.025, color: Colors.yellow))),
                Center(
                    child: Text("Amount:" "₹" + widget.selectedamount,
                        style: RighteousMedium.copyWith(
                            fontSize: heights * 0.02, color: Colors.yellow))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: widths / 7,
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
                              SizedBox(height: heights * 0.02),
                              Text(
                                "Settings",
                                style: RighteousRegular.copyWith(
                                    fontSize: widths * 0.06,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: heights * 0.02),
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
                                          width: widths * 0.02,
                                        ),
                                        Text(
                                          "Sounds",
                                          style: RighteousRegular.copyWith(
                                              fontSize: widths * 0.05,
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
                                          width: widths * 0.02,
                                        ),
                                        Text(
                                          "Vibration",
                                          style: RighteousRegular.copyWith(
                                              fontSize: widths * 0.05,
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
                                    // Switch(
                                    //   value: isSwitchedtwo,
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       isSwitchedtwo = value;
                                    //     });
                                    //   },
                                    //   activeTrackColor: Colors.lightGreenAccent,
                                    //   activeColor: Colors.green,
                                    // ),
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
                                     ludoProvider.dispose();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Numberthree()));
                                  },
                                  title: "Leave Game"),
                              SizedBox(height: heights * 0.03),
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
    final ludoProvider = Provider.of<LudoProvider>(context);
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

    final List<Map<String, dynamic>> playerData = [
      player1Data,
      player2Data,
      player3Data,
      player4Data
    ];

    return
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            appBarContent(),
             const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoardWidget(),
              ],
            ),


            userDiseDesing(player1Data),

            oppentsTurn(player3Data),

            Consumer<LudoProvider>(
              builder: (context, value, child) => value.winners.length == 1
                  ? Container(
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                _triggerConfetti(); // Trigger confetti animation here
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "Celebrate",
                                    style: RighteousRegular.copyWith(
                                        fontSize: width * 0.04,
                                        color: Colors.white),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ConfettiWidget(
                                      confettiController: _confettiController!,
                                      blastDirectionality: BlastDirectionality
                                          .explosive, // don't specify a direction, blast randomly
                                      shouldLoop:
                                          false, // start again as soon as the animation is finished
                                      colors: const [
                                        Colors.green,
                                        Colors.blue,
                                        Colors.pink,
                                        Colors.orange,
                                        Colors.purple
                                      ], // manually specify the colors to be used
                                      createParticlePath:
                                          drawStar, // define a custom shape/path.
                                    ),
                                  ),

                                  //TOP CENTER - shoot down
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ConfettiWidget(
                                      confettiController: _confettiController!,
                                      blastDirectionality:
                                          BlastDirectionality.explosive,
                                      emissionFrequency: 0.01,
                                      numberOfParticles: 20,
                                      maxBlastForce: 100,
                                      minBlastForce: 80,
                                      gravity: 0.3,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ConfettiWidget(
                                      confettiController: _confettiController!,
                                      blastDirection: pi / 2,
                                      maxBlastForce:
                                          5, // set a lower max blast force
                                      minBlastForce:
                                          2, // set a lower min blast force
                                      emissionFrequency: 0.05,
                                      numberOfParticles:
                                          50, // a lot of particles at once
                                      gravity: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.09,
                            ),
                            Image.asset("assets/images/thankyou.gif"),
                            const Text("Thank you for playing 😙",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                                "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                                textAlign: TextAlign.center),
                            const Divider(color: Colors.white),
                            const SizedBox(height: 20),
                            const Text("Refresh your browser to play again",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
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

    //   Container(
    //   height: height,
    //   width: width,
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //           image: AssetImage(Assets.imagesLudoHomeBg), fit: BoxFit.fill)),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           SizedBox(
    //             width: width * 0.1,
    //           ),
    //           Container(
    //               height: height * 0.07,
    //               width: width * 0.45,
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage(Assets.ludoPrizePool),
    //                       fit: BoxFit.fill)),
    //               child: Column(
    //                 children: [
    //                   const Padding(
    //                     padding: EdgeInsets.only(left: 12.0),
    //                     child: Text(
    //                       "Prize Pool",
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 11),
    //                     ),
    //                   ),
    //                   Text(
    //                     "₹${timerProvider.amount.toString()}",
    //                     style: const TextStyle(
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 13),
    //                   ),
    //                 ],
    //               )),
    //           SizedBox(
    //             width: width * 0.14,
    //           ),
    //           SizedBox(
    //               height: height * 0.04,
    //               child: const Image(image: AssetImage(Assets.ludoSetting))),
    //           SizedBox(
    //             width: width * 0.03,
    //           )
    //         ],
    //       ),
    //       SizedBox(
    //         height: height * 0.02,
    //       ),
    //       Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.only(left: 2, right: 2),
    //           height: height * 0.033,
    //           width: width * 0.24,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               image: const DecorationImage(
    //                   image: AssetImage(Assets.ludoLabelSection),
    //                   fit: BoxFit.fill)),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               const Icon(
    //                 Icons.watch_later_outlined,
    //                 color: white,
    //                 size: 19,
    //               ),
    //               Text(timerProvider.timerText.toString(),
    //                   style: const TextStyle(
    //                       color: green,
    //                       fontFamily: "digital",
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 20)),
    //             ],
    //           )),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(
    //               alignment: Alignment.center,
    //               height: height * 0.03,
    //               width: width * 0.23,
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage(Assets.ludoLabelSection),
    //                       fit: BoxFit.fill)),
    //               child: Text(player1Data['name'].toString(),
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 12))),
    //           Image(
    //             image: const AssetImage(
    //               Assets.ludoInfo,
    //             ),
    //             height: height * 0.03,
    //             width: width * 0.08,
    //             fit: BoxFit.fill,
    //           ),
    //           const Spacer(),
    //           ludoProvider.playerQuantity != 2
    //               ? Image(
    //             image: const AssetImage(
    //               Assets.ludoInfo,
    //             ),
    //             height: height * 0.03,
    //             width: width * 0.08,
    //             fit: BoxFit.fill,
    //           )
    //               : Container(),
    //           ludoProvider.playerQuantity != 2
    //               ? Container(
    //               alignment: Alignment.center,
    //               height: height * 0.03,
    //               width: width * 0.23,
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage(Assets.ludoLabelSectionTwo),
    //                       fit: BoxFit.fill)),
    //               child: Text(player2Data['name'] ?? 'No Name',
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 12)))
    //               : Container(),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(6.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //
    //             userDiceDesign(playerData),
    //             const Spacer(),
    //             ludoProvider.playerQuantity != 2
    //                 ? opponentsOneTurn(playerData)
    //                 : Container(),
    //
    //           ],
    //         ),
    //       ),
    //       BoardWidget(playerData: playerData),
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //
    //
    //             ludoProvider.playerQuantity != 2
    //                 ? opponentsTwoTurn(playerData)
    //                 : Container(),
    //             const Spacer(),
    //             opponentsThreeTurn(playerData),
    //           ],
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           ludoProvider.playerQuantity != 2
    //               ? Container(
    //               alignment: Alignment.center,
    //               height: height * 0.03,
    //               width: width * 0.23,
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage(Assets.ludoLabelSection),
    //                       fit: BoxFit.fill)),
    //               child: Text(player4Data['name'] ?? 'No Name',
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 12)))
    //               : Container(),
    //           ludoProvider.playerQuantity != 2
    //               ? Image(
    //             image: const AssetImage(
    //               Assets.ludoInfo,
    //             ),
    //             height: height * 0.03,
    //             width: width * 0.08,
    //             fit: BoxFit.fill,
    //           )
    //               : Container(),
    //           const Spacer(),
    //           Image(
    //             image: const AssetImage(
    //               Assets.ludoInfo,
    //             ),
    //             height: height * 0.03,
    //             width: width * 0.08,
    //             fit: BoxFit.fill,
    //           ),
    //           Container(
    //               alignment: Alignment.center,
    //               height: height * 0.03,
    //               width: width * 0.23,
    //               decoration: const BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage(Assets.ludoLabelSectionTwo),
    //                       fit: BoxFit.fill)),
    //               child: Text(player3Data['name'] ?? 'No Name',
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 12))),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
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
                        ?  DiceWidget()
                        : const SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      children: [
                        Text(
                            player2Data['name'].toString(),
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
                        Text(
                          // 'Score: ${value.totalPoints}',
                          'Score:10',
                          style: const TextStyle(
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
}
