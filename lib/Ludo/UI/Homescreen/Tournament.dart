import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Tournament/Leaderboard.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Tournament/details_contest_screen.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Tournament/my_network.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Tournament/no_player_contest_join.dart';
import 'package:ludo_score/ludo_provider.dart';
import 'package:provider/provider.dart';

import '../../../audio.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1736),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {
          Audio.sound();
          Navigator.pop(context);
        },),
        title:const Text(
          "Tournament",
          style: TextStyle(color: Colors.yellow,fontSize: 25,fontFamily: 'acme',decoration: TextDecoration.underline),
        ) ,
      ),
      body: Container(
          height: heights,
          width: widths,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0B1736),
                Color(0xFF142D66),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: heights * 0.15,
                margin: const EdgeInsets.all(12),
                width: widths,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/tournament.png"),
                        fit: BoxFit.fill)),
                child:  Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0,top: 3),
                      child: Text(
                        "1V1 BATTLE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: heights*0.016,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Prize Pool",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: heights*0.01,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xff112860),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text("20 Coins",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: heights*0.03),
                          height: heights*0.02,
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                          decoration: BoxDecoration(
                            color: const Color(0xff112860),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("00m 04s",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 12),),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Entry",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: heights*0.01,),
                            Consumer<LudoProvider>(
                              builder: (context,ludoP,_) {
                                return InkWell(
                                  onTap: (){
                                    ludoP.joinOrCreateContestRoom(context, "10");
                                  },
                                  child: Container(
                                      height:  30,
                                      // width: widths * 0.1,
                                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.green,
                                        boxShadow: const [
                                          BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                          color: Colors.green,
                                          // inset: true,
                                        ),
                                        ],
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Free",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                );
                              }
                            )

                          ],
                        ),
                      ],
                    ),
                    Container(
                      height:  heights*0.03,
                      margin: EdgeInsets.only(top: heights*0.01),
                      padding: EdgeInsets.only(left: widths*0.015),
                      decoration:  const BoxDecoration(
                          color: Color(0xff112860),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.people_outline,color: Colors.white,size: 20,),
                              SizedBox(width: widths*0.02,),
                              GestureDetector(
                                  onTap: (){
                                    Audio.sound();
                                    showDialog(context: context, builder: (context)=>const NoPlayerContestJoin());

                                  },
                                  child: const Text("23 Joined ",style: TextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.underline),)),
                            ],
                          ),
                          GestureDetector(onTap:(){
                            Audio.sound();
                            showDialog(context: context, builder: (context)=>const MyNetwork());
                          },child: const Text("My Network",style: TextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.underline),)),
                          const SizedBox(width: 1,),
                          InkWell(
                            onTap: (){
                              Audio.sound();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailsContestScreen()));
                            },
                            child: SizedBox(
                                width: widths*0.18,
                                height: heights*0.02,
                                child: const Text("Details",style: TextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.underline),)),
                          ),
                          InkWell(
                            onTap: (){
                              Audio.sound();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Product()));
                            },
                            child: SizedBox(
                                width: widths*0.21,
                                height: heights*0.02,
                                child: const Text("Leader Board ",style: TextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.underline),)),
                          ),




                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
