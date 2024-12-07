import 'package:ludomint/Ludo/UI/Homescreen/withdrawpage.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/main.dart';

import '../../../audio.dart';
import '../../../transaction.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'money/Rechargeamount.dart';

class Mywallet extends StatefulWidget {
  const Mywallet({super.key});

  @override
  State<Mywallet> createState() => _MywalletState();
}

class _MywalletState extends State<Mywallet> {

  @override
  void initState() {
    getprofile();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Dialog(
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
                    Text("WALLET", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                    SizedBox(height: heights/40,),
                    Container(
                      height: heights/10.5,
                      width: widths/1.5,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewone),fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: widths/3,top: heights/90),
                            child: Text("MAIN BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: widths/30,right: widths/20,bottom: heights/45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // SizedBox(width: widths/20,),
                                Text(wallet==null?"₹0.0":"₹$wallet", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                                SizedBox(width: widths/6,),
                                InkWell(
                                    onTap: (){
                                      Audio.sound();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const recharge()));
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  recharge()));
                                    },
                                    child: Text("ADD AMOUNT", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white))),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heights/35,),
                    Container(
                      height: heights/10.5,
                      width: widths/1.5,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewtwo),fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: widths/3.6,top: heights/80),
                            child: Text("WINNING BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width/20,right: width/11,bottom: height/40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(winning==null?"₹0.0":"₹"+winning.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                                SizedBox(width: widths/4.6,),
                                InkWell(
                                    onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const withdraw_Page()));
                                },
                                    child: Text("WITHDRAW",style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heights/35,),
                    Container(
                      height: height/10.3,
                      width: width/1.5,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWalletnewthree),fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: widths/3.4,top: heights/90),
                            child: Text("BONUS BALANCE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: widths/95,bottom: heights/40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(bonus==null?"":"₹"+bonus.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white)),
                                SizedBox(width: widths/7),
                                Text("  While joining a game,\n5% will be used from your\n  BONUS BALANCE",style: RighteousMedium.copyWith(fontSize: heights * 0.010, color: Colors.brown))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heights/30,),
                    Container(
                      height: heights/30,
                        width: widths/3,
                        decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(12)),
                        child: Center(child: Text("YOUR COUPONS",style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white)))),
                    SizedBox(height: heights/50,),
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context)=>const transaction_History());
                      },
                      child: Container(
                          height: height/30,
                          width: width/2.2,
                          decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(12)),
                          child: Center(child: Text("TRANSACTION HISTORY", style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white),))),
                    ),

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
        ),
      );
  }
}
