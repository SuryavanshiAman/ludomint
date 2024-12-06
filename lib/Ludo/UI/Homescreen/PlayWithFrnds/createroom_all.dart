// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../audio.dart';
import '../../constant/Launcher.dart';
import '../../constant/images.dart';
import '../../constant/modal/alreadyrun.dart';
import '../../constant/style.dart';
import 'insidePlay.dart';


bool disable = false;

class classicTwo extends StatefulWidget {
  const classicTwo({super.key});

  @override
  State<classicTwo> createState() => _classicTwoState();
}

class _classicTwoState extends State<classicTwo> {
  bool turnon = false;
  bool wait = false;
  bool _loading = false;
  bool loading = false;
  bool deletloading = false;
  bool sound = true;

  String? selectedValue;

  List<Map<String, dynamic>> dropdownItems = [
    {'name': 'CLASSIC', 'icon': Icons.sports_esports_outlined},
    {'name': 'QUICK', 'icon': Icons.gamepad_sharp},
    {'name': 'POPULAR', 'icon': Icons.star},
  ];


  List<Alreadyrunning> alrun = [];


  @override
  void initState() {
    // youtubelink();
    // viewprofile();
    // fetchLauncherApi();
    // getShortrules();
    super.initState();
  }



  final _formKey = GlobalKey<FormState>();


