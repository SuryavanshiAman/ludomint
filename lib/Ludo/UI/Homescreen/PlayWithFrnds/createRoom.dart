// import 'package:flutter/material.dart';
// import 'package:ludo_score/Ludo/UI/Homescreen/jjellybutton.dart';
//
// class CreateRoomcode extends StatefulWidget {
//   const CreateRoomcode({super.key});
//
//   @override
//   State<CreateRoomcode> createState() => _CreateRoomcodeState();
// }
//
// class _CreateRoomcodeState extends State<CreateRoomcode> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Container(
//             height: height*0.70,
//             // color: Colors.yellow,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 itemCount: 8,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff00209d)),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     color: Colors.grey.shade100,
//                     child: Container(
//                       height: height * 0.13,
//                       padding: const EdgeInsets.all(6),
//                       // color: Colors.pink,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Challenges From",
//                                 style: TextStyle(
//                                     fontSize: width * 0.04,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                               SizedBox(
//                                 width: width * 0.02,
//                               ),
//                               Text(
//                                 // gamedata['username'] ?? '',
//                                 "username",
//                                 style: TextStyle(
//                                     fontSize: width * 0.04,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.red),
//                               ),
//                               const Spacer(),
//                               Container(
//                                   height: height * 0.02,
//                                   width: width * 0.15,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: Colors.indigo.shade900),
//                                   child: Center(
//                                       child: Text(
//                                         // gamedata['type'] ?? '',
//                                         "type",
//                                         style: TextStyle(
//                                             fontSize: width * 0.03,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold),
//                                       )))
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.grey.shade300,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Entry Fee",
//                                     style: TextStyle(
//                                         fontSize: width * 0.04, color: Colors.black),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.monetization_on_rounded,
//                                         color: Colors.yellow.shade900,
//                                       ),
//                                       Text(
//                                         // gamedata['amount'] ?? '',
//                                         "amount",
//                                         style: TextStyle(
//                                             fontSize: width * 0.03,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               // disable==true?
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       minimumSize: const Size(30, 30),
//                                       backgroundColor: const Color(0xff01ad79)),
//                                   onPressed: () {
//                                     // joincontest(gamedata);
//                                   },
//                                   child: Text(
//                                     "Play",
//                                     style: TextStyle(
//                                         fontSize: width * 0.04,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   )),
//                               // :Container(),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Prize",
//                                     style: TextStyle(
//                                         fontSize: width * 0.04, color: Colors.black),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.monetization_on_rounded,
//                                         color: Colors.yellow.shade900,
//                                       ),
//                                       Text(
//                                         // gamedata['winamount'] ?? '',
//                                         "Win Amount",
//                                         style: TextStyle(
//                                             fontSize: width * 0.03,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           ), SizedBox(
//             // color: Colors.black,
//             height: height/50,),
//           JellyButton(
//             onTap: () {  },
//             title: 'Create Room',
//
//           )
//         ],
//       ),
//     );
//
//
//
//   }
// }
