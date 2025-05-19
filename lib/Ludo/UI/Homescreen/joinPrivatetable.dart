// // ignore_for_file: file_names
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:ludo_score/Ludo/UI/Homescreen/jjellybutton.dart';
// import 'package:ludo_score/Ludo/UI/constant/style.dart';
// import 'package:ludo_score/audio.dart';
//
// class Myjoin extends StatefulWidget {
//   const Myjoin({super.key});
//
//   @override
//   State<Myjoin> createState() => _MyjoinState();
// }
//
// class _MyjoinState extends State<Myjoin> {
//   @override
//   Widget build(BuildContext context) {
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Column(
//         children: [
//           SizedBox(height: heights/15,),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: widths/20),
//             child: Container(
//               child: DottedBorder(
//                 borderType: BorderType.RRect,
//                 color: Colors.white,
//                 radius: const Radius.circular(12),
//                 // padding: EdgeInsets.all(10),
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   child: TextField(
//                     style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white),
//                     cursorColor: Colors.white,
//                     decoration: InputDecoration(
//                       focusedBorder: InputBorder.none,
//                       hintText: "Enter code",
//                       hintStyle: RighteousMedium.copyWith(fontSize: heights* 0.018, color: Colors.white.withOpacity(0.4)),
//                       filled: true,
//                       fillColor: const Color(0xff010a40).withOpacity(0.9),
//                     ),
//                     keyboardType: TextInputType.number,
//                     // maxLength: 10,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: heights/15,),
//           JellyButton(
//               onTap: () {
//                 Audio.sound();
//
//               },
//               title: 'Join Room'
//           ),
//
//         ],
//       ),
//     );
//   }
// }
