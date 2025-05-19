import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Tournament/Leaderboard.dart';
import 'package:ludo_score/Ludo/UI/constant/style.dart';
import 'package:ludo_score/audio.dart';
import 'package:ludo_score/generated/assets.dart';

import '../../../../main.dart';

class LeaderBoardContest extends StatefulWidget {
  const LeaderBoardContest({super.key});

  @override
  State<LeaderBoardContest> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoardContest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blue.withOpacity(0.5),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Audio.sound();
                Navigator.pop(context);
              },
            ),
            backgroundColor: const Color(0xFF112860),
            centerTitle: true,
            title: Text("LEADERBOARD",
                style: RighteousMedium.copyWith(
                    fontSize: height * 0.028,
                    color: Colors.white,
                    fontFamily: 'acme'))),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0B1736), // Deeper Navy Blue
                Color(0xFF142D66), // Slightly less saturated blue
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text("TOP Player(Past 7 days)",
                    style: RighteousMedium.copyWith(
                        fontSize: height * 0.028,
                        color: Colors.white,
                        fontFamily: 'acme')),
                subtitle: Text("TOP Player(Past 7 days)",
                    style: RighteousMedium.copyWith(
                        fontSize: 11, color: Colors.white, fontFamily: 'acme')),
              ),
              Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: height * 0.2,
                          width: width,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF1C3D7E),
                                Color(0xFF3A68D7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text("Ludo Supream Shubham",
                                        style: RighteousMedium.copyWith(
                                            fontSize: height * 0.028,
                                            color: Colors.white,
                                            fontFamily: 'acme')),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Product()));
                                        },
                                        child: Row(
                                          children: [
                                            Text("VIEW ALL",
                                                style: RighteousMedium.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'acme')),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                                subtitle: Text("Player won big in Ludo Supreme League",
                                    style: RighteousMedium.copyWith(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontFamily: 'acme')),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(6, (index) => Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [

                                        const CircleAvatar(
                                          radius: 25,
                                          backgroundImage:AssetImage(Assets.imagesAvatar0) ,
                                        ),
                                        Text("Rank ${index+1}",
                                            style: RighteousMedium.copyWith(
                                                fontSize:12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'acme')),
                                        Text("user3244r",
                                            style: RighteousMedium.copyWith(
                                                fontSize: 11, color: Colors.white, fontFamily: 'acme')),
                                      ],
                                    ),
                                  )),
                                ),
                              ),

                              const SizedBox(height: 10,)

                            ],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
