
import 'package:flutter/material.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:ludomint/constants.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/main.dart';
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
              Utils.flushBarErrorMessage("First move pawn", context, Colors.white);
            }
          } else {
            print("Aman");
            Utils.flushBarErrorMessage("Its not your turn", context, Colors.white);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height:height * 0.08,
          width:width * 0.19,
          padding: EdgeInsets.only(left:width*0.025 ),

          child: ludoProvider.diceStarted
              ? Image.asset(
            "assets/images/dice.gif",
            height: height * 0.06,
            width:width * 0.17,
          )
              : Image.asset(
            "assets/images/dice/${ludoProvider.diceResult}.png",
            height: height * 0.06,
            width: width * 0.17,
          ),
        ),
      ),
    );
  }
}
