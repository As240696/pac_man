import 'package:get/get.dart';
import 'constants.dart';

class Enemy3MovementController extends GetxController {
  var enemy3 = 88;
  var enemy3Direction = 'Right';

  void enemy3Movement() {
    switch (enemy3Direction) {
      case 'Right':
        if (!map.contains(enemy3 + 1)) {
          enemy3++;
        } else {
          enemy3Direction = 'Left';
        }
        break;
      case 'Left':
        if (!map.contains(enemy3 - 1)) {
          enemy3--;
        } else {
          enemy3Direction = 'Right';
        }
    }
  }
}
