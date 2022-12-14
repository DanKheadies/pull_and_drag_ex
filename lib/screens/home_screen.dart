import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:pull_and_drag_ex/models/models.dart';
// import 'package:pull_and_drag_ex/screens/screens.dart';
import 'package:pull_and_drag_ex/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool resetGrid = false;
  double topPad = 50;
  double bottPad = 30;
  double boardPad = 0; // 4 for 5; 3 for 6
  int squaresPerRow = 6;
  int challenge = 0;
  int currentTurn = 0;
  List<int> roundWon = [0, 0, 0, 0, 0, 0];
  List<int> roundLimit = [0, 0, 0, 1, 3, 2];
  List<String> instruction = [
    'Move the white dot to the bottom right.',
    'Move the white dots into the 4 corners.',
    'Move the white dots to the center line.',
    'Move the white dot to the bottom in 1 turn.',
    'Move the white dots into the 4 corners in 2 turns.',
    'Move the white dots to the center line in 1 turn.',
  ];

  void turnTicker() {
    // Stop ticking when challenge is won.
    if (roundWon[challenge] != 1) {
      setState(() {
        currentTurn += 1;
      });
    }
  }

  void wonRound() {
    if (roundLimit[challenge] == 0) {
      setState(() {
        roundWon[challenge] = 1;
      });
    } else if (currentTurn <= roundLimit[challenge]) {
      setState(() {
        roundWon[challenge] = 1;
      });
    }
  }

  void unsetReset() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        resetGrid = false;
      });
    });
  }

  Widget _buildGameGrid(
    int chal,
    double width,
    double size,
    bool reset,
  ) {
    if (reset) {
      setState(() {
        resetGrid = false;
      });

      if (chal == 3) {
        return GameGrid0(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else if (chal == 4) {
        return GameGrid1(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else if (chal == 5) {
        return GameGrid2(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else {
        return GameGrid(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
        );
      }
    } else {
      if (chal == 0 || chal == 3) {
        return GameGrid0(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else if (chal == 1 || chal == 4) {
        return GameGrid1(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else if (chal == 2 || chal == 5) {
        return GameGrid2(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
          resetGameBoard: reset,
          unsetReset: unsetReset,
          turnsTicker: turnTicker,
          roundWon: wonRound,
        );
      } else {
        return GameGrid(
          boardPad: boardPad,
          gridWidth: width,
          squareSize: size,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double squareSize = (screenWidth - boardPad * 2) /
        (squaresPerRow * 1); // for 6 squares w/out padding

    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Padding(
        padding: EdgeInsets.only(
          top: topPad,
          bottom: bottPad,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Puzzles & David',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 25),
                    const Text('Turns'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$currentTurn',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(width: 5),
                        const Text('/'),
                        const SizedBox(width: 5),
                        (challenge == 3 || challenge == 4 || challenge == 5)
                            ? Text(
                                '${roundLimit[challenge]}',
                                style: Theme.of(context).textTheme.headline6,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.infinity,
                              ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        instruction[challenge],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    roundWon[challenge] == 1
                        ? challenge >= 5
                            ? const SizedBox(
                                height: 48,
                                child: Center(
                                  child: Text('Thanks for playing!'),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    challenge += 1;
                                    currentTurn = 0;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text('Huzzah! Next Challenge'),
                              )
                        : currentTurn >= roundLimit[challenge] &&
                                roundLimit[challenge] != 0
                            ? ElevatedButton(
                                onPressed: () {
                                  print('should reset level');
                                  print(challenge);
                                  setState(() {
                                    currentTurn = 0;
                                    resetGrid = true;
                                    // challenge =
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text('Try again!'),
                              )
                            : const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.white,
                child: _buildGameGrid(
                  challenge,
                  screenWidth,
                  squareSize,
                  resetGrid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
