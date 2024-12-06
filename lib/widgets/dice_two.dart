// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ludomint/constants.dart';
// import 'package:ludomint/ludo_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:simple_ripple_animation/simple_ripple_animation.dart';
//
// /// Widget for the second dice
// class SecondDiceWidget extends StatelessWidget {
//   const SecondDiceWidget({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LudoProvider>(
//       builder: (context, value, child) => RippleAnimation(
//         color: value.gameState == LudoGameState.throwDice ? value.currentPlayer.color : Colors.white.withOpacity(0),
//         ripplesCount: 3,
//         minRadius: 30,
//         repeat: true,
//         child: CupertinoButton(
//           onPressed: () {
//             if (!value.secondDiceStarted) {
//               value.throwDice();
//             }          },
//           padding: const EdgeInsets.only(),
//           child: value.secondDiceStarted
//               ? Image.asset("assets/images/dice.gif", fit: BoxFit.contain)
//               : Image.asset("assets/images/dice/${value.secondDiceResult}.png", fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }