import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../audio.dart';
import '../../constant/Launcher.dart';
import '../../constant/images.dart';
import '../../constant/utilll.dart';

// ignore: must_be_immutable
class insidePlay extends StatefulWidget {
  Map<String, dynamic> gamedata;
  final String? alreadyplayed;
  final bool start;
  insidePlay({
    required this.gamedata,
    this.alreadyplayed,
    required this.start,
  });

  @override
  State<insidePlay> createState() => _insidePlayState();
}

class _insidePlayState extends State<insidePlay> {
  final _formKey = GlobalKey<FormState>();

  final roomcodecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  bool canceldisable = false;
  bool cancellation = false;
  bool sound = true;
  Stream<int>? secondsStream;
  String code = '';
  int tim = 0;
  bool times = false;
  @override
  void initState() {
    Audio.bgmusic();
    code = widget.gamedata['roomcode'];
    code == '' ? canceldisable = false : canceldisable = true;
    wondisplay();
    // TODO: implement initState
    super.initState();
  }

  wondisplay() {
    print('sssssssssssssssss');
    print(widget.gamedata['datetime'].toString());
    DateTime startTime =
    DateTime.parse('20' + widget.gamedata['datetime'].toString());

    // final  startTime=DateTime.parse(widget.gamedata['roomcode'].toString());
    DateTime endTime = DateTime.now();
    Duration difference = endTime.difference(startTime);
    tim = difference.inSeconds;

    if (tim < 360) {
      Future.delayed(Duration(seconds: 360 - tim), () {
        setState(() {
          times = true;
        });
      });
    } else {
      setState(() {
        times = true;
      });
    }
  }

  @override
  void dispose() {
    // Close the stream when the widget is disposed to release resources
    secondsStream!.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  // viewprofile();
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  AppAsset.buttonBtnClose2,
                  height: 28,
                  width: 60,
                )),
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0,
            title: Text(
              widget.gamedata['type'] ?? '',
              style: GoogleFonts.aclonica(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                //  height: height * 0.85,
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Color(0xffdddddd))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: height * 0.17,
                          width: width * 0.90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          widget.gamedata['username'] == ''
                                              ? 'wait..'
                                              : widget.gamedata['username']
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                              wordSpacing: 8)),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      widget.gamedata['userimage'] == ''
                                          ? CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset(AppAsset.imagesAvatar0),
                                      )
                                          : CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        child: Image.network(
                                            widget.gamedata['userimage']),
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      "Vs",
                                      style: GoogleFonts.sedgwickAveDisplay(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        // widget.gamedata['opponentname'] == ''
                                        //     ? "wait..."
                                        //     :
                                          widget.gamedata['opponentname']
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                              wordSpacing: 8)),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      widget.gamedata['opponentimage'] == ""
                                          ? CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset(AppAsset.imagesAvatar0),
                                      )
                                          : CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        child: Image.network(
                                            widget.gamedata['opponentimage']),
                                      )
                                    ],
                                  ),
                                  // Sedgwick Ave Display
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Playing for",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04,
                                          color: Colors.black)),
                                  Icon(
                                    Icons.monetization_on_rounded,
                                    color: Colors.yellow.shade800,
                                  ),
                                  Text(
                                    widget.gamedata['amount'] ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04,
                                        color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    // Card(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         side: BorderSide(color: Color(0xffdddddd))),
                    //     child: widget.start
                    //         ? Container(
                    //         padding: EdgeInsets.all(12),
                    //         //height: height * 0.25,
                    //         width: width * 0.90,
                    //         child: code == ''
                    //             ? Column(
                    //           mainAxisAlignment:
                    //           MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Text(
                    //               "Room Code",
                    //               style: TextStyle(
                    //                   fontSize: width * 0.05,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.black),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                   horizontal: width * 0.20),
                    //               child: Form(
                    //                 key: _formKey,
                    //                 child: TextFormField(
                    //                   validator: (value) {
                    //                     if (value == null ||
                    //                         value.isEmpty) {
                    //                       return 'Please enter some amount';
                    //                     }
                    //                     return null;
                    //                   },
                    //                   style: TextStyle(
                    //                       fontSize: height * 0.018,
                    //                       color: Colors.black),
                    //                   controller: roomcodecontroller,
                    //                   maxLength: 8,
                    //                   decoration: InputDecoration(
                    //                     contentPadding:
                    //                     EdgeInsets.symmetric(
                    //                         vertical: height / 50,
                    //                         horizontal: width / 50),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                         color: Colors.grey,
                    //                       ),
                    //                     ),
                    //                     focusedBorder:
                    //                     const OutlineInputBorder(
                    //                       borderRadius: BorderRadius.all(
                    //                           Radius.circular(12.0)),
                    //                       borderSide: BorderSide(
                    //                           color: Colors.grey,
                    //                           width: 2),
                    //                     ),
                    //                     border: const OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                         color: Colors.grey,
                    //                       ),
                    //                       borderRadius: BorderRadius.all(
                    //                         Radius.circular(12.0),
                    //                       ),
                    //                     ),
                    //                     focusedErrorBorder:
                    //                     const OutlineInputBorder(
                    //                       borderRadius: BorderRadius.all(
                    //                           Radius.circular(12.0)),
                    //                       borderSide: BorderSide(
                    //                         color: Colors.grey,
                    //                       ),
                    //                     ),
                    //                     errorBorder:
                    //                     const OutlineInputBorder(
                    //                       borderRadius: BorderRadius.all(
                    //                           Radius.circular(12.0)),
                    //                       borderSide: BorderSide(
                    //                           color: Color(0xFFF65054)),
                    //                     ),
                    //                     hintText: "Enter code",
                    //                     hintStyle: TextStyle(
                    //                         fontSize: width * 0.03,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   keyboardType: TextInputType.number,
                    //                 ),
                    //               ),
                    //             ),
                    //             Text(
                    //               "User Name",
                    //               style: TextStyle(
                    //                   fontSize: width * 0.05,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.black),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                   horizontal: width * 0.20),
                    //               child: TextFormField(
                    //                 style: TextStyle(
                    //                     fontSize: height * 0.018,
                    //                     color: Colors.black),
                    //                 controller: usernamecontroller,
                    //                 // maxLength: 8,
                    //                 decoration: InputDecoration(
                    //                   contentPadding:
                    //                   EdgeInsets.symmetric(
                    //                       vertical: height / 50,
                    //                       horizontal: width / 50),
                    //                   enabledBorder: OutlineInputBorder(
                    //                     borderSide: BorderSide(
                    //                       color: Colors.grey,
                    //                     ),
                    //                   ),
                    //                   focusedBorder:
                    //                   const OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(12.0)),
                    //                     borderSide: BorderSide(
                    //                         color: Colors.grey, width: 2),
                    //                   ),
                    //                   border: const OutlineInputBorder(
                    //                     borderSide: BorderSide(
                    //                       color: Colors.grey,
                    //                     ),
                    //                     borderRadius: BorderRadius.all(
                    //                       Radius.circular(12.0),
                    //                     ),
                    //                   ),
                    //                   focusedErrorBorder:
                    //                   const OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(12.0)),
                    //                     borderSide: BorderSide(
                    //                       color: Colors.grey,
                    //                     ),
                    //                   ),
                    //                   errorBorder:
                    //                   const OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(12.0)),
                    //                     borderSide: BorderSide(
                    //                         color: Color(0xFFF65054)),
                    //                   ),
                    //                   hintText: " Enter User name",
                    //                   hintStyle: TextStyle(
                    //                       fontSize: width * 0.03,
                    //                       color: Colors.black,
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //                 keyboardType: TextInputType.name,
                    //               ),
                    //             ),
                    //             ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                 minimumSize: Size(30, 30),
                    //                 backgroundColor: Colors.green,
                    //               ),
                    //               onPressed: () {
                    //                 setState(() {
                    //                   canceldisable = true;
                    //                   code = roomcodecontroller.text;
                    //                 });
                    //
                    //                 // roomcodeupdate(
                    //                 //     roomcodecontroller.text,
                    //                 //     usernamecontroller.text);
                    //                 // copyToClipboard(
                    //                 //     widget.gamedata['roomcode'], context);
                    //               },
                    //               child: Text(
                    //                 "Set Room Code",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: width * 0.04,
                    //                     color: Colors.white),
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //             :
                    //         StreamBuilder<DocumentSnapshot>(
                    //             stream: FirebaseFirestore.instance
                    //                 .collection('mayagames')
                    //                 .doc(widget.gamedata['doc_id'])
                    //                 .snapshots(),
                    //             builder: (context, snapshot) {
                    //               if (snapshot.connectionState ==
                    //                   ConnectionState.waiting) {
                    //                 return Container();
                    //               } else if (snapshot.hasError) {
                    //                 return Text('Error: ${snapshot.error}');
                    //               } else if (!snapshot.hasData ||
                    //                   !snapshot.data!.exists) {
                    //                 disable = false;
                    //
                    //                 Navigator.pop(context);
                    //                 return const Text('Document not found');
                    //               }
                    //               final room =
                    //               snapshot.data!.get('roomcode');
                    //               return Container(
                    //                   height: height * 0.07,
                    //                   width: width * 0.90,
                    //                   child: Row(
                    //                     mainAxisAlignment:
                    //                     MainAxisAlignment.spaceEvenly,
                    //                     children: [
                    //                       Text(
                    //                         "Room Code",
                    //                         style: TextStyle(
                    //                             fontSize: width * 0.04,
                    //                             fontWeight: FontWeight.bold,
                    //                             color: Colors.black),
                    //                       ),
                    //                       Text(
                    //                         room == '' ? "Wait !!" : room,
                    //                         style: TextStyle(
                    //                             fontSize: width * 0.04,
                    //                             fontWeight: FontWeight.bold,
                    //                             color: Colors.black),
                    //                       ),
                    //                       ElevatedButton(
                    //                         style: ElevatedButton.styleFrom(
                    //                           minimumSize: Size(30, 30),
                    //                           backgroundColor: Colors.grey,
                    //                         ),
                    //                         onPressed: () {
                    //                           setState(() {
                    //                             code = '';
                    //                           });
                    //                           // copyToClipboard(
                    //                           //     widget.gamedata['roomcode'], context);
                    //                         },
                    //                         child: Icon(
                    //                           Icons.edit,
                    //                           color: Colors.white,
                    //                         ),
                    //                       ),
                    //                       ElevatedButton(
                    //                         style: ElevatedButton.styleFrom(
                    //                           minimumSize: Size(30, 30),
                    //                           backgroundColor:
                    //                           Color(0xff00d25b),
                    //                         ),
                    //                         onPressed: () {
                    //                           copyToClipboard(
                    //                               code, context);
                    //                           setState(() {
                    //                             canceldisable = true;
                    //                           });
                    //                         },
                    //                         child: Icon(
                    //                           Icons.copy,
                    //                           color: Colors.white,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ));
                    //             }))
                    //
                    //         :
                    //     StreamBuilder<DocumentSnapshot>(
                    //         stream: FirebaseFirestore.instance
                    //             .collection('mayagames')
                    //             .doc(widget.gamedata['doc_id'])
                    //             .snapshots(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.connectionState ==
                    //               ConnectionState.waiting) {
                    //             return Container();
                    //           } else if (snapshot.hasError) {
                    //             return Text('Error: ${snapshot.error}');
                    //           } else if (!snapshot.hasData ||
                    //               !snapshot.data!.exists) {
                    //             disable = false;
                    //
                    //             Navigator.pop(context);
                    //             return const Text('Document not found');
                    //           }
                    //           final room = snapshot.data!.get('roomcode');
                    //           return Container(
                    //               height: height * 0.07,
                    //               width: width * 0.90,
                    //               child: Row(
                    //                 mainAxisAlignment:
                    //                 MainAxisAlignment.spaceEvenly,
                    //                 children: [
                    //                   Text(
                    //                     "Room Code",
                    //                     style: TextStyle(
                    //                         fontSize: width * 0.04,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.black),
                    //                   ),
                    //                   Text(
                    //                     room == '' ? "Wait !!" : room,
                    //                     style: TextStyle(
                    //                         fontSize: width * 0.04,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.black),
                    //                   ),
                    //                   ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                       minimumSize: Size(30, 30),
                    //                       backgroundColor: Color(0xff00d25b),
                    //                     ),
                    //                     onPressed: () {
                    //                       copyToClipboard(room, context);
                    //                       setState(() {
                    //                         canceldisable = true;
                    //                       });
                    //                     },
                    //                     child: Text(
                    //                       "Copy Code",
                    //                       style: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: width * 0.04,
                    //                           color: Colors.white),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ));
                    //         })),
                    SizedBox(height: height * 0.02),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Match Status",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              color: const Color(0xff00d25b),
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: height * 0.02),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Color(0xffdddddd))),
                      child: Container(
                        // height: height * 0.23,
                        width: width * 0.90,
                        // color: Colors.yellowAccent,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "After completion of your game, select the \n status of the game and post your screenshot\n below.\n Below options will able to upload after 5 of joined the game",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            // if(cancellation==true)
                            canceldisable == false
                                ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(30, 40),
                                    side: const BorderSide(color: Colors.black),
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  Audio.audioPlayer.stop();
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) =>
                                  //         cancel(gamedata: widget.gamedata));
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.black),
                                ))
                                : times
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(30, 40),
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      Audio.audioPlayer.stop();
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (context) => lost(
                                      //         gamedata: widget.gamedata));
                                    },
                                    child: Text(
                                      "I have Completed my game",
                                      style: TextStyle(
                                          fontSize: width * 0.04,
                                          color: Colors.white),
                                    )),
                              ],
                            )
                                : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(30, 40),
                                    backgroundColor: Colors.grey),
                                onPressed: () {
                                  Utils.flushBarsuccessMessage(
                                      "Wait for " +
                                          (360 - tim).toString() +
                                          ' seconds',
                                      context,
                                      Colors.white);
                                },
                                child: Text(
                                  "Complete your game",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ),
                    // times?Container():
                    // Container(
                    //   child: StreamBuilder<int>(
                    //     stream: secondsStream,
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         return Text((360-tim).toString());
                    //       } else {
                    //         return Text('Waiting for data...');
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Container(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                Launcher.openwhatsapp(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              child: Container(
                height: height * 0.15,
                width: width * 0.15,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAsset.imagesWhatsapp))),
              ),
            ),
          ),
        ));
  }

  // roomcodeupdate(String roomcodeup, String usernamecontroller) async {
  //   print(roomcodeup);
  //   print(usernamecontroller);
  //   print('nnnnnnnnnnnn');
  //   print(widget.gamedata['doc_id']);
  //   final res = await http.get(Uri.parse(
  //       Apiconst.updateroomcode+'roomcode=$roomcodeup&lkusername=$usernamecontroller&docid='+widget.gamedata['doc_id']));
  //   //     .timeout(const Duration(
  //   //     seconds: 5), onTimeout: () {
  //   //   return InternetSlowMsg(context);
  //   // });
  //   // .onError((error, stackTrace) => InternetSlowMsg(context));
  //   final data = jsonDecode(res.body);
  //   print(data);
  //   if (data['status'] == '200') {
  //     viewprofile();
  //     Utils.flushBarsuccessMessage(data['msg'], context, Colors.white);
  //   } else {
  //     Utils.flushBarErrorMessage(data['msg'], context, Colors.white);
  //   }
  // }
}