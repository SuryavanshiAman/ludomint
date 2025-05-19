import 'package:ludo_score/withdrawHistory.dart';
import 'package:flutter/material.dart';

import 'Ludo/UI/constant/images.dart';
import 'Ludo/UI/constant/style.dart';
import 'audio.dart';
import 'depositHistory.dart';


class transaction_History extends StatefulWidget {
  const transaction_History({Key? key}) : super(key: key);

  @override
  State<transaction_History> createState() => _transaction_HistoryState();
}

class _transaction_HistoryState extends State<transaction_History>with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {

    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    TabController _tabContrller = TabController(length: 2, vsync: this);

    return SafeArea(child:Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        children: [
          Container(
            height: heights*0.6,
            width: widths*0.8,
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                SizedBox(height: heights/30,),
                Text("HISTORY", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                SizedBox(height: heights/40,),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Container(
                     height: heights*0.06,
                    // width: widths*0.9,
                     color: Colors.black,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(10)),
                    child: TabBar(
                      controller: _tabContrller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Creates border
                        color: Colors.yellow.shade800,),
                      unselectedLabelColor:Colors.blue,
                      labelStyle:RighteousMedium.copyWith(fontSize: heights * 0.02, color: Colors.red) ,

                      tabs: [
                        Tab(
                          text: ("Deposit"),
                        ),
                        // Tab(
                        //   text: ("ONCOMING"),
                        // ),
                        Tab(
                          text: ("Withdrawal"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: heights*0.4,
                  width: widths*0.7,

                  child: TabBarView(controller: _tabContrller, children: [
                     deposit_History(),
                   // Text(" Withdrawl_History()",style: RighteousMedium.copyWith(fontSize: heights * 0.02, color: Colors.white)),
                   // Text(" Withdrawl_History()",style: RighteousMedium.copyWith(fontSize: heights * 0.02, color: Colors.white)),
                    withdrawHistory()
                  ]),
                )
                // Container(
                //   height: heights/10.5,
                //   width: widths/1.5,
                //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewone),fit: BoxFit.fill)),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding:  EdgeInsets.only(right: widths/3,top: heights/90),
                //         child: Text("MAIN BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: widths/30,right: widths/20,bottom: heights/45),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             // SizedBox(width: widths/20,),
                //             Text("₹230", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //             SizedBox(width: widths/6,),
                //             InkWell(
                //                 onTap: (){
                //                   Audio.sound();
                //                   Navigator.push(
                //                       context, MaterialPageRoute(builder: (context) => recharge()));
                //                 },
                //                 child: Text("ADD AMOUNT", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white))),
                //
                //           ],
                //         ),
                //       ),
                //       // Row(
                //       //   // crossAxisAlignment: CrossAxisAlignment.end,
                //       //   children: [
                //       //     SizedBox(width: widths/25,),
                //       //     Text("₹230", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //       //     SizedBox(width: widths/4.9,),
                //       //     InkWell(
                //       //         onTap: (){
                //       //           Audio.sound();
                //       //           Navigator.push(
                //       //               context, MaterialPageRoute(builder: (context) => recharge()));
                //       //         },
                //       //         child: Text("ADD AMOUNT", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)))
                //       //   ],
                //       // ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: heights/35,),
                // Container(
                //   height: heights/10.5,
                //   width: widths/1.5,
                //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewtwo),fit: BoxFit.fill)),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(right: widths/3.6,top: heights/80),
                //         child: Text("WINNING BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: widths/20,right: widths/10,bottom: heights/40),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             Text("₹230",style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //             SizedBox(width: widths/4.6,),
                //             Text("WITHDRAW",style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white))
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: heights/35,),
                // Container(
                //   height: heights/10.5,
                //   width: widths/1.5,
                //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewthree),fit: BoxFit.fill)),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(right: widths/3.4,top: heights/90),
                //         child: Text("BONUS BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //       ),
                //       Padding(
                //         padding:  EdgeInsets.only(left: widths/95,bottom: heights/40),
                //         child: Row(
                //           // mainAxisAlignment: MainAxisAlignment.end,
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             SizedBox(width: widths/19,),
                //             Text("₹230",style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                //             SizedBox(width: widths/4.3),
                //             Text("  While joining a game,\n5% will be used from your\n  BONUS BALANCE",style: RighteousMedium.copyWith(fontSize: heights * 0.010, color: Colors.brown))
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: heights/30,),
                // Container(
                //     height: heights/30,
                //     width: widths/3,
                //     decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(12)),
                //     child: Center(child: Text("YOUR COUPONS",style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white)))),
                // SizedBox(height: heights/50,),
                // InkWell(
                //   onTap: (){
                //
                //   },
                //   child: Container(
                //       height: heights/30,
                //       width: widths/2.4,
                //       decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(12)),
                //       child: Center(child: Text("TRANSACTION HISTORY", style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white),))),
                // ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              child: Image.asset(AppAsset.imagesCross,
                  height: heights / 20),
              onTap: () {
                Audio.sound();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    ) );
  }
}
