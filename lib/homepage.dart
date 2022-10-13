import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pac_man/pixel.dart';
import 'package:pac_man/player.dart';
import 'enemy.dart';
import 'package:audioplayers/audioplayers.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void moveLeft() {
    if (!map.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!map.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!map.contains(player - 11)) {
      setState(() {
        player = player - 11;
      });
    }
  }

  void moveDown() {
    if (!map.contains(player + 11)) {
      setState(() {
        player = player + 11;
      });
    }
  }

  void enemy1MoveLeft() {
    setState(() {
      enemy1--;
      enemy1Direction = "left";
    });
  }

  void enemy1MoveRight() {
    setState(() {
      enemy1++;
      enemy1Direction = "right";
    });
  }

  void enemy1MoveUp() {
    setState(() {
      enemy1 -= 11;
      enemy1Direction = "up";
    });
  }

  void enemy1MoveDown() {
    setState(() {
      enemy1 += 11;
      enemy1Direction = "down";
    });
  }

  void enemy2MoveLeft() {
    setState(() {
      enemy2--;
      enemy2Direction = "left";
    });
  }

  void enemy2MoveRight() {
    setState(() {
      enemy2++;
      enemy2Direction = "right";
    });
  }

  void enemy2MoveUp() {
    setState(() {
      enemy2 -= 11;
      enemy2Direction = "up";
    });
  }

  void enemy2MoveDown() {
    setState(() {
      enemy2 += 11;
      enemy2Direction = "down";
    });
  }

  void enemy1Movement() {
    switch (enemy1Direction) {
      case "left":
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
      case "right":
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
      case "up":
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
      case "down":
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

  void enemy2Movement() {
    switch (enemy2Direction) {
      case "left":
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
      case "right":
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
      case "up":
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
      case "down":
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

  void enemy3Movement() {
    switch (enemy3Direction) {
      case 'right':
        if (!map.contains(enemy3 + 1)) {
          setState(() {
            enemy3++;
          });
        } else {
          setState(() {
            enemy3Direction = 'left';
          });
        }
        break;
      case 'left':
        if (!map.contains(enemy3 - 1)) {
          setState(() {
            enemy3--;
          });
        } else {
          setState(() {
            enemy3Direction = 'right';
          });
        }
    }
  }

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!map.contains(i)) {
        food.add(i);
      }
    }
    for (int i = 0; i < numberOfSquares; i++) {
      if (!map.contains(i)) {
        enemyP.add(i);
      }
    }
  }

  void startGame() {
    final chompingPlayer = AudioPlayer();
    final dyingPlayer = AudioPlayer();
    chompingPlayer.audioCache.load('assets_pacman_chomp.wav');
    dyingPlayer.audioCache.load('assets_pacman_death.wav');

    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      chompingPlayer.play(AssetSource('assets_pacman_chomp.wav'));
      if (food.contains(player)) {
        food.remove(player);
        score++;
      }

      if (player == enemy1 || player == enemy2 || player == enemy3) {
        chompingPlayer.stop();
        dyingPlayer.play(AssetSource('assets_pacman_death.wav'));
        setState(() {
          player = -1;
        });
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Center(child: Text("Game Over!")),
                content: Text("Your Score : $score"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        player = 166;
                        direction = "Right";
                        enemy1Direction = 'left';
                        enemy2Direction = 'down';
                        enemy3Direction = 'right';
                        score = 0;
                        enemy1 = 20;
                        enemy2 = 119;
                        enemy3 = 88;
                        food.clear();
                        getFood();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Play Again'),
                    ),
                  )
                ],
              );
            });
      }

      switch (direction) {
        case 'Left':
          moveLeft();
          break;
        case 'Right':
          moveRight();
          break;
        case 'Up':
          moveUp();
          break;
        case 'Down':
          moveDown();
          break;
        default:
      }
    });
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      enemy1Movement();
      enemy2Movement();
      enemy3Movement();
    });
  }

  @override
  void initState() {
    getFood();
    final startingPlayer = AudioPlayer();

    startingPlayer.audioCache.load('assets_pacman_beginning.wav');

    startingPlayer.play(AssetSource('assets_pacman_beginning.wav'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = 'Down';
                } else {
                  direction = 'Up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = 'Right';
                } else {
                  direction = 'Left';
                }
              },
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberOfColumns),
                  itemBuilder: (context, index) {
                    if (player == index) {
                      switch (direction) {
                        case 'Left':
                          return Transform.rotate(angle: pi, child: MyPlayer());

                        case 'Right':
                          return MyPlayer();

                        case 'Up':
                          return Transform.rotate(
                              angle: 3 * pi / 2, child: MyPlayer());

                        case 'Down':
                          return Transform.rotate(
                              angle: pi / 2, child: MyPlayer());

                        default:
                          return MyPlayer();
                      }
                    }
                    if (enemy1 == index) {
                      return MyEnemy1();
                    }
                    if (enemy2 == index) {
                      return MyEnemy2();
                    }
                    if (enemy3 == index) {
                      return MyEnemy3();
                    }
                    if (map.contains(index)) {
                      return MyPixel(
                        outerColor: Colors.blue[900],
                        innerColor: Colors.blue[800],
                        pixelSize: const EdgeInsets.all(1.0),
                      );
                    } else {
                      if (food.contains(index)) {
                        return MyPixel(
                          outerColor: Colors.black,
                          innerColor: Colors.yellow,
                          pixelSize: const EdgeInsets.all(10.0),
                        );
                      } else {
                        return MyPixel(
                          outerColor: Colors.black,
                          innerColor: Colors.black,
                          pixelSize: const EdgeInsets.all(10.0),
                        );
                      }
                    }
                  }),
            ),
          ),
          Expanded(
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
          )),
        ],
      ),
    );
  }
}
