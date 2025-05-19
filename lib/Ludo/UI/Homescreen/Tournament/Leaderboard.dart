import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/constant/images.dart';
import 'package:ludo_score/Ludo/UI/constant/style.dart';
import 'package:ludo_score/audio.dart';
import 'package:ludo_score/generated/assets.dart';

class Mymain {
  final String number;
  final String photo;
  final String title;
  final String win;

  Mymain(
    this.number,
    this.photo,
    this.title,
    this.win,
  );
}

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Audio.sound();
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("LEADERBOARD",
                style: RighteousMedium.copyWith(
                    fontSize: height * 0.028,
                    color: Colors.white,
                    fontFamily: 'acme'))),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesWalletone), fit: BoxFit.fill)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: height * 0.1,
                              width: width * 0.21,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.yellow, width: 2)),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 33,
                                  backgroundImage:
                                      AssetImage(subcategories[1].photo),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(30.0, 60, 0, 0),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Color(0xff112860),
                                  child: Text("#2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(subcategories[1].title,
                            // "Aman",
                            style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text("₹${subcategories[1].win}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: height * 0.14,
                              width: width * 0.26,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.yellow, width: 2)),
                              child: Center(
                                  child: CircleAvatar(
                                radius: 42,
                                backgroundImage:
                                    AssetImage(subcategories[0].photo),
                              )),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(37.0, 85, 0, 0),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Color(0xff112860),
                                  child: Text("#1",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(subcategories[0].title,
                            style: const TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        Text("₹${subcategories[0].win}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: height * 0.1,
                                width: width * 0.21,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.yellow, width: 2)),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 33,
                                    backgroundImage:
                                        AssetImage(subcategories[2].photo),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(30.0, 60, 0, 0),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xff112860),
                                    child: Text("#3",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(subcategories[2].title,
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          Text("₹${subcategories[2].win}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  height: height * 0.03,
                  width: width,
                  padding: const EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(180),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: width * 0.06),
                        const Text("RANK",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'acme')),
                        SizedBox(width: width * 0.04),
                        const Text("IMAGE",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'acme')),
                        SizedBox(width: width * 0.08),
                        const Text("NAME",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'acme')),
                        SizedBox(width: width * 0.1),
                        const Text("POINTS",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'acme')),
                        const Spacer(),
                        const Text("AMOUNT WON",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontFamily: 'acme')),
                        SizedBox(width: width * 0.04),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: height / 20,
                                  width: width / 14,
                                  child: Center(
                                      child: Text(
                                          "${subcategories[index].number}.",
                                          style: RighteousMedium.copyWith(
                                              fontSize: height * 0.019,
                                              color: Colors.white,
                                              fontFamily: 'right')))),
                              Container(
                                  height: height / 20,
                                  width: height / 12,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              subcategories[index].photo)))),
                              SizedBox(
                                width: height / 80,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: height / 20,
                                  width: width / 4,
                                  // color: Colors.teal,
                                  child: Text(
                                    subcategories[index].title,
                                    style: RighteousMedium.copyWith(
                                        fontSize: height * 0.019,
                                        color: Colors.white,
                                        fontFamily: 'right'),
                                  )),
                              Text(
                                "2.2",
                                style: RighteousMedium.copyWith(
                                    fontSize: height * 0.019,
                                    color: Colors.white,
                                    fontFamily: 'right'),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                    text: "₹${subcategories[index].win}",
                                    style: RighteousMedium.copyWith(
                                        fontSize: height * 0.019,
                                        color: Colors.white,
                                        fontFamily: 'right')),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
