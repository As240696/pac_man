import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

import 'bottomPanel.dart';
import 'playerMovementController.dart';
import 'pixel.dart';
import 'myIcon.dart';
import 'constants.dart';
import 'enemy1MovementController.dart';
import 'enemy2MovementController.dart';
import 'enemy3MovementController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlayerMovementController playerMovementController =
      Get.put(PlayerMovementController());
  final Enemy1MovementController enemy1MovementController =
      Get.put(Enemy1MovementController());
  final Enemy2MovementController enemy2MovementController =
      Get.put(Enemy2MovementController());
  final Enemy3MovementController enemy3MovementController =
      Get.put(Enemy3MovementController());

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
      if (food.contains(playerMovementController.player)) {
        food.remove(playerMovementController.player);
        score++;
      }

      if (playerMovementController.player == enemy1MovementController.enemy1 ||
          playerMovementController.player == enemy2MovementController.enemy2 ||
          playerMovementController.player == enemy3MovementController.enemy3) {
        chompingPlayer.stop();
        dyingPlayer.play(AssetSource('assets_pacman_death.wav'));
        setState(() {
          playerMovementController.player = -1;
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
                        playerMovementController.player = 166;
                        playerMovementController.direction = "Right";
                        enemy1MovementController.enemy1Direction = 'Left';
                        enemy2MovementController.enemy2Direction = 'Down';
                        enemy3MovementController.enemy3Direction = 'Right';
                        score = 0;
                        enemy1MovementController.enemy1 = 20;
                        enemy2MovementController.enemy2 = 119;
                        enemy3MovementController.enemy3 = 88;
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

      playerMovementController.playerMovement();
      enemy1MovementController.enemy1Movement();
      enemy2MovementController.enemy2Movement();
      enemy3MovementController.enemy3Movement();
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
        body: GetBuilder<Enemy1MovementController>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0) {
                      playerMovementController.direction = 'Down';
                    } else {
                      playerMovementController.direction = 'Up';
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0) {
                      playerMovementController.direction = 'Right';
                    } else {
                      playerMovementController.direction = 'Left';
                    }
                  },
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberOfColumns),
                      itemBuilder: (context, index) {
                        if (playerMovementController.player == index) {
                          switch (playerMovementController.direction) {
                            case 'Left':
                              return Transform.rotate(
                                  angle: pi,
                                  child: MyIcon(icon: IconType.player));

                            case 'Right':
                              return MyIcon(icon: IconType.player);

                            case 'Up':
                              return Transform.rotate(
                                  angle: 3 * pi / 2,
                                  child: MyIcon(icon: IconType.player));

                            case 'Down':
                              return Transform.rotate(
                                  angle: pi / 2,
                                  child: MyIcon(icon: IconType.player));

                            default:
                              return MyIcon(icon: IconType.player);
                          }
                        }
                        if (enemy1MovementController.enemy1 == index) {
                          return MyIcon(icon: IconType.enemy1);
                        }
                        if (enemy2MovementController.enemy2 == index) {
                          return MyIcon(icon: IconType.enemy2);
                        }
                        if (enemy3MovementController.enemy3 == index) {
                          return MyIcon(icon: IconType.enemy3);
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
              BottomPanel(score: score, startGame: startGame),
            ],
          );
        }));
  }
}
