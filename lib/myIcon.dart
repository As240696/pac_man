import 'package:flutter/material.dart';

enum IconType {
  player,
  enemy1,
  enemy2,
  enemy3,
}

class MyIcon extends StatelessWidget {
  final icon;
  MyIcon({required this.icon});

  Widget getWidget(icon) {
    if (icon == IconType.player) {
      return Image.asset('lib/images/pacman.png');
    } else if (icon == IconType.enemy1) {
      return Image.asset('lib/images/enemy-1.png');
    } else if (icon == IconType.enemy2) {
      return Image.asset('lib/images/enemy-2.png');
    } else {
      return Image.asset('lib/images/enemy-3.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: getWidget(icon),
    );
  }
}
