
import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/constant/utilll.dart';
import 'package:ludo_score/constants.dart';
import 'package:ludo_score/generated/assets.dart';
import 'package:ludo_score/ludo_provider.dart';
import 'package:ludo_score/main.dart';
import 'package:ludo_score/widgets/image_tost.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';


class DiceWidget extends StatelessWidget {
  const DiceWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    final ludoProvider = context.watch<LudoProvider>();
    print(ludoProvider.currentPlayer.color);
    return RippleAnimation(
      color: ludoProvider.gameState == LudoGameState.throwDice
          ? ludoProvider.currentPlayer.color
          : Colors.white.withOpacity(0),
      ripplesCount: 3,
      minRadius: 30,
      repeat: true,
      child: InkWell(
        onTap: () {
          print("AmanJoin${ludoProvider.fieldKey}");
          print("AmanludoProvider${ludoProvider.currentDiceIndex}");
          if (ludoProvider.fieldKey == ludoProvider.currentDiceIndex) { /// original
            if (!ludoProvider.diceStarted && !ludoProvider.stopDice) {
              print("Aman${ludoProvider.fieldKey}");
              ludoProvider.throwDice(context);
            }else{
              ImageToast.show(
                  imagePath: Assets.imagesTextArea,
                  height: height * 0.08,
                  width: width * 0.6,
                  context: context,
                  text: "First move pawn");
            }
          } else {
            print("Aman");
            ImageToast.show(
                imagePath: Assets.imagesTextArea,
                height: height * 0.08,
                width: width * 0.6,
                context: context,
                text: "It's not your turn");
          }
        },
        child: Container(
          alignment: Alignment.center,
          height:height * 0.06,
          width:width * 0.24,
          decoration: BoxDecoration(
              // color: Colors.red,
            image: DecorationImage(image: AssetImage(
                ludoProvider.diceStarted?  "assets/images/dice.gif"
                    : "assets/images/dice/${ludoProvider.diceResult}.png",



            ))
          ),

          // padding: EdgeInsets.only(left:width*0.025 ),
          // child: ludoProvider.diceStarted
          //     ? Image.asset(
          //
          //   // height: height,
          //   // width:width * 0.17,
          // )
          //     : Image.asset(
          //
          //   // height: height * 0.06,
          //   // width: width * 0.17,
          // ),
        ),
      ),
    );
  }
}
