import 'package:flutter/material.dart';

class BottomPanel extends StatelessWidget {
  final int score;
  final Function startGame;

  const BottomPanel({super.key, required this.score, required this.startGame});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.pink,
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Score: $score',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () => startGame(),
            child: const Text(
              'PLAY',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )),
        ],
      ),
    ));
  }
}
