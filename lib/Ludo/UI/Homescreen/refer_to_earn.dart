import 'package:flutter/material.dart';
import 'package:ludo_score/goggleAds/ads_helper_provider.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../constant/Launcher.dart';
import '../constant/clipboard.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'howItWorks.dart';
import 'myReferral.dart';

class ReferToEarn extends StatefulWidget {
  const ReferToEarn({super.key});

  @override
  State<ReferToEarn> createState() => _ReferToEarnState();
}

class _ReferToEarnState extends State<ReferToEarn> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        title: Text("Refer and Earn",style: RighteousMedium.copyWith(fontSize: heights * 0.030, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff005AA7),Color(0xffFFFDE4)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            )
        ),
        child: Column(
          children: [
            SizedBox(
              height: heights/6,
              width: widths/0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Howitworks()));
                    },
                    child: Container(
                      height: heights/10,
                      width: widths/2.1,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesBlueblueshare),fit: BoxFit.fill)),
                      child: Center(child: Text("How it works", style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white))),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReferalHistory()));
                    },
                    child: Container(
                      height: heights/10,
                      width: widths/2.1,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesBlueblueshare),fit: BoxFit.fill)),
                      child: Center(child: Text("My Referrals", style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)))
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heights/5,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesBlueblueshare),fit: BoxFit.fill)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Share, Repeat refer and\n earn UpTo 100 Coins ",style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights/6,
                        width: widths/3,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesReferfrnd),fit: BoxFit.fill)),
                      ),
                      // Image.asset(AppAsset.imagesReferfrnd,height: heights/5,)
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: heights/5,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesBlueblueshare),fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Share your code",style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),

                            Consumer<ProfileViewModel>(
                                builder: (context,profileVM,child) {
                                  final profileData= profileVM.profileModelData;
                                 return    InkWell(
                                      onTap: (){
                                        copyToClipboard(profileData?.data?.wallet==null?"":"${profileData?.data?.wallet}",context);
                                      },
                                      child: Image.asset(AppAsset.imagesClipboard,height: heights/20));
                                }
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              share();
                              },
                              child: Image.asset(AppAsset.buttonShare,height: heights/20)
                          ),
                          SizedBox(width: widths/20,),
                          InkWell(
                            onTap: (){
                              Launcher.openwhatsapp(context);

                            },
                              child: Image.asset(AppAsset.imagesWhatsapp,height: heights/20))
                        ],
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: heights/90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: heights/20,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: heights/25,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: heights/35,
                            backgroundColor: Colors.transparent,
                            child:Image.asset(AppAsset.imagesWalletshare)
                        )
                      ),
                      SizedBox(width: widths/20,),
                      Text("Earn on deposit \nGet 100 Coins on friend deposit.", style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white,fontWeight: FontWeight.bold) )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: heights/25,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: heights/35,
                              backgroundColor: Colors.transparent,
                              child:Image.asset(AppAsset.imagesEarnshare)
                          )
                        ),
                        SizedBox(width: widths/20,),
                        Text("Earn on Signup\nGet 10 Coins when your \nfriend signs up.", style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white,fontWeight: FontWeight.bold) )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
  // Future<void> share() async {
  //   await FlutterShare.share(
  //       title: 'Referral Code :',
  //       text: 'Join Now & Get Exiting Prizes. here is my Referral Code : ' ,
  //       linkUrl: "",
  //       chooserTitle: 'Referrel Code : '
  //   );
  // }
  // String referalCode = 'initialData';
  Future<void> share() async {
    String referalCode = 'initialData';
    await Share.share(
      'Referral Code:\nJoin Now & Get Exciting Prizes.\nHere is my Referral Code: $referalCode',
      subject: 'Referral Code',
    );
  }
}

// class RewardsAdds extends StatefulWidget {
//   const RewardsAdds({super.key});
//
//   @override
//   State<RewardsAdds> createState() => _RewardsAddsState();
// }
//
// class _RewardsAddsState extends State<RewardsAdds> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final adsHelper = Provider.of<AdsHelper>(context, listen: false);
//       adsHelper.loadRewardedAd();
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final adsHelper = Provider.of<AdsHelper>(context);
//     if (adsHelper.isRewardedAdLoaded) {
//       Future.microtask(() => adsHelper.showRewardedAd(_onRewardEarned));
//     }
//   }
//
//   void _onRewardEarned() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("You've earned a reward!")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("Watch the ad to earn rewards")),
//     );
//   }
// }




