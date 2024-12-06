// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:ludomint/Ludo/UI/Homescreen/jjellybutton.dart';
// import 'package:ludomint/Ludo/UI/constant/images.dart';
// import 'package:ludomint/Ludo/UI/constant/style.dart';
//
// class Newone {
//   //Class for grid view
//   String photoone;
//    String photo;
//    String title;
//    String titleone;
//   Newone(this.photoone,this.photo,this.title,this.titleone);
// }
//
// class Mycreate extends StatefulWidget {
//   const Mycreate({super.key});
//
//   @override
//   State<Mycreate> createState() => _MycreateState();
// }
//
// class _MycreateState extends State<Mycreate> {
//   @override
//   void initState() {
//     super.initState();
//     // _selectedCategory = widget.categories.isNotEmpty ? widget.categories[0] : null;
//     StartTimer();
//   }
//
//   Timer? countdownTimer;
//   Duration myDuration = const Duration(days: 5);
//
//   void StartTimer() {
//     countdownTimer =
//         Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
//   }
//
//   void setCountDown() {
//     const reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//
//   List<Newone > addAmount= [
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹150","₹50" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹140","₹40" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹100","₹40" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹50","₹20" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹40","₹10" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹20","₹5" ),
//     Newone (AppAsset.buttonAddmoney,AppAsset.buttonAddmoney,"₹10","₹4" ),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     String strDigits(int n) => n.toString().padLeft(2, '0');
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     final minutes = strDigits(myDuration.inMinutes.remainder(60));
//
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.height;
//
//     return Column(
//       children: [
//         Container(
//           height: heights*0.30,
//           // color: Colors.pink,
//           child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: addAmount.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         height: heights * 0.11,
//                         decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)),color: Colors.blue[900]),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(left: widths/60,right: widths/55),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("PRIZE POOL",style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
//                                   Text("ENTRY FEE",style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white))
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   height: heights/20,
//                                   width: widths/10,
//                                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(addAmount[index].photoone))),
//                                   child: Center(child: Text(addAmount[index].title, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(minimumSize: const Size(30, 30),backgroundColor: Colors.orange.shade900),
//                                     onPressed: () {},
//                                     child: Row(
//                                       children: [
//                                         Text(minutes, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),
//                                         Text(':$seconds', style: RighteousMedium.copyWith(fontSize: heights * 0.019,color: Colors.white)),
//                                       ],
//                                     )
//                                 ),
//                                 Container(
//                                   height: heights/20,
//                                   width: widths/10,
//                                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(addAmount[index].photoone))),
//                                   child: Center(
//                                     child: Text(addAmount[index].titleone, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//         ), SizedBox(
//           // color: Colors.black,
//           height: heights/50,),
//         JellyButton(
//           onTap: () {  },
//           title: 'Create Room',
//
//         )
//       ],
//     );
//   }
// }
