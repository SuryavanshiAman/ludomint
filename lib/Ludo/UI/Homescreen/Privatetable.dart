import 'package:flutter/material.dart';

import '../constant/images.dart';
import '../constant/modal/alreadyrun.dart';
import '../constant/style.dart';
import 'PlayWithFrnds/createroom_all.dart';
import 'api/apiprofile.dart';


// class Category {
//   final String name;
//   final List<Subcategory> subcategories;
//
//   Category({required this.name, required this.subcategories});
// }
//

// class Subcategory{
//   final String photoone;
//   final String photo;
//   final String title;
//   final String titleone;
//   Subcategory({required this.photoone,required this.photo,required this.title,required this.titleone});
// }


class Myprivate extends StatefulWidget {
  const Myprivate({super.key});


  // final List<Category> categories = [
  //   Category(
  //     name: 'Create',
  //     subcategories: [
  //       Subcategory(photoone: AppAsset.buttonAddmoney,photo: AppAsset.buttonAddmoney,title: "₹150",titleone: "₹50" ),
  //       Subcategory(photoone: AppAsset.buttonAddmoney,photo: AppAsset.buttonAddmoney,title: "₹140",titleone: "₹40"),
  //       Subcategory(photoone: AppAsset.buttonAddmoney,photo: AppAsset.buttonAddmoney,title: "₹100",titleone: "₹30"),
  //       Subcategory(photoone: AppAsset.buttonAddmoney,photo: AppAsset.buttonAddmoney,title: "₹80",titleone: "₹20" ),
  //       Subcategory(photoone: AppAsset.buttonAddmoney,photo: AppAsset.buttonAddmoney,title: "₹50",titleone: "₹10"),
  //
  //     ],
  //   ),
  //   Category(
  //     name: 'Join',
  //     subcategories:[
  //
  //       ],
  //   ),
  // ];

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
              Text(
                // map == null ? balence : wallet + '/-',
              wallet == null?"":wallet + '/-',
                style: RighteousRegular.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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


