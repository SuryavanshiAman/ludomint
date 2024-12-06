// import 'package:flutter/material.dart';
// import 'package:ludomint/Ludo/UI/constant/images.dart';
// import 'package:ludomint/Ludo/UI/constant/style.dart';
// import 'package:ludomint/audio.dart';
//
//
// // class Category {
// //   final String name;
// //   final List<Subcategory> subcategories;
// //   Category({required this.name, required this.subcategories});
// // }
// //
// // class Subcategory {
// //   final String number;
// //   final String photo;
// //   final String title;
// //   final String win;
// //   final String status;
// //
// //   Subcategory({required this.number,required this.photo,required this.title,required this.win,required this.status});
// // }
//
// class heading {
//   final String name;
//
//   heading(this.name);
// }
//
// class Mymain{
//   final String number;
//   final String photo;
//   final String title;
//   final String win;
//
//   Mymain(this.number,this.photo,this.title,this.win,);
// }
//
//
// class Product extends StatefulWidget {
//   @override
//   _ProductState createState() => _ProductState();
// }
//
// class _ProductState extends State<Product> {
//   // Category? _selectedCategory;
//   @override
//   void initState() {
//     super.initState();
//     // _selectedCategory = widget.categories.isNotEmpty ? widget.categories[0] : null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<heading> categories = [
//       heading("Daily"),
//       heading("Weekly"),
//       heading("Monthly"),
//       heading("All time"),
//     ];
//
//     List<Mymain> subcategories = [
//       Mymain("1",AppAsset.imagesAvatar0, "jatt ji", "400"),
//       Mymain("2",AppAsset.imagesAvatar1, "player56", "300"),
//       Mymain("3",AppAsset.imagesAvatar3, "kk", "290"),
//       Mymain("4",AppAsset.imagesAvatar0, "dydy", "250"),
//       Mymain("5",AppAsset.imagesAvatar3, "jatt ji", "200"),
//       Mymain("6",AppAsset.imagesAvatar1, "jatt ji", "180"),
//       Mymain("7",AppAsset.imagesAvatar2, "jatt ji", "150"),
//       Mymain("8",AppAsset.imagesAvatar0, "jatt ji", "100")
//
//     ];
//
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Dialog(
//         backgroundColor: Colors.black,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
//         child: Stack(
//           children: [
//             Container(
//               height: height*0.6,
//               width: width*0.8,
//               decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Categories List
//                   SizedBox(height: height/28,),
//                   Text("LEADERBOARD",style: RighteousMedium.copyWith(fontSize: height * 0.028, color: Colors.white)),
//                   SizedBox(height: height/70),
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: height/100),
//                     child: Container(
//                       width: height/1.7,
//                       height: height/14,
//                       // color: Colors.yellowAccent,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(horizontal: height/80,vertical: height/100),
//                             child: Container(
//                               height: height*0.02,
//                               width: width*0.18,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
//                               child: Text(categories[index].name, style: RighteousMedium.copyWith(fontSize: height * 0.015, color: Colors.white)
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   // SizedBox(height: height*0.0001,),
//                   // Container(
//                   //   height: height*0.20,
//                   //   width: width*0.65,
//                   //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesLogoleaderboard),fit: BoxFit.fill),
//                   //       border: Border.all(color: Colors.yellow.shade800, width: 2),borderRadius: BorderRadius.circular(5))
//                   // ),
//                   // Subcategories List with Images
//                   // if (subcategories!= null)
//                     Container(
//                       height: height*0.40,
//                       // color: Colors.teal,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: subcategories.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding:  EdgeInsets.all(9.0),
//                               child: Container(
//                                 padding:  EdgeInsets.all(8.0),
//                                 width:width/20,
//                                 height: height/15,
//                                 decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.blue[900]),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                         height: height/20,
//                                         width: width/14,
//                                         child: Center(child: Text(subcategories[index].number,style: RighteousMedium.copyWith(fontSize: height * 0.019, color: Colors.white)))
//                                     ),
//                                     Container(
//                                         height: height/20,
//                                         width: height/12,
//                                         decoration: BoxDecoration(image: DecorationImage(image: AssetImage(subcategories[index].photo)))),
//                                     SizedBox(width: height/80,),
//                                     Container(
//                                         height: height/20,
//                                         width: width/4,
//                                         // color: Colors.teal,
//                                         child: Center(child: RichText(text: TextSpan(text:subcategories[index].title, style: RighteousMedium.copyWith(fontSize: height* 0.019, color: Colors.white)),))
//                                     ),
//                                     Spacer(),
//                                     RichText(text: TextSpan(text: subcategories[index].win, style: RighteousMedium.copyWith(fontSize: height* 0.019, color: Colors.white)),),
//
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: InkWell(
//                 child: Image.asset(AppAsset.imagesCross,
//                     height: height / 20),
//                 onTap: () {
//                   Audio.sound();
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }