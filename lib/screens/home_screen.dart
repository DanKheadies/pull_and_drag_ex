import 'package:flutter/material.dart';

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
  double topPad = 50;
  double bottPad = 30;
  double boardPad = 0; // 4 for 5; 3 for 6
  int squaresPerRow = 6;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double squareSize = (screenWidth - boardPad * 2) /
        (squaresPerRow * 1); // for 6 squares w/out padding

    return Scaffold(
      backgroundColor: Colors.brown,
      body: Padding(
        padding: EdgeInsets.only(
          top: topPad,
          bottom: bottPad,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: GameGrid(
                  boardPad: boardPad,
                  gridWidth: screenWidth,
                  squareSize: squareSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
