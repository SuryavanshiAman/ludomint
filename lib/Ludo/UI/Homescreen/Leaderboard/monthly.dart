import 'package:flutter/material.dart';

import '../../constant/images.dart';
import '../../constant/style.dart';

class Mymain{
  final String number;
  final String photo;
  final String title;
  final String win;

  Mymain(this.number,this.photo,this.title,this.win,);
}


class Monthlyleader extends StatefulWidget {
  const Monthlyleader({super.key});

  @override
  State<Monthlyleader> createState() => _MonthlyleaderState();
}

class _MonthlyleaderState extends State<Monthlyleader> {

  List<Mymain> subcategories = [
    Mymain("1",AppAsset.imagesAvatar0, "jatt ji", "400"),
    Mymain("2",AppAsset.imagesAvatar1, "player56", "300"),


  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  SizedBox(
      height: height*0.40,
      // color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: subcategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  const EdgeInsets.all(9.0),
              child: Container(
                padding:  const EdgeInsets.all(8.0),
                width:width/20,
                height: height/15,
                decoration: BoxDecoration( borderRadius: const BorderRadius.all(Radius.circular(10)),color: Colors.blue[900]),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: height/20,
                        width: width/14,
                        child: Center(child: Text(subcategories[index].number,style: RighteousMedium.copyWith(fontSize: height * 0.019, color: Colors.white)))
                    ),
                    Container(
                        height: height/20,
                        width: height/12,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(subcategories[index].photo)))),
                    SizedBox(width: height/80,),
                    SizedBox(
                        height: height/20,
                        width: width/4,
                        // color: Colors.teal,
                        child: Center(child: RichText(text: TextSpan(text:subcategories[index].title, style: RighteousMedium.copyWith(fontSize: height* 0.019, color: Colors.white)),))
                    ),
                    const Spacer(),
                    RichText(text: TextSpan(text: subcategories[index].win, style: RighteousMedium.copyWith(fontSize: height* 0.019, color: Colors.white)),),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}
