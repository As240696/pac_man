import 'package:get/get.dart';
import 'constants.dart';

class Enemy2MovementController extends GetxController {
  var enemy2 = 119;
  var enemy2Direction = 'Down';

  void enemy2Movement() {
    switch (enemy2Direction) {
      case "Left":
        if (!map.contains(enemy2 - 1)) {
          enemy2MoveLeft();
        } else {
          if (!map.contains(enemy2 + 11)) {
            enemy2MoveDown();
          } else if (!map.contains(enemy2 + 1)) {
            enemy2MoveRight();
          } else if (!map.contains(enemy2 - 11)) {
            enemy2MoveUp();
          }
        }
        break;
      case "Right":
        if (!map.contains(enemy2 + 1)) {
          enemy2MoveRight();
        } else {
          if (!map.contains(enemy2 - 11)) {
            enemy2MoveUp();
          } else if (!map.contains(enemy2 - 1)) {
            enemy2MoveLeft();
          } else if (!map.contains(enemy2 + 11)) {
            enemy2MoveDown();
          }
        }
        break;
      case "Up":
        if (!map.contains(enemy2 - 11)) {
          enemy2MoveUp();
        } else {
          if (!map.contains(enemy2 + 1)) {
            enemy2MoveRight();
          } else if (!map.contains(enemy2 - 1)) {
            enemy2MoveLeft();
          } else if (!map.contains(enemy2 + 11)) {
            enemy2MoveDown();
          }
        }
        break;
      case "Down":
        if (!map.contains(enemy2 + 11)) {
          enemy2MoveDown();
        } else {
          if (!map.contains(enemy2 - 1)) {
            enemy2MoveLeft();
          } else if (!map.contains(enemy2 + 1)) {
            enemy2MoveRight();
          } else if (!map.contains(enemy2 - 11)) {
            enemy2MoveUp();
          }
        }
        break;
    }
  }

  enemy2MoveLeft() {
    enemy2--;
    enemy2Direction = "Left";
  }

  enemy2MoveRight() {
    enemy2++;
    enemy2Direction = "Right";
  }

  enemy2MoveUp() {
    enemy2 -= 11;
    enemy2Direction = "Up";
  }

  enemy2MoveDown() {
    enemy2 += 11;
    enemy2Direction = "Down";
  }
}
