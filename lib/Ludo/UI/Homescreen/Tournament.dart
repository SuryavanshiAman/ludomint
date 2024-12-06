import 'package:flutter/material.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';



class Mytour extends StatefulWidget {
  const Mytour({super.key});

  @override
  State<Mytour> createState() => _MytourState();
}

class _MytourState extends State<Mytour>  {


  @override
  Widget build(BuildContext context) {

    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Container(
          height: heights*0.6,
          width: widths*0.8,
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
            child:Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Image.asset(
                            AppAsset.imagesCross, height: heights/20),
                        onTap: () {
                          Audio.sound();
                          Navigator.pop(context);
                        },
                      )
                  ),
                  Text("COMMING SOON", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                  // GFTabBar(
                  //   tabBarColor: Colors.indigo.shade900,
                  //   tabBarHeight: heights/18,
                  //   width: widths/1.3,
                  //   unselectedLabelColor: Colors.teal,
                  //   length: 3,
                  //   controller: tabController,
                  //   tabs: [
                  //     Tab(
                  //       child: Text("Friends list",style: RighteousMedium.copyWith(fontSize: heights * 0.015, color: Colors.white,),),
                  //     ),
                  //     Tab(
                  //       child: Text("Accepted",style: RighteousMedium.copyWith(fontSize: heights * 0.015, color: Colors.white,),),
                  //     ),
                  //     Tab(
                  //       child: Text("Add friends",style: RighteousMedium.copyWith(fontSize: heights * 0.015, color: Colors.white,),
                  //       ),
                  //     )],
                  // ),
                  // GFTabBarView(
                  //   height: heights/2.3,
                  //     controller: tabController,
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 20),
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.vertical,
                  //           shrinkWrap: true,
                  //           itemCount: list.length,
                  //           itemBuilder: (context, index) {
                  //
                  //             if (list[index].isRemoved) {
                  //               return SizedBox.shrink();
                  //             }
                  //
                  //             return Padding(
                  //               padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
                  //               child: Container(
                  //                 // padding:  EdgeInsets.all(10.0),
                  //                 height: heights*0.06,
                  //                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Padding(
                  //                       padding: EdgeInsets.symmetric(horizontal: heights*0.02),
                  //                       child: Container(
                  //                           height: heights*0.6,
                  //                           width: widths*0.07,
                  //                           decoration: BoxDecoration(image: DecorationImage(image: AssetImage(list[index].photo)))),
                  //                     ),
                  //                     RichText(text: TextSpan(text:list[index].name, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),),
                  //                     IconButton(
                  //                         onPressed: (){
                  //                           setState(() {
                  //                             list[index].isRemoved = true;
                  //
                  //
                  //                           });
                  //                         },
                  //                         icon: Icon(Icons.notification_add,size: 15,color: Colors.white,)
                  //                     ),
                  //
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 20),
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.vertical,
                  //           shrinkWrap: true,
                  //           itemCount: listtwo.length,
                  //           itemBuilder: (context, index) {
                  //
                  //             if (list[index].isRemoved) {
                  //               return SizedBox.shrink();
                  //             }
                  //
                  //             return Padding(
                  //               padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
                  //               child: Container(
                  //                 // padding:  EdgeInsets.all(10.0),
                  //                 height: heights*0.06,
                  //                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Padding(
                  //                       padding: EdgeInsets.symmetric(horizontal: heights*0.02),
                  //                       child: Container(
                  //                           height: heights*0.6,
                  //                           width: widths*0.07,
                  //                           decoration: BoxDecoration(image: DecorationImage(image: AssetImage(listtwo[index].photo)))),
                  //                     ),
                  //                     RichText(text: TextSpan(text:listtwo[index].name, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),),
                  //                     IconButton(
                  //                         onPressed: (){},
                  //                         icon: Icon(Icons.check,size: 15,color: Colors.white,)
                  //                     ),IconButton(
                  //                         onPressed: (){
                  //                           setState(() {
                  //                             listtwo[index].isRemoved = true;
                  //
                  //                           });
                  //                         },
                  //                         icon: Icon(Icons.close,size: 15,color: Colors.white,)
                  //                     ),
                  //
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //
                  //       ),
                  //       ListView(
                  //         scrollDirection: Axis.vertical,
                  //         children: [
                  //           Column(
                  //             children: [
                  //               SearchBar(
                  //                 backgroundColor: MaterialStateProperty.all(Colors.red.shade400),
                  //                 // shadowColor: MaterialStateProperty.all(Colors.pinkAccent),
                  //                 // overlayColor: MaterialStateProperty.all(Colors.pinkAccent),
                  //                 elevation: MaterialStateProperty.all(20.0),
                  //                 constraints: BoxConstraints(maxWidth: widths/1.5,maxHeight: heights/18),
                  //                 hintText: "Search username",
                  //                 hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                  //                 textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                  //                 shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                  //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                  //                 )),
                  //                 trailing: [
                  //                   IconButton(
                  //                     icon: const Icon(Icons.search,color: Colors.white,),
                  //                     onPressed: () {
                  //                     },
                  //                   ),
                  //
                  //                 ],
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsets.symmetric(vertical: 20),
                  //                 child: ListView.builder(
                  //                   scrollDirection: Axis.vertical,
                  //                   shrinkWrap: true,
                  //                   itemCount: listthree.length,
                  //                   itemBuilder: (context, index) {
                  //                     if (list[index].isRemoved) {
                  //                       return SizedBox.shrink();
                  //                     }
                  //                     return Padding(
                  //                       padding:  EdgeInsets.only(left: 20,right: 20,top: 5),
                  //                       child: Container(
                  //                         // padding:  EdgeInsets.all(10.0),
                  //                         height: heights*0.06,
                  //                         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
                  //                         child: Row(
                  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                           children: [
                  //                             Padding(
                  //                               padding: EdgeInsets.symmetric(horizontal: heights*0.02),
                  //                               child: Container(
                  //                                   height: heights*0.6,
                  //                                   width: widths*0.07,
                  //                                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(listthree[index].photo)))),
                  //                             ),
                  //                             RichText(text: TextSpan(text:listthree[index].name, style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),),
                  //                             Icon(Icons.add,size: 15,color: Colors.white,)
                  //
                  //
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //
                  //     ]
                  // ),





                ],
              )
          ),
    );
  }
}

