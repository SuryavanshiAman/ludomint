import 'package:ludo_score/Ludo/UI/Homescreen/Leaderboard/alltime.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/Leaderboard/weekly.dart';
import 'package:flutter/material.dart';

import '../../constant/images.dart';
import '../../constant/style.dart';
import 'daily.dart';
import 'monthly.dart';


class MyLeaderboard extends StatefulWidget {
  const MyLeaderboard({super.key});

  @override
  State<MyLeaderboard> createState() => _MyLeaderboardState();
}

class _MyLeaderboardState extends State<MyLeaderboard>with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {


    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        children: [
          Container(
              height: heights*0.6,
              width: widths*0.8,
              decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: heights/28),
                    Text("LEADERBOARD",style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                    SizedBox(height: heights/30),
                    DefaultTabController(
                      length: 4,
                      child: Container(

                        color: Colors.indigo.shade900,
                        child: TabBar(
                          indicator: BoxDecoration(color: Colors.red[800]),
                          controller: tabController,
                          tabs: [
                            Tab(
                              child: Text("Daily",style: RighteousMedium.copyWith(fontSize: widths * 0.027, color: Colors.white)),
                            ),
                            Tab(
                              child: Text("Weekly",style: RighteousMedium.copyWith(fontSize: widths* 0.027, color: Colors.white)),
                            ),
                            Tab(
                              child: Text("Monthly",style: RighteousMedium.copyWith(fontSize: widths * 0.027, color: Colors.white),
                              ),
                            ),
                            Tab(
                              child: Text("  All\nTime",style: RighteousMedium.copyWith(fontSize: widths * 0.027, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heights/2.5,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        controller: tabController,
                        children: const [
                          Dailyleader(),
                          Weeklyleader(),
                          Monthlyleader(),
                          Alltimeleader()
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),

          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              child: Image.asset(AppAsset.imagesCross, height: heights / 20),
              onTap: () {
                // Audio.sound();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
