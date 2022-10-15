import 'package:get/get.dart';
import 'constants.dart';

class Enemy1MovementController extends GetxController {
  var enemy1 = 20;
  var enemy1Direction = 'Left';

  void enemy1Movement() {
    switch (enemy1Direction) {
      case "Left":
        if (!map.contains(enemy1 - 1)) {
          enemy1MoveLeft();
        } else {
          if (!map.contains(enemy1 + 11)) {
            enemy1MoveDown();
          } else if (!map.contains(enemy1 + 1)) {
            enemy1MoveRight();
          } else if (!map.contains(enemy1 - 11)) {
            enemy1MoveUp();
          }
        }
        break;
      case "Right":
        if (!map.contains(enemy1 + 1)) {
          enemy1MoveRight();
        } else {
          if (!map.contains(enemy1 - 11)) {
            enemy1MoveUp();
          } else if (!map.contains(enemy1 + 11)) {
            enemy1MoveDown();
          } else if (!map.contains(enemy1 - 1)) {
            enemy1MoveLeft();
          }
        }
        break;
      case "Up":
        if (!map.contains(enemy1 - 11)) {
          enemy1MoveUp();
        } else {
          if (!map.contains(enemy1 + 1)) {
            enemy1MoveRight();
          } else if (!map.contains(enemy1 - 1)) {
            enemy1MoveLeft();
          } else if (!map.contains(enemy1 + 11)) {
            enemy1MoveDown();
          }
        }
        break;
      case "Down":
        if (!map.contains(enemy1 + 11)) {
          enemy1MoveDown();
        } else {
          if (!map.contains(enemy1 - 1)) {
            enemy1MoveLeft();
          } else if (!map.contains(enemy1 + 1)) {
            enemy1MoveRight();
          } else if (!map.contains(enemy1 - 11)) {
            enemy1MoveUp();
          }
        }
        break;
    }
  }

  enemy1MoveLeft() {
    enemy1--;
    update();
    enemy1Direction = "Left";
  }

  enemy1MoveRight() {
    enemy1++;
    update();
    enemy1Direction = "Right";
  }

  enemy1MoveUp() {
    enemy1 -= 11;
    update();
    enemy1Direction = "Up";
  }

  enemy1MoveDown() {
    enemy1 += 11;
    update();
    enemy1Direction = "Down";
  }
}
