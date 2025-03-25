// ignore_for_file: non_constant_identifier_names
import 'package:ludomint/Ludo/UI/Homescreen/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:motion/motion.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../audio.dart';
import '../../../ludo_provider.dart';
import '../constant/Launcher.dart';
import '../constant/LauncherAPI.dart';
import '../constant/api constant.dart';
import '../constant/dimension.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'Classic.dart';
import 'Privatetable.dart';
import 'Profilepage.dart';
import 'ReferAndEarn.dart';
import 'Setting.dart';
import 'Share.dart';
import 'Tournament.dart';
import 'Wallet.dart';
import 'api/apiprofile.dart';
import 'api/ruleapi.dart';
import 'create_join_room_screen.dart';
import 'invite/Invite.dart';
import 'jellybuttonn.dart';



//class for 4picutre
class Fourbox {
  String photo;
  String title;
  final void Function()? onTap;
  Fourbox(this.photo, this.title, this.onTap);
}

class Numberthree extends StatefulWidget {
  const Numberthree({super.key});

  @override
  State<Numberthree> createState() => _NumberthreeState();
}

class _NumberthreeState extends State<Numberthree>  with WidgetsBindingObserver {

  bool  sound = true;
  bool  music = true;
  bool  vibration = true;
 dynamic data;

 @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add the observer
    Audio.bgmusic();
    Audio.sound();
    getprofile();
    getlinks();
    getrules();
print("Tota");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      Audio.audioPlayers.stop();
      Audio.audioPlayer.stop();
    } else if (state == AppLifecycleState.resumed) {
      if (music) {
        Audio.bgmusic();
      }
      if (sound) {
        Audio.sound();
      }
    }
  }

  void _togglePlayback() async {
    if (music) {
      await Audio.audioPlayers.stop();
    } else {
      Audio.bgmusic();
    }
    setState(() {
      music = !music;
    });
  }

  void _NewtogglePlayback() async {
    if (sound) {
      await Audio.audioPlayer.stop();
    } else {
      Audio.sound();
    }
    setState(() {
      sound = !sound;
    });
  }

  void _VibtogglePlayback() async {
    if (vibration) {
      Vibration.vibrate(duration: 500);
    } else {
      Audio.sound();

    }
    setState(() {
      vibration = !vibration;
    });
  }

  @override
  void dispose() {
    Audio.audioPlayers.dispose();
    Audio.audioPlayer.dispose();
    // getprofile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    List<Fourbox> boxdata = [
      Fourbox(AppAsset.imagesOne, "Play online", () {
        final ludoProvider = LudoProvider();
        // ludoProvider.dispose();
        Audio.sound();
        showDialog(context: context, builder: (context)=>const Classic());
      }
      ),
      Fourbox(AppAsset.imagesTwo, "Tournament", () {
        showDialog(context: context, builder: (ctx) => const Classic());
      }),
      Fourbox(AppAsset.imagesThree, "Play with friends", () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Classic()));
        Audio.sound();
      }),
      Fourbox(AppAsset.imagesFour, "Refer and earn", () {
        showDialog(context: context, builder: (ctx) => const Myrefer());
        Audio.sound();
      }),
    ];
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
                child: Container(
                  height: heights * 0.3,
                  decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            child: Image.asset(AppAsset.imagesCross, height: heights / 25),
                            onTap: () {
                              Audio.sound();
                              Navigator.pop(context);
                            }),
                      ),
                      Text("EXIT", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                      SizedBox(height: heights / 30),
                      Text("Are you sure want to exit?", style: RighteousMedium.copyWith(fontSize: heights * 0.023, color: Colors.white)),
                      SizedBox(height: heights * 0.04),
                      SizedBox(
                        width: widths * 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            JellyButtonn(
                                onTap: () {
                                  SystemNavigator.pop();
                                  Audio.audioPlayer.stop();
                                  Audio.audioPlayers.stop();
                                 },
                                title: 'Yes'
                            ),
                            JellyButtonn(
                                onTap: () {
                                  Navigator.pop(context, false);
                                },
                                title: 'No'
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
            },
        );
        return shouldPop!;
      },

      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppAsset.assetsBgapp),
                 ),
            ),
          ),
          leading: Row(
            children: [
              InkWell(
                child:
                image==null?
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: CircleAvatar(
                   radius: 20,
                   backgroundColor: Colors.transparent,
                   backgroundImage: AssetImage(AppAsset.imagesAvatar0),
                 ),
               ):
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CircleAvatar(
                   radius: 20,
                   backgroundColor: Colors.transparent,
                   backgroundImage: NetworkImage(
                     AppConstants.imageurl+image.toString(),
                   ),
                  ),
               ),
                onTap: (){
                  Audio.sound();
                  showDialog(context: context, builder: (context) =>const Myprofile());

                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     width: widths*0.20,
                     // color: Colors.yellow,
                     child: Text(username==null?"":username.toString(),
                         style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white),
                       textAlign: TextAlign.center,
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                     ),
                   ),
                  Text(RndId==null?"":RndId.toString(), style: RighteousMedium.copyWith(fontSize: heights * 0.015, color: Colors.white)),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    setState(() {
                      getprofile();

                    });
                  },
                  icon: SizedBox(
                      height: heights*0.03,
                      width: widths*0.07,
                      // color: Colors.yellow,
                      child: Image.asset(AppAsset.imagesBtnRefresh,))
              ),
            ],
          ),
          leadingWidth: widths/2,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: heights / 60, vertical: heights / 60),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: heights / 60),
                width: widths / 2.2,
                decoration: BoxDecoration(border: Border.all(color: const Color(0xfffbda19), width: 2),borderRadius: BorderRadius.circular(40)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child:  Image.asset(AppAsset.buttonWalletimage),
                      onTap: (){
                        Audio.sound();
                        showDialog(context: context, builder: (context)=>const Mywallet());

                        },
                    ),
                    Text(wallet??"0.0", style: RighteousMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
                    InkWell(
                      child:Image.asset(AppAsset.buttonAdd),
                      onTap: (){
                        Audio.sound();
                        showDialog(context: context, builder: (context) =>const Mymoney());


                      },
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          height: heights,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesLudobg), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widths / 60, vertical: heights / 60),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Audio.sound();
                            Launcher.openwhatsapp(context);
                            },
                          child: Image.asset(AppAsset.imagesWhatsapp,height: heights/15.8,),
                        ),
                        Text("Whatsapp", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                        SizedBox(height: heights / 90,),
                        InkWell(
                          onTap: () {
                            Audio.sound();
                            Launcher.openteligram();
                          },
                          child: Image.asset(AppAsset.imagesTelegramnew, height: heights/15.8),
                        ),
                        Text("Telegram", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                        SizedBox(height: heights / 90,),
                        InkWell(
                          child: Image.asset(AppAsset.imagesSharenew,height: heights/15.8,),
                          onTap: () {
                            Audio.sound();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Myshare()));
                          },
                        ),
                        Text("Share", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(AppAsset.imagesLogonew, width: widths / 2),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                              onTap: _NewtogglePlayback,
                                child: Image.asset(sound? AppAsset.imagesSoundnew:AppAsset.imagesNosound,height: heights/15,)
                            ),
                        Text("Sound", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                        SizedBox(height: heights / 90,),
                        InkWell(
                          onTap:_togglePlayback,
                          child: Image.asset(music? AppAsset.imagesMusicnew:AppAsset.imagesNomusic,height: heights/15,),),
                        Text("Music", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                        SizedBox(height: heights / 90),
                        InkWell(
                            onTap: _VibtogglePlayback,
                              child: Image.asset(vibration? AppAsset.imagesVibrationnew:AppAsset.imagesNovibration,height: heights/18,)
                          ),
                        Text("Vibration", style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: heights * 0.05,),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0
                    ),
                    itemCount: boxdata.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: boxdata[index].onTap,
                        child: Column(
                          children: [
                            WidgetAnimator(
                              atRestEffect: WidgetRestingEffects.fidget(
                                duration: const Duration(milliseconds: 10000)
                              ),
                              child:   Motion.elevated(
                                elevation: 50,
                                borderRadius: BorderRadius.circular(40),
                                shadow: false,
                                child:  Container(
                                  height: heights*0.15,
                                  width: widths*0.30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(boxdata[index].photo),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                            SizedBox(height: heights/70,),
                            Motion.elevated(
                              elevation: 50,
                              borderRadius: BorderRadius.circular(40),
                              shadow: false,
                              child: TextAnimator(
                                  boxdata[index].title,
                                atRestEffect: WidgetRestingEffects.pulse(effectStrength: 0.6),
                                style: RighteousBold.copyWith(fontSize: heights * 0.015, color: Colors.white),
                                incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                                    blur: const Offset(0, 20), scale: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: heights / 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                const AssetImage(AppAsset.imagesCirclebottom),
                            child: CircleAvatar(
                                radius: heights / 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    const AssetImage(AppAsset.imagesBluenew),
                                child: CircleAvatar(
                                  radius: heights / 35,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(AppAsset.imagesNewinvite),
                                )),
                          ),
                          Text("Invite",style: RighteousMedium.copyWith(fontSize: heights * 0.0132, color: Colors.white)),
                        ],
                      ),
                      onTap: () {
                        Audio.sound();
                        showDialog(context: context, builder: (context)=> const Myinvite());
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: heights / 25,
                            backgroundImage: const AssetImage(AppAsset.imagesCirclebottom),
                            backgroundColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: heights / 25,
                              backgroundImage: const AssetImage(AppAsset.imagesBluenew),
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                radius: heights / 35,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(AppAsset.buttonSettingimage),
                              ),
                            ),
                          ),
                          Text("Setting", style: RighteousMedium.copyWith(fontSize: heights * 0.0132, color: Colors.white))
                        ],
                      ),
                      onTap: (){
                        Audio.sound();
                        showDialog(context: context, builder: (context)=>const Mysettings());
                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
