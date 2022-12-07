// import 'dart:async';

import 'package:flutter/material.dart';

// import './drag_and_drop.dart';

class GridUnit {
  final double left;
  final double top;
  final String color;

  const GridUnit({
    required this.left,
    required this.top,
    required this.color,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAD Ex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DragAndDrop(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double touchOpac = 1;
  String selectedColor = '';
  bool canDrag = true;
  double topPad = 50;
  double bottPad = 30;
  double boardPad = 0; // 4 for 5; 3 for 6
  int squaresPerRow = 6;

  List<GridUnit> grid = [];
  Map<String, GridUnit> grid2 = {};

  double posLeft = 0;
  double posTop = 0;

  void colorSelected(String color) {
    print('selected: $color');
    setState(() {
      selectedColor = color;
    });
  }

  void resetDraggables() {
    print('resetting');
    setState(() {
      selectedColor = '';
    });
  }

  void changePositions(
    Object obj,
    String current,
  ) {
    print('change position for: $obj');
    var tempGrid = Map<String, GridUnit>.from(grid2);
    var oldGrid = Map<String, GridUnit>.from(grid2); // old position
    tempGrid.removeWhere((key, value) => value.color != obj);
    print('$current is moving to ${tempGrid.values.first.color}');
    oldGrid.removeWhere((key, value) => value.color != current);
    print('should update ${oldGrid.values.first.color}');
    print(oldGrid.keys.first);
    grid2.update(
      // oldGrid.keys.first,
      '1x0',
      (value) => const GridUnit(
        // left: tempGrid.values.first.left,
        // top: tempGrid.values.first.top,
        // left: posLeft + (squareSize * 1) + (1 * boardPad),
        // top: posTop + (squareSize * 0) + (0 * boardPad),
        left: 0,
        top: 0,
        color: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenRatio = MediaQuery.of(context).size.aspectRatio;
    print(screenWidth);
    // print(screenHeight);
    // print(screenRatio);
    // final double squareSize = (screenWidth / 3.75);
    // final double squareSize =
    //     (screenWidth - boardPad * 2) / (squaresPerRow * 1.05); // for 5 squares w/ padding
    // final double squareSize =
    //     (screenWidth - boardPad * 2) / (squaresPerRow * 1.045); // for 6 squares w/ padding
    final double squareSize = (screenWidth - boardPad * 2) /
        (squaresPerRow * 1); // for 6 squares w/out padding
    // print(squareSize);

    // grid = [
    //   GridUnit(
    //     left: posLeft + (squareSize * 0) + (0 * boardPad),
    //     top: posTop + (squareSize * 0) + (0 * boardPad),
    //     color: 'pink',
    //   ),
    //   GridUnit(
    //     left: posLeft + (squareSize * 1) + (1 * boardPad),
    //     top: posTop + (squareSize * 0) + (0 * boardPad),
    //     color: 'red',
    //   ),
    //   GridUnit(
    //     left: posLeft + (squareSize * 2) + (2 * boardPad),
    //     top: posTop + (squareSize * 0) + (0 * boardPad),
    //     color: 'deepOrange',
    //   ),
    //   GridUnit(
    //     left: posLeft + (squareSize * 3) + (3 * boardPad),
    //     top: posTop + (squareSize * 0) + (0 * boardPad),
    //     color: 'orange',
    //   ),
    //   GridUnit(
    //     left: posLeft + (squareSize * 4) + (4 * boardPad),
    //     top: posTop + (squareSize * 0) + (0 * boardPad),
    //     color: 'yellow',
    //   ),
    // ];

    grid2 = {
      '0x0': GridUnit(
        left: posLeft + (squareSize * 0) + (0 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'pink',
      ),
      '1x0': GridUnit(
        left: posLeft + (squareSize * 1) + (1 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'red',
      ),
      '2x0': GridUnit(
        left: posLeft + (squareSize * 2) + (2 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'deepOrange',
      ),
      '3x0': GridUnit(
        left: posLeft + (squareSize * 3) + (3 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'orange',
      ),
      '4x0': GridUnit(
        left: posLeft + (squareSize * 4) + (4 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'yellow',
      ),
      '5x0': GridUnit(
        left: posLeft + (squareSize * 5) + (5 * boardPad),
        top: posTop + (squareSize * 0) + (0 * boardPad),
        color: 'black',
      ),
      // GridUnit(
      //   left: posLeft + (squareSize * 0) + (0 * boardPad),
      //   top: posTop + (squareSize * 0) + (0 * boardPad),
      // ),
      // GridUnit(
      //   left: posLeft + (squareSize * 1) + (1 * boardPad),
      //   top: posTop + (squareSize * 0) + (0 * boardPad),
      // ),
      // GridUnit(
      //   left: posLeft + (squareSize * 2) + (2 * boardPad),
      //   top: posTop + (squareSize * 0) + (0 * boardPad),
      // ),
      // GridUnit(
      //   left: posLeft + (squareSize * 3) + (3 * boardPad),
      //   top: posTop + (squareSize * 0) + (0 * boardPad),
      // ),
      // GridUnit(
      //   left: posLeft + (squareSize * 4) + (4 * boardPad),
      //   top: posTop + (squareSize * 0) + (0 * boardPad),
      // ),
    };

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
                child: Padding(
                  padding: EdgeInsets.all(boardPad),
                  child: Stack(
                    children: [
                      DragObject(
                        // left: posLeft + (squareSize * 0) + (0 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        // left: grid[0].left,
                        // top: grid[0].top,
                        left: grid2['0x0']!.left,
                        top: grid2['0x0']!.top,
                        size: squareSize,
                        dataColor: 'pink',
                        color: Colors.pink,
                        canAccept:
                            selectedColor != 'pink' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        // left: posLeft + (squareSize * 1) + (1 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        // left: grid[1].left,
                        // top: grid[1].top,
                        left: grid2['1x0']!.left,
                        top: grid2['1x0']!.top,
                        size: squareSize,
                        dataColor: 'red',
                        color: Colors.red,
                        canAccept:
                            selectedColor != 'red' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        // left: posLeft + (squareSize * 2) + (2 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        // left: grid[2].left,
                        // top: grid[2].top,
                        left: grid2['2x0']!.left,
                        top: grid2['2x0']!.top,
                        size: squareSize,
                        dataColor: 'deepOrange',
                        color: Colors.deepOrange,
                        canAccept: selectedColor != 'deepOrange' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        // left: posLeft + (squareSize * 3) + (3 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        // left: grid[3].left,
                        // top: grid[3].top,
                        left: grid2['3x0']!.left,
                        top: grid2['3x0']!.top,
                        size: squareSize,
                        dataColor: 'orange',
                        color: Colors.orange,
                        canAccept:
                            selectedColor != 'orange' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        // left: posLeft + (squareSize * 4) + (4 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        // left: grid[4].left,
                        // top: grid[4].top,
                        left: grid2['4x0']!.left,
                        top: grid2['4x0']!.top,
                        size: squareSize,
                        dataColor: 'yellow',
                        color: Colors.yellow,
                        canAccept:
                            selectedColor != 'yellow' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      // Test for 6 in a row
                      DragObject(
                        // left: posLeft + (squareSize * 5) + (5 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        left: grid2['5x0']!.left,
                        top: grid2['5x0']!.top,
                        size: squareSize,
                        dataColor: 'black',
                        color: Colors.black,
                        canAccept:
                            selectedColor != 'black' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 0) + (0 * boardPad),
                        top: posTop + (squareSize * 1) + (1 * boardPad),
                        size: squareSize,
                        dataColor: 'lime',
                        color: Colors.lime,
                        canAccept:
                            selectedColor != 'lime' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 1) + (1 * boardPad),
                        top: posTop + (squareSize * 1) + (1 * boardPad),
                        size: squareSize,
                        dataColor: 'green',
                        color: Colors.green,
                        canAccept:
                            selectedColor != 'green' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 2) + (2 * boardPad),
                        top: posTop + (squareSize * 1) + (1 * boardPad),
                        size: squareSize,
                        dataColor: 'teal',
                        color: Colors.teal,
                        canAccept:
                            selectedColor != 'teal' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 3) + (3 * boardPad),
                        top: posTop + (squareSize * 1) + (1 * boardPad),
                        size: squareSize,
                        dataColor: 'cyan',
                        color: Colors.cyan,
                        canAccept:
                            selectedColor != 'cyan' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 4) + (4 * boardPad),
                        top: posTop + (squareSize * 1) + (1 * boardPad),
                        size: squareSize,
                        dataColor: 'blue',
                        color: Colors.blue,
                        canAccept:
                            selectedColor != 'blue' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 0) + (0 * boardPad),
                        top: posTop + (squareSize * 2) + (2 * boardPad),
                        size: squareSize,
                        dataColor: 'blueGrey',
                        color: Colors.blueGrey,
                        canAccept:
                            selectedColor != 'blueGrey' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 1) + (1 * boardPad),
                        top: posTop + (squareSize * 2) + (2 * boardPad),
                        size: squareSize,
                        dataColor: 'blueAccent',
                        color: Colors.blueAccent,
                        canAccept: selectedColor != 'blueAccent' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 2) + (2 * boardPad),
                        top: posTop + (squareSize * 2) + (2 * boardPad),
                        size: squareSize,
                        dataColor: 'indigo',
                        color: Colors.indigo,
                        canAccept:
                            selectedColor != 'indigo' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 3) + (3 * boardPad),
                        top: posTop + (squareSize * 2) + (2 * boardPad),
                        size: squareSize,
                        dataColor: 'purple',
                        color: Colors.purple,
                        canAccept:
                            selectedColor != 'purple' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 4) + (4 * boardPad),
                        top: posTop + (squareSize * 2) + (2 * boardPad),
                        size: squareSize,
                        dataColor: 'deepPurple',
                        color: Colors.deepPurple,
                        canAccept: selectedColor != 'deepPurple' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 0) + (0 * boardPad),
                        top: posTop + (squareSize * 3) + (3 * boardPad),
                        size: squareSize,
                        dataColor: 'brown',
                        color: Colors.brown,
                        canAccept:
                            selectedColor != 'brown' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 1) + (1 * boardPad),
                        top: posTop + (squareSize * 3) + (3 * boardPad),
                        size: squareSize,
                        dataColor: 'grey',
                        color: Colors.grey,
                        canAccept:
                            selectedColor != 'grey' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 2) + (2 * boardPad),
                        top: posTop + (squareSize * 3) + (3 * boardPad),
                        size: squareSize,
                        dataColor: 'black',
                        color: Colors.black,
                        canAccept:
                            selectedColor != 'black' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 3) + (3 * boardPad),
                        top: posTop + (squareSize * 3) + (3 * boardPad),
                        size: squareSize,
                        dataColor: 'amber',
                        color: Colors.amber,
                        canAccept:
                            selectedColor != 'amber' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 4) + (4 * boardPad),
                        top: posTop + (squareSize * 3) + (3 * boardPad),
                        size: squareSize,
                        dataColor: 'pinkAccent',
                        color: Colors.pinkAccent,
                        canAccept: selectedColor != 'pinkAccent' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                      DragObject(
                        left: posLeft + (squareSize * 0) + (0 * boardPad),
                        top: posTop + (squareSize * 4) + (4 * boardPad),
                        size: squareSize,
                        dataColor: 'black54',
                        color: Colors.black54,
                        canAccept:
                            selectedColor != 'black54' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                        changePositions: changePositions,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DragObject extends StatelessWidget {
  const DragObject({
    Key? key,
    required this.left,
    required this.top,
    required this.size,
    required this.dataColor,
    required this.color,
    required this.canAccept,
    required this.canDrag,
    required this.onTapDown,
    required this.onTapUp,
    required this.changePositions,
  }) : super(key: key);

  final double left;
  final double top;
  final double size;
  final String dataColor;
  final Color color;
  final bool canAccept;
  final bool canDrag;
  final Function(String) onTapDown;
  final VoidCallback onTapUp;
  final Function(Object, String) changePositions;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: InkWell(
        onTapDown: (_) => onTapDown(dataColor),
        child: Stack(
          children: [
            canAccept
                ? DragTarget(
                    builder: ((context, candidateData, rejectedData) {
                      return Container(
                        height: size,
                        width: size,
                        // color: Colors.transparent,
                        color: color,
                      );
                    }),
                    onWillAccept: (data) {
                      print('$dataColor will accept $data');
                      changePositions(data ?? {}, dataColor);
                      return data == dataColor;
                    },
                    onAccept: (data) {
                      print('$dataColor accepted $data');
                    },
                    onLeave: (data) {
                      print('$data left $dataColor');
                    },
                  )
                : Draggable<String>(
                    data: dataColor,
                    feedback: Container(
                      height: size,
                      width: size,
                      color: color.withOpacity(0.666),
                    ),
                    childWhenDragging: Container(
                      height: size,
                      width: size,
                      color: color.withOpacity(0.333),
                    ),
                    onDragEnd: (_) => onTapUp(),
                    child: Container(
                      height: size,
                      width: size,
                      color: color,
                    ),
                  ),

            // Container(
            //   width: size,
            //   height: size,
            //   color: Colors.black,
            // ),
          ],
        ),
      ),
    );
  }
}
