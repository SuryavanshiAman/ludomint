import 'dart:math';
import 'package:flutter/material.dart';


class DiceGameScreen extends StatefulWidget {
  @override
  _DiceGameScreenState createState() => _DiceGameScreenState();
}

class _DiceGameScreenState extends State<DiceGameScreen> {
  int numPlayers = 2;
  List<int> scores = List.filled(2, 0);

  void rollDice(int playerIndex) {
    setState(() {
      int rollResult = _rollDice();
      scores[playerIndex] += rollResult;

      // Check if the player's pawn is eliminated (for example, 1 in 6 chance)
      if (Random().nextInt(6) == 0) {
        eliminatePawn(playerIndex);
      }
    });
  }

  void eliminatePawn(int playerIndex) {
    setState(() {
      // Subtract points for pawn elimination
      scores[playerIndex] = (scores[playerIndex] - 5).clamp(0, scores[playerIndex]);
    });
  }

  int _rollDice() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Player 1 Score: ${scores[0]}',style: TextStyle(color: Colors.yellow),),
          Text('Player 2 Score: ${scores[1]}',style: TextStyle(color: Colors.white),),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => rollDice(0),
            child: Text('Roll Dice Player 1'),
          ),
          ElevatedButton(
            onPressed: () => rollDice(1),
            child: Text('Roll Dice Player 2'),
          ),
        ],
      ),
    );
  }
}
