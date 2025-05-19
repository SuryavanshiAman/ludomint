import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/constant/images.dart';
import 'package:ludo_score/Ludo/UI/constant/style.dart';
import 'package:ludo_score/audio.dart';
import 'package:ludo_score/generated/assets.dart';
import 'package:ludo_score/main.dart';

import '../Leaderboard/alltime.dart';

class MyNetwork extends StatefulWidget {
  const MyNetwork({super.key});

  @override
  State<MyNetwork> createState() => _MyNetworkState();
}

class _MyNetworkState extends State<MyNetwork> {
  @override
  Widget build(BuildContext context) {
    List<Mymain> subcategories = [
      Mymain("1", AppAsset.imagesAvatar0, "jatt ji", "400"),
      Mymain("2", AppAsset.imagesAvatar1, "player56", "300"),
      Mymain("3", AppAsset.imagesAvatar3, "kk", "290"),
      Mymain("4", AppAsset.imagesAvatar0, "dydy", "250"),
      Mymain("5", AppAsset.imagesAvatar3, "jatt ji", "200"),
      Mymain("6", AppAsset.imagesAvatar1, "jatt ji", "180"),
      Mymain("7", AppAsset.imagesAvatar2, "jatt ji", "150"),
      Mymain("8", AppAsset.imagesAvatar0, "jatt ji", "100")
    ];
    return  Dialog(
      insetPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.transparent,
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0B1736),
              Color(0xFF142D66),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: Colors.yellow, width: 3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Audio.sound();
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.imagesCross, height: height / 25),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                alignment: Alignment.center,
                height: height * 0.03,
                width: width,
                padding: const EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(180),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: width * 0.06),
                    const Text("My Network",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontFamily: 'acme')),
                    SizedBox(width: width * 0.25),
                    const Text("Points",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontFamily: 'acme')),
                    const Spacer(),
                    const Text("Rank",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontFamily: 'acme')),
                    SizedBox(width: width * 0.04),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*0.3,
              child: ListView.builder(
                padding: const EdgeInsets.all(9.0),
                shrinkWrap: true,
                itemCount: subcategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: width / 20,
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          color: Colors.black.withAlpha(80)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.c,
                        children: [
                          Container(
                              height: height / 20,
                              width: height / 12,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          subcategories[index].photo)))),
                          SizedBox(
                            width: width*0.2,
                            child: Text(
                              "Shubhadddddddd",
                              maxLines: 1,
                              style: RighteousMedium.copyWith(
                                  fontSize: height * 0.016,
                                  color: Colors.white,
                                  fontFamily: 'right'),
                            ),
                          ),
                          SizedBox(
                            width: width / 10,
                          ),
                          Text(
                            "2.2",
                            style: RighteousMedium.copyWith(
                                fontSize: height * 0.016,
                                color: Colors.white,
                                fontFamily: 'right'),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                                text: "${subcategories[index].win}",
                                style: RighteousMedium.copyWith(
                                    fontSize: height * 0.016,
                                    color: Colors.white,
                                    fontFamily: 'right')),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )


          ],
        ),
      ) ,
    );
  }
}
