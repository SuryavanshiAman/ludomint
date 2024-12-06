import 'package:flutter/material.dart';

import '../../../../audio.dart';
import '../../constant/images.dart';
import '../../constant/style.dart';
import 'FriendlistINVITE.dart';
import 'acceptedINVITE.dart';
import 'addfrndINVITE.dart';


class Myinvite extends StatefulWidget {
     const Myinvite({super.key});

  @override
  State<Myinvite> createState() => _MyinviteState();
}

class _MyinviteState extends State<Myinvite>with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
                          Text("INVITE",style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white)),
                          SizedBox(height: heights/30),
                          DefaultTabController(
                            length: 3,
                            child: Container(
                              color: Colors.indigo.shade900,
                              child: TabBar(
                                indicator: BoxDecoration(color: Colors.red[800]),
                                controller: tabController,
                                tabs: [
                                  Tab(
                                    child: Text("Friends list",style: RighteousMedium.copyWith(fontSize: widths * 0.030, color: Colors.white)),
                                  ),
                                  Tab(
                                    child: Text("Accepted",style: RighteousMedium.copyWith(fontSize: widths* 0.030, color: Colors.white)),
                                  ),
                                  Tab(
                                    child: Text("Add friends",style: RighteousMedium.copyWith(fontSize: widths * 0.030, color: Colors.white),
                                    ),
                                  )],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heights/2.5,
                            // color: Colors.teal,
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              controller: tabController,
                              children: const [
                                      myfrndlist(),
                                      Myaccepted(),
                                      Myaddfrnd()
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
                    Audio.sound();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
      );
  }
}
