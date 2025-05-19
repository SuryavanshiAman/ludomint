// import 'package:flutter/material.dart';
// import 'package:ludo_score/Ludo/UI/constant/images.dart';
// import 'package:ludo_score/Ludo/UI/constant/style.dart';
//
//
// class MyApp extends StatefulWidget{
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<accepted> listtwo = [];
//
//   @override
//   void initState() {
//
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//     listtwo.add(accepted(name: "nisa",photo: AppAsset.imagesAvatar0));
//
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:Text("Employee List"),
//           backgroundColor: Colors.green,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
//             child: Column(
//               children: listtwo.map((singleEmployeeData){
//                 return Padding(
//                   padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
//                   child: Container(
//                     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
//                     child: ListTile(
//                       title: Text(singleEmployeeData.name,style: TextStyle(color: Colors.white),),
//                       leading: CircleAvatar(
//                         radius: 15,
//                         backgroundColor: Colors.transparent,
//                         child: Image.asset(AppAsset.imagesAvatar0),
//                       ),
//                       trailing:Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                        IconButton(
//                            onPressed: (){
//
//                            },
//                            icon: Icon(Icons.check,color: Colors.green,) ),
//                         SizedBox(width: 8),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.black
//                           ),
//                           child: Icon(Icons.delete_forever_sharp),
//                           onPressed: (){
//                             //delete action for this button
//                             employe.removeWhere((element){
//                               return element.empid == singleEmployeeData.empid;
//                             }); //go through the loop and match content to delete from list
//                             setState(() {
//                               //refresh UI after deleting element from list
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//
//
//                     )),
//                 );
//               }).toList(),
//             ),
//           ),
//         )
//
//     );
//   }
// }
//
// class accepted{
//   final String name;
//   final String photo;
//   bool isRemoved;
//   accepted({required this.name, required this.photo, this.isRemoved = false});
// }