  TextEditingController amount = TextEditingController();
  int _selectedItemIndex = -1;
  bool _isButtonEnabled = false;
  List<int> dataItems = [50, 100, 150, 200];

  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10;
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString();
      _isButtonEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(

          // appBar: AppBar(
          //   leading: IconButton(
          //       onPressed: () async {
          //         // viewprofile();
          //         Navigator.pop(context);
          //       },
          //       icon: Image.asset(
          //         AppAsset.buttonBtnClose2,
          //         height: 70,
          //         width: 70,
          //       )),
          //   automaticallyImplyLeading: false,
          //   centerTitle: true,
          //   elevation: 0,
          //   title: Text(
          //     "Classic Games",
          //     style: GoogleFonts.aclonica(
          //       textStyle: const TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          //   actions: [
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         IconButton(
          //             onPressed: () async {
          //               setState(() {
          //                 // viewprofile();
          //                 Alreadyrunning;
          //               });
          //             },
          //             icon: Image.asset(
          //               AppAsset.imagesBtnRefresh,
          //               height: 100,
          //               width: 100,
          //             )),
          //         // Text(
          //         //   // map == null ? balence : wallet + '/-',
          //         //   style: const TextStyle(
          //         //     fontSize: 10,
          //         //     fontWeight: FontWeight.bold,
          //         //     color: Colors.white,
          //         //   ),
          //         // ),
          //         const SizedBox(
          //           width: 20,
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          body: Container(
            height: height,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  createbattle(),
                   ListView.builder(
                     itemCount: 7,
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (BuildContext, int index){
                     return  Card(
                       elevation: 5,
                       shape: RoundedRectangleBorder(
                         side: const BorderSide(color: Color(0xff00209d)),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       color: Colors.black.withOpacity(0.5),
                       child: Container(
                         // height: height * 0.13,
                         padding: const EdgeInsets.all(6),
                         // color: Colors.pink,
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Challenges From",
                                   style: RighteousMedium.copyWith(
                                       fontSize: width * 0.04,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white),
                                 ),
                                 SizedBox(
                                   width: width * 0.02,
                                 ),
                                 Text(
                                   // gamedata['username'] .toUpperCase()?? ''.toUpperCase(),
                                     "Username",
                                     style:  RighteousMedium.copyWith(
                                         fontSize: width * 0.03,
                                         fontWeight: FontWeight.w900,
                                         color: Colors.red.shade900,
                                         wordSpacing: 8
                                     )
                                 ),
                                 // const Spacer(),
                                 // Container(
                                 //     height: height * 0.02,
                                 //     width: width * 0.15,
                                 //     decoration: BoxDecoration(
                                 //         borderRadius: BorderRadius.circular(6),
                                 //         color: Colors.indigo.shade900),
                                 //     child: Center(
                                 //         child: Text(
                                 //           // gamedata['type'] ?? '',
                                 //           "Type",
                                 //           style:  RighteousMedium.copyWith(
                                 //               fontSize: width * 0.03,
                                 //               color: Colors.white,
                                 //               fontWeight: FontWeight.bold),
                                 //         )))
                               ],
                             ),
                             Divider(
                               color: Colors.grey.shade300,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "Entry Fee",
                                       style:  RighteousMedium.copyWith(
                                           fontSize: width * 0.04, color: Colors.white),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Icon(
                                           Icons.monetization_on_rounded,
                                           color: Colors.yellow.shade900,
                                         ),
                                         Text(
                                           // gamedata['amount'] ?? '',
                                           "Amount",
                                           style: RighteousMedium.copyWith(
                                               fontSize: width * 0.03,
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold),
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                                 disable == false
                                     ? ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                         minimumSize: const Size(30, 30),
                                         backgroundColor: const Color(0xff01ad79)),
                                     onPressed:loading==true?(){}:
                                         () {
                                       // joincontest(gamedata);
                                     },
                                     child:
                                     loading==true ? const Center(
                                         child: CircularProgressIndicator(color: Colors.white,)
                                     ):
                                     Text(
                                       "Play",
                                       style: RighteousMedium.copyWith(
                                           fontSize: width * 0.04,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ))
                                     : Container(),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "Prize",
                                       style: RighteousMedium.copyWith(
                                           fontSize: width * 0.04, color: Colors.white),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Icon(
                                           Icons.monetization_on_rounded,
                                           color: Colors.yellow.shade900,
                                         ),
                                         Text(
                                           // gamedata['winamount'] ?? '',
                                           "winamount",
                                           style: RighteousMedium.copyWith(
                                               fontSize: width * 0.03,
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold),
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),
                     );
                   }),


                  // StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('mayagames').snapshots(),
                  //   builder: (BuildContext context,
                  //       AsyncSnapshot<QuerySnapshot> snapshot) {
                  //
                  //     if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     }
                  //
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //     if (!snapshot.hasData) {
                  //       return Center(
                  //           child: Text('No data available',
                  //               style: TextStyle(
                  //                   fontSize: width * 0.07,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.black)));
                  //     }
                  //     alrun.clear();
                  //     return ListView(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         children:
                  //         snapshot.data!.docs.map((DocumentSnapshot document) {
                  //           Map<String, dynamic> student =
                  //           document.data() as Map<String, dynamic>;
                  //           if (student['user_id'] == userid &&
                  //               int.parse(student['status'].toString()) >= 1 &&
                  //               int.parse(student['status'].toString()) <= 2 ||
                  //               student['oppontant_id'] == userid &&
                  //                   int.parse(student['status'].toString()) >= 2 &&
                  //                   int.parse(student['status'].toString()) <= 2) {
                  //             print('testtttt');
                  //             disable = true;
                  //           }else{
                  //             disable = false;
                  //
                  //           }
                  //
                  //           if (int.parse(student['status'].toString()) >= 2 &&
                  //               int.parse(student['status'].toString()) <= 3) {
                  //             alrun.add(Alreadyrunning(
                  //                 doc_id: student['doc_id'],
                  //                 userimage: student['userimage'],
                  //                 username: student['username'],
                  //                 amount: student['amount'],
                  //                 winamount: student['winamount'],
                  //                 opponentimage: student['opponentimage'],
                  //                 opponentname: student['opponentname'],
                  //                 type: student['type']));
                  //           }
                  //           return Column(
                  //             children: [
                  //               if (student['status'].toString() == '5')
                  //                 Container()
                  //               else if (student['user_id'] == userid &&
                  //                   int.parse(student['status']) == 2)
                  //                 opponentloadedcard(gamedata: student)
                  //               else if (student['user_id'] == userid &&
                  //                     int.parse(student['status']) >= 2 &&
                  //                     int.parse(student['status']) <= 4 ||
                  //                     student['oppontant_id'] == userid &&
                  //                         int.parse(student['status']) >= 2 &&
                  //                         int.parse(student['status']) <= 4)
                  //                   alreadyinprogress(gamedata: student)
                  //                 else if (student['user_id'] == userid &&
                  //                       int.parse(student['status']) == 1)
                  //                     Newloadercard(gamedata: student)
                  //                   else if (student['user_id'] != userid ||
                  //                         student['oppontant_id'] != userid)
                  //                       if (int.parse(student['status']) == 1)
                  //                         Newplaycard(gamedata: student)
                  //             ],
                  //           );
                  //
                  //           // Newplaycard(gamedata: student);
                  //         }).toList());
                  //   },
                  // ),
                  runningbattles(),
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                // Launcher.linkurlnew();
                Launcher.openwhatsapp(context);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0),),
              backgroundColor: Colors.white,
              child: Container(
                height: height * 0.15,
                width: width * 0.15,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAsset.imagesWhatsapp),fit: BoxFit.fill)),
              ),
            ),
          ),
        ));
  }

  ///play button card
  Widget Newplaycard({required Map<String, dynamic> gamedata}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff00209d)),
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey.shade100,
      child: Container(
        // height: height * 0.13,
        padding: const EdgeInsets.all(6),
        // color: Colors.pink,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Challenges From",
                  style: RighteousMedium.copyWith(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                    gamedata['username'] .toUpperCase()?? ''.toUpperCase(),
                    style: RighteousMedium.copyWith(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w900,
                        color: Colors.red.shade900,
                        wordSpacing: 8
                    )
                ),
                const Spacer(),
                Container(
                    height: height * 0.02,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.indigo.shade900),
                    child: Center(
                        child: Text(
                          gamedata['type'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )))
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Entry Fee",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on_rounded,
                          color: Colors.yellow.shade900,
                        ),
                        Text(
                          gamedata['amount'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                disable == false
                    ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(30, 30),
                        backgroundColor: const Color(0xff01ad79)),
                    onPressed:loading==true?(){}:
                        () {
                      // joincontest(gamedata);
                    },
                    child:
                    loading==true ? const Center(
                        child: CircularProgressIndicator(color: Colors.white,)
                    ):
                    Text(
                      "Play",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
                    : Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Prize",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on_rounded,
                          color: Colors.yellow.shade900,
                        ),
                        Text(
                          gamedata['winamount'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///loader card
  Widget Newloadercard({required Map<String, dynamic> gamedata}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xff00209d)),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.grey.shade100,
        child: Container(
          //  height: height * 0.15,
          padding: const EdgeInsets.all(6),
          // color: Colors.pink,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Challenges From",
                    style: RighteousMedium.copyWith(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                      gamedata['username'].toUpperCase() ?? "",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.red.shade900,
                          wordSpacing: 8
                      )
                  ),
                  const Spacer(),

                  ///delete button
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: SizedBox(
                              height: height * 0.25,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        ),
                                      )),
                                  Text(
                                    "Are you sure",
                                    style: RighteousMedium.copyWith(
                                        fontSize: width * 0.05,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "delete",
                                    style: RighteousMedium.copyWith(
                                        fontSize: width * 0.05,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),

                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(200, 40),
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        // cancelledchalange(
                                        //   userid: gamedata['user_id'],
                                        //   docid: gamedata['doc_id'],
                                        //   amount: gamedata['amount'],
                                        // );
                                      },
                                      child: Text(
                                        "Submit",
                                        style: RighteousMedium.copyWith(
                                            fontSize: width * 0.04,
                                            color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    child: SizedBox(
                        height: height * 0.03,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Container(
                      height: height * 0.02,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.indigo.shade900),
                      child: Center(
                          child: Text(
                            gamedata['type'] ?? '',
                            style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entry Fee",
                        style: RighteousMedium.copyWith(
                            fontSize: width * 0.04, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade900,
                          ),
                          Text(
                            gamedata['amount'] ?? "",
                            style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),

                  ///loader
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAsset.imagesLoadernew),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prize",
                        style: RighteousMedium.copyWith(
                            fontSize: width * 0.04, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade900,
                          ),
                          Text(
                            gamedata['winamount'] ?? "",
                            style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  ///oponent loader start reject
  Widget opponentloadedcard({required Map<String, dynamic> gamedata}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xff00209d)),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.grey.shade100,
        child: Container(
          // height: height * 0.15,
          padding: const EdgeInsets.all(6),
          // color: Colors.pink,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Challenges From",
                    style: RighteousMedium.copyWith(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                      gamedata['username'].toUpperCase() ?? "",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.red.shade900,
                          wordSpacing: 8
                      )
                  ),

                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Audio.sound();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => insidePlay(
                                      gamedata: gamedata,
                                      alreadyplayed: gamedata['roomcode'],start:true)));
                        },
                        child: Container(
                            height: height * 0.03,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.green),
                            child: Center(
                                child: Text(
                                  "Start",
                                  style: RighteousMedium.copyWith(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entry Fee",
                        style: RighteousMedium.copyWith(
                            fontSize: width * 0.04, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade900,
                          ),
                          Text(
                            gamedata['amount'] ?? "",
                            style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      gamedata['opponentimage'] == ""
                          ? CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(AppAsset.imagesAvatar0),
                      )
                          : CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.transparent,
                        child: Image.network(gamedata['opponentimage']),
                      ),
                      Text(
                          gamedata['opponentname'] == ""
                              ? ''
                              : gamedata['opponentname'].toUpperCase(),
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w900,
                              color: Colors.red.shade900,
                              wordSpacing: 8
                          )
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prize",
                        style: RighteousMedium.copyWith(
                            fontSize: width * 0.04, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade900,
                          ),
                          Text(
                            gamedata['winamount'] ?? "",
                            style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  ///already played button
  Widget alreadyinprogress({required Map<String, dynamic> gamedata})   {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff00209d)),
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey.shade100,
      child: Container(
        // height: height * 0.15,
        padding: const EdgeInsets.all(6),
        // color: Colors.pink,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Challenges From",
                  style: RighteousMedium.copyWith(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                    gamedata['username'].toUpperCase() ?? '',
                    style: RighteousMedium.copyWith(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w900,
                        color: Colors.red.shade900,
                        wordSpacing: 8
                    )
                ),
                const Spacer(),
                Container(
                    height: height * 0.02,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.indigo.shade900),
                    child: Center(
                        child: Text(
                          gamedata['type'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )))
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Entry Fee",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on_rounded,
                          color: Colors.yellow.shade900,
                        ),
                        Text(
                          gamedata['amount'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(30, 30),
                            backgroundColor: const Color(0xff01ad79)),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          //     insidePlay(gamedata: gamedata,
                          //         alreadyplayed: gamedata['roomcode'],start: gamedata['user_id'].toString()=='' && gamedata['roomcode']==userid.toString()?true:false))
                          // );
                          // joincontest(gamedata);
                        },
                        child: Text(
                          "Join",
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Text(
                      "Already Played Battle",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Prize",
                      style: RighteousMedium.copyWith(
                          fontSize: width * 0.04, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on_rounded,
                          color: Colors.yellow.shade900,
                        ),
                        Text(
                          gamedata['winamount'] ?? '',
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget runningbattles() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return alrun.length == 0
        ? Container()
        : ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            Text(
              "Running Battles",
              style: RighteousMedium.copyWith(
                  fontSize: width * 0.05,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            // InkWell(
            //   onTap: () async {
            //     final url = Ludoyoyubelin.toString();
            //     if (await canLaunch(url)) {
            //       await launch(url,
            //           forceWebView: true, enableJavaScript: true);
            //     } else {
            //       throw 'Could not launch $url';
            //     }
            //   },
            //   child: Container(
            //     height: height * 0.03,
            //     width: width * 0.20,
            //     color: Colors.indigo,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Center(
            //             child: Text(
            //               "YOUTUBE",
            //               style: TextStyle(
            //                   fontSize: width * 0.03,
            //                   color: Colors.lightBlue,
            //                   fontWeight: FontWeight.bold),
            //             )),
            //         Container(
            //             height: height * 0.05,
            //             width: width * 0.05,
            //             decoration: const BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage(youtube))))
            //       ],
            //     ),
            //   ),
            // ),
            TextButton(
              child: Text("RULES",
                  style: RighteousMedium.copyWith(
                      fontSize: width * 0.03,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const rules_ludo()));
              },
            ),
            const Icon(
              Icons.info_outline,
              color: Colors.grey,
            )
          ],
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: alrun.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red.shade900),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.grey.shade100,
                child: Container(
                  height: height * 0.17,
                  width: width * 0.90,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Win Amount : ${alrun[index].winamount}',
                              style: RighteousMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04,
                                  color: Colors.black)),
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade800,
                          ),


                          Container(
                            padding: const EdgeInsets.all(3),
                            color: Colors.green,
                            child: Text(
                              'Running Battles',
                              style: RighteousMedium.copyWith(
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                wordSpacing: 4,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(alrun[index].username.toUpperCase(),
                                  style: RighteousMedium.copyWith(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red.shade900,
                                      wordSpacing: 8
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              alrun[index].userimage == ""
                                  ? CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(AppAsset.imagesAvatar0),
                              )
                                  : CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                    alrun[index].userimage),
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
                                // gamedata['opponentname'] == ''
                                //     ? "wait..."
                                //     :
                                  alrun[index].opponentname.toUpperCase(),
                                  style: RighteousMedium.copyWith(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red.shade900,
                                      wordSpacing: 8
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              alrun[index].opponentimage != ""
                                  ? CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                    alrun[index].opponentimage),
                              )
                                  : CircleAvatar(
                                radius: 19,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(AppAsset.imagesAvatar0),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Playing for",
                              style: RighteousMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04,
                                  color: Colors.black)),
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.yellow.shade800,
                          ),
                          Text(
                            alrun[index].amount,
                            style: RighteousMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget createbattle() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          "Create a Battle!",
          style: RighteousMedium.copyWith(
              fontSize: width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),

        SizedBox(
          height: height * 0.02,
        ),
        // _selectedItem == ""
        //     ? Container()
        //   :
        Form(
          key: _formKey,
          child: TextFormField(
            controller: amount,
            onChanged: (text) {
              _handleTextChange();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some amount';
              }
              return null;
            },
            style: RighteousMedium.copyWith(fontSize: height * 0.018, color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xFFF65054)),
              ),
              prefixIcon: Container(
                width: width * 0.17,
                decoration: BoxDecoration(
                    color: const Color(0xff003441),
                    borderRadius: BorderRadius.circular(7)),
                child: Center(
                    child: Text("ONLINE",
                        style: RighteousMedium.copyWith(
                            fontSize: width * 0.03, color: Colors.white))),
              ),
              suffixIcon: _loading == false
                  ? InkWell(
                onTap: () {
                  // viewprofile();
                  if(int.parse(amount.text)<50) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(
                          'Amount Should be greter than 50')),
                    );
                  }
                  else if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    // disable == false
                    //     ? addchallengenew(amount.text)
                    //     :
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Already Joined Contest')),
                    );
                  }
                },
                child: Container(
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      color: const Color(0xff003441),
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                      child: Text("Set",
                          style: RighteousMedium.copyWith(
                              fontSize: width * 0.05,
                              color: Colors.white))),
                ),
              )
                  : Container(
                width: width * 0.15,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(7)),
                child: const Center(
                  child: CircularProgressIndicator(),
                  // Text("Loading",
                  //     style: TextStyle(
                  //         fontSize: width * 0.03,
                  //         color: Colors.white))
                ),
              ),
              hintText: "  Enter amount",
              hintStyle: RighteousMedium.copyWith(
                  fontSize: width * 0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        // _selectedItem == ""
        //     ? Container()
        //  :
        GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: height * 0.04),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (height * 0.09) / (height * 0.05)),
            itemCount: dataItems.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  _handleListItemSelected(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: _selectedItemIndex == dataItems[index]
                          ? Colors.green
                          : Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('₹  ${dataItems[index]}',
                        style: RighteousMedium.copyWith(
                          fontSize: 13,
                          color: Colors.white,
                        )),
                  ),
                ),
              );
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            Text(
              "Open Battles",
              style: RighteousMedium.copyWith(
                  fontSize: width * 0.05,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            // InkWell(
            //   onTap: () async {
            //     final url = Ludoyoyubelin.toString();
            //     if (await canLaunch(url)) {
            //       await launch(url, forceWebView: true, enableJavaScript: true);
            //     } else {
            //       throw 'Could not launch $url';
            //     }
            //   },
            //   child: Container(
            //     height: height * 0.03,
            //     width: width * 0.20,
            //     color: Colors.indigo,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Center(
            //             child: Text(
            //               "YOUTUBE",
            //               style: TextStyle(
            //                   fontSize: width * 0.03,
            //                   color: Colors.lightBlue,
            //                   fontWeight: FontWeight.bold),
            //             )),
            //         Container(
            //             height: height * 0.05,
            //             width: width * 0.05,
            //             decoration: const BoxDecoration(
            //                 image: DecorationImage(image: AssetImage(youtube))))
            //       ],
            //     ),
            //   ),
            // ),

            TextButton(
              child: Text("RULES",
                  style: RighteousMedium.copyWith(
                      fontSize: width * 0.03,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const rules_ludo()));
              },
            ),
            const Icon(
              Icons.info_outline,
              color: Colors.grey,
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }

  // var link;
  // youtubelink() async {
  //   print("sdfghjkl");
  //   final response = await http.post(
  //     Uri.parse(Apiconst.youtubelink),
  //   );
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print("mmmmmmmmmmmm");
  //   if (data['error'] == '200') {
  //     setState(() {
  //       link = data['data'];
  //     });
  //   }
  // }



  // joincontest(Map<String, dynamic> gamedata) async {
  //   var docid = gamedata['doc_id'];
  //   var type = gamedata['type'];
  //   var userid = gamedata['user_id'];
  //   var amount = gamedata['amount'];
  //   var winamount = gamedata['winamount'];
  //   var username = gamedata['username'];
  //   var userimg = gamedata['userimage'];
  //   var opponentimage = gamedata['opponentimage'];
  //   var opponentname = gamedata['opponentname'];
  //   var opphoto= Apiconst.imgurl+photo.toString();
  //   setState(() {
  //     loading = true;
  //   });
  //   print(opponentimage);
  //   print('eeeeeeeeeee');
  //   print('ttttttttttt');
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final opid = prefs.getString("userId");
  //   final response = await http.post(
  //     Uri.parse(Apiconst.joincontest),
  //
  //
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "docid":docid.toString(),
  //       "userid":userid.toString(),
  //       "opponent":opid.toString(),
  //       "type":type.toString(),
  //       "amount":amount.toString(),
  //       "winamount":winamount.toString(),
  //       "username":username.toString(),
  //       "opponentname":name.toString(),
  //       "userimage":userimg.toString(),
  //       "opponentimage":opphoto.toString()
  //
  //     }),
  //   );
  //   // .onError((error, stackTrace) => InternetSlowMsg(context));
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print('aaaaaaaaaaaaaaaaa');
  //   print('rrrrrrrrrrrrrrrrrr');
  //
  //   if (data["status"] == "200") {
  //     Future.delayed(const Duration(seconds: 2), () {
  //       viewprofile();
  //     });
  //     setState(() {
  //       loading = true;
  //     });
  //     Utils.flushBarsuccessMessage(data['msg'], context, Colors.black);
  //
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //
  //     Utils.flushBarErrorMessage(data['msg'], context, Colors.black);
  //
  //     print("Error");
  //   }
  // }

  // addchallengenew(String amount) async {
  //   final pho = Apiconst.imgurl + photo.toString();
  //   print(pho);
  //   print('qqqqqqqqqqqq');
  //   setState(() {
  //     _loading = true;
  //   });
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userId");
  //   final response = await http.post(
  //     Uri.parse(Apiconst.createchallenge),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "userid": '$userid',
  //       "amount": amount,
  //       "type": 'CLASSIC',
  //       "name": name.toString(),
  //       "userimage": pho.toString(),
  //     }),
  //   );
  //
  //
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print('aaaaaaaaaaaaaaaaa');
  //   print('rrrrrrrrrrrrrrrrrr');
  //
  //   if (data["status"] == "200") {
  //     Future.delayed(const Duration(seconds: 2), () {
  //       viewprofile();
  //     });
  //     setState(() {
  //       _loading = false;
  //     });
  //
  //     Utils.flushBarsuccessMessage(data['msg'], context, Colors.black);
  //   } else {
  //     setState(() {
  //       _loading = false;
  //     });
  //
  //     Utils.flushBarErrorMessage(data['msg'], context, Colors.black);
  //
  //     print("Error");
  //   }
  // }

  // cancelledchalange(
  //     {required String userid,
  //       required String docid,
  //       required String amount}) async {
  //
  //
  //   final res = await http.get(Uri.parse(Apiconst.fristpagecancelled + 'docid=$docid&userid=$userid&amount=$amount'));
  //   final data = jsonDecode(res.body);
  //   print(data);
  //   if (data['status'] == '200') {
  //     // Navigator.pop(context);
  //
  //     Navigator.pop(context);
  //     Utils.flushBarsuccessMessage(data['msg'], context, Colors.white);
  //     Future.delayed(const Duration(seconds: 2), () {
  //       viewprofile();
  //     });
  //
  //
  //
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>classicTwo()));
  //   } else {
  //
  //     Utils.flushBarErrorMessage(data['msg'], context, Colors.white);
  //
  //   }
  // }



  // var userid;
  // var map;
  // var photo;
  // var name;
  // var wallet;
  // viewprofile() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   userid = prefs.getString("userId");
  //   print('ggggggggggg');
  //   print(userid);
  //   final response = await http.post(
  //     Uri.parse(AppConstants.profile),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "id": '${userid}',
  //     }),
  //   );
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   print("mmmmmmmmmmmm");
  //   if (data['error'] == '200') {
  //     setState(() {
  //       map = data['userdata'];
  //       photo = map['photo'];
  //       name = map['full_name'];
  //       wallet=map['wallet'];
  //     });
  //
  //
  //
  //     print(photo);
  //     print(name);
  //     print("dfghj");
  //   }
  // }
}

