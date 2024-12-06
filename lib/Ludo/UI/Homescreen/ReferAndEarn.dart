import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../../audio.dart';
import '../constant/clipboard.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'myreferralREFER.dart';

class Myrefer extends StatefulWidget {
  const Myrefer({super.key});

  @override
  State<Myrefer> createState() => _MyreferState();
}

class _MyreferState extends State<Myrefer> {
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
        child:

         Dialog(
           backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
            child: Stack(
              children: [
                Container(
                  height: heights*0.6,
                  width: widths*0.8,
                  decoration: BoxDecoration( color: Colors.black,border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: heights/25,),
                      Text("REFER & EARN", style: RighteousBold.copyWith(fontSize: heights * 0.025, color: Colors.white),),
                      SizedBox(height: heights/24,),
                      Container(
                        height: heights/20,
                          width: widths/2.9,
                          decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("  INVITE YOUR\nFRIENDS & EARN", style: RighteousBold.copyWith(fontSize: heights * 0.018, color: Colors.white),))
                      ),
                      SizedBox(height: heights/41,),
                      Container(
                        height: heights/8,
                        width: widths/2,
                        decoration: BoxDecoration(color: Colors.indigo.shade900,borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.yellow.shade800,width: 1)),
                        child: Column(
                          children: [
                            SizedBox(height: heights/90,),
                            Text("Win ₹5/- for each sign-up", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.brown),),
                            SizedBox(height: heights/90,),
                            Text("Win 2% of commission fees", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.brown,),),
                            Text("     whenever your\nreferral plays a game", style: RighteousMedium.copyWith(fontSize: heights * 0.015, color: Colors.brown,),),
                          ],
                        ),
                      ),
                      SizedBox(height: heights /25),
                      Text("REFERRAL CODE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.yellow,),),
                      SizedBox(height: heights / 80),
                      Container(
                        height: heights / 26,
                        width: widths / 2.5,
                          color: Colors.indigo.shade900,
                        child: Row(
                          children: [
                            Container(
                              height: heights / 30,
                              width: widths / 3,
                              child: Center(child: Text(referalcode=='null'?"2526526":referalcode.toString(), style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white))),
                            ),
                            Container(
                              height: heights / 30,
                              width: widths / 15,
                              child: InkWell(
                                onTap: () {
                                  copyToClipboard(referalcode=='null'?"2526526":referalcode.toString(), context);
                                },
                                child: const Icon(
                                  Icons.content_copy,
                                  color: Colors.white,
                                  size: 20,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: heights / 27),
                      InkWell(
                        onTap: (){
                          share();
                        },
                        child: Container(
                          height: heights/25,
                          width: widths/3,
                          decoration: BoxDecoration(color: CupertinoColors.activeOrange,borderRadius: BorderRadius.circular(39)),
                            child: Center(
                                child: Text("INVITE", style: RighteousMedium.copyWith(fontSize: heights * 0.018, color: Colors.white))
                            )
                        ),
                      ),
                      SizedBox(height: heights / 50),
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => referralREFER()));
                          showDialog(context: context, builder: (context)=>const referralREFER());
                        },
                        child: Container(
                          height: heights/26,
                            width: widths/2.5,
                            decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(39)),
                            child: Center(child: Text("REFERRAL HISTORY", style: RighteousMedium.copyWith(fontSize: widths * 0.035, color: Colors.white)))
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Audio.sound();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: heights / 20,
                      width: widths / 10,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesCross), fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  }
  String referalCode = 'initialData';
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Referral Code :',
        text: 'Join Now & Get Exiting Prizes. here is my Referral Code : ' ,
        linkUrl: "",
        chooserTitle: 'Referrel Code : '
    );
  }

}

