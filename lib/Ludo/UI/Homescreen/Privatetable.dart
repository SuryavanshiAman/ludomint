import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/profile_view_model.dart';
import '../constant/images.dart';
import '../constant/modal/alreadyrun.dart';
import '../constant/style.dart';
import 'PlayWithFrnds/createroom_all.dart';


class Myprivate extends StatefulWidget {
  const Myprivate({super.key});



  @override
  State<Myprivate> createState() => _MyprivateState();
}

class _MyprivateState extends State<Myprivate> {

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("PLAY WITH FRIENDS", style: RighteousMedium.copyWith(fontSize: heights * 0.023, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        leading: IconButton(
            onPressed: () async {
              // viewprofile();
              Navigator.pop(context);
            },
            icon: Image.asset(
              AppAsset.buttonBtnClose2,
              height: 28,
              width: 60,
            )),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    setState(() {
                      // viewprofile();
                      Alreadyrunning;
                    });
                  },
                  icon: Image.asset(
                    AppAsset.imagesBtnRefresh,
                    height: 100,
                    width: 100,
                  )),
              Consumer<ProfileViewModel>(
                  builder: (context,profileVM,child) {
                    final profileData= profileVM.profileModelData;
                    return Text(profileData?.data?.wallet==null?"":"${profileData?.data?.wallet}",style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.black));
                  }
              ),




              const SizedBox(
                width: 20,
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: heights,
            child: const classicTwo())
            // child:  DiceGameScreen())
      ),
    );
  }
}


