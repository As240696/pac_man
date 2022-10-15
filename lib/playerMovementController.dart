import 'package:get/get.dart';
import 'constants.dart';

class PlayerMovementController extends GetxController {
  var player = 166;
  var direction = 'Right';

  void playerMovement() {
    switch (direction) {
      case 'Left':
        if (!map.contains(player - 1)) {
          player--;
          update();
        }
        break;
      case 'Right':
        if (!map.contains(player + 1)) {
          player = player + 1;
          update();
        }
        break;
      case 'Up':
        if (!map.contains(player - 11)) {
          player = player - 11;
          update();
        }
        break;
      case 'Down':
        if (!map.contains(player + 11)) {
          player = player + 11;
          update();
        }
        break;
      default:
    }
  }

  // moveLeft() {
  //   if (!map.contains(player - 1)) {
  //     player--;
  //     update();
  //   }
  // }
  //
  // moveRight() {
  //   if (!map.contains(player + 1)) {
  //     player = player + 1;
  //     update();
  //   }
  // }
  //
  // moveUp() {
  //   if (!map.contains(player - 11)) {
  //     player = player - 11;
  //     update();
  //   }
  // }
  //
  // moveDown() {
  //   if (!map.contains(player + 11)) {
  //     player = player + 11;
  //     update();
  //   }
  // }
}
