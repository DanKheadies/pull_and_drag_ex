import 'dart:async';

import 'package:flutter/material.dart';

class Unit {
  final String color;
  final double left;
  final double top;

  const Unit({
    required this.color,
    required this.left,
    required this.top,
  });
}

class GridSwap extends StatefulWidget {
  const GridSwap({
    super.key,
  });

  @override
  State<GridSwap> createState() => _GridSwapState();
}

class _GridSwapState extends State<GridSwap> {
  double touchOpac = 1;
  String selectedColor = '';
  bool canDrag = true;
  double topPad = 50;
  double bottPad = 30;
  double boardPad = 0; // 4 for 5; 3 for 6
  int squaresPerRow = 6;

  // List<GridUnit> grid = [];
  // Map<String, GridUnit> grid2 = {};
  List<Unit> grid = [
    const Unit(
      color: 'red',
      left: 0,
      top: 0,
    ),
    const Unit(
      color: 'blue',
      left: 62,
      top: 0,
    ),
    const Unit(
      color: 'green',
      left: 124,
      top: 0,
    ),
    const Unit(
      color: 'black',
      left: 186,
      top: 0,
    ),
    const Unit(
      color: 'yellow',
      left: 0,
      top: 62,
    ),
    const Unit(
      color: 'purple',
      left: 62,
      top: 62,
    ),
    const Unit(
      color: 'orange',
      left: 124,
      top: 62,
    ),
    const Unit(
      color: 'teal',
      left: 186,
      top: 62,
    ),
  ];

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
    Object invading,
    String retreating,
  ) {
    print('status-pre:');
    grid.forEach((element) {
      print(element.color);
      print(element.left);
      print(element.top);
    });

    print('invading: $invading');
    int invIndex = grid.indexWhere((unit) => unit.color == invading);
    String invColor = grid[invIndex].color;
    double invLeft = grid[invIndex].left;
    double invTop = grid[invIndex].top;
    print(invIndex);
    print(invColor);
    print(invLeft);
    print(invTop);

    print('retreating: $retreating');
    int retIndex = grid.indexWhere((unit) => unit.color == retreating);
    String retColor = grid[retIndex].color;
    double retLeft = grid[retIndex].left;
    double retTop = grid[retIndex].top;
    print(retIndex);
    print(retColor);
    print(retLeft);
    print(retTop);

    setState(() {
      grid[invIndex] = Unit(
        color: retColor,
        left: invLeft,
        top: invTop,
      );
      grid[retIndex] = Unit(
        color: invColor,
        left: retLeft,
        top: retTop,
      );
    });

    print('status-post:');
    grid.forEach((element) {
      print(element.color);
      print(element.left);
      print(element.top);
    });

    // Timer(
    //   const Duration(milliseconds: 301),
    //   () {
    //     setState(() {
    //       grid[invIndex] = Unit(
    //         color: retColor,
    //         left: invLeft,
    //         top: invTop,
    //       );
    //       grid[retIndex] = Unit(
    //         color: invColor,
    //         left: retLeft,
    //         top: retTop,
    //       );
    //     });
    //   },
    // );
  }

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
                child: Padding(
                  padding: EdgeInsets.all(boardPad),
                  child: Stack(
                    children: [
                      DragObject(
                        // left: posLeft + (squareSize * 0) + (0 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        left:
                            grid[grid.indexWhere((unit) => unit.color == 'red')]
                                .left,
                        top:
                            grid[grid.indexWhere((unit) => unit.color == 'red')]
                                .top,
                        // left: grid2['0x0'] != null ? grid2['0x0']!.left : 0,
                        // top: grid2['0x0'] != null ? grid2['0x0']!.top : 0,
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
                        // left: posLeft + (squareSize * 1) + (1 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        left: grid[
                                grid.indexWhere((unit) => unit.color == 'blue')]
                            .left,
                        top: grid[
                                grid.indexWhere((unit) => unit.color == 'blue')]
                            .top,
                        // left: grid2['1x0'] != null ? grid2['1x0']!.left : 62,
                        // top: grid2['1x0'] != null ? grid2['1x0']!.top : 0,
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
                        // left: posLeft + (squareSize * 2) + (2 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        left: grid[grid
                                .indexWhere((unit) => unit.color == 'green')]
                            .left,
                        top: grid[grid
                                .indexWhere((unit) => unit.color == 'green')]
                            .top,
                        // left: grid2['2x0']!.left,
                        // top: grid2['2x0']!.top,
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
                        // left: posLeft + (squareSize * 3) + (3 * boardPad),
                        // top: posTop + (squareSize * 0) + (0 * boardPad),
                        left: grid[grid
                                .indexWhere((unit) => unit.color == 'black')]
                            .left,
                        top: grid[grid
                                .indexWhere((unit) => unit.color == 'black')]
                            .top,
                        // left: grid2['3x0']!.left,
                        // top: grid2['3x0']!.top,
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
                        left: grid[grid
                                .indexWhere((unit) => unit.color == 'yellow')]
                            .left,
                        top: grid[grid
                                .indexWhere((unit) => unit.color == 'yellow')]
                            .top,
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
                      DragObject(
                        left: grid[grid
                                .indexWhere((unit) => unit.color == 'purple')]
                            .left,
                        top: grid[grid
                                .indexWhere((unit) => unit.color == 'purple')]
                            .top,
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
                        left: grid[grid
                                .indexWhere((unit) => unit.color == 'orange')]
                            .left,
                        top: grid[grid
                                .indexWhere((unit) => unit.color == 'orange')]
                            .top,
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
                        left: grid[
                                grid.indexWhere((unit) => unit.color == 'teal')]
                            .left,
                        top: grid[
                                grid.indexWhere((unit) => unit.color == 'teal')]
                            .top,
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
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
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
                    onWillAccept: (incoming) {
                      // print(data);
                      // print('$dataColor will accept $incoming');
                      changePositions(incoming ?? {}, dataColor);
                      return incoming == dataColor;
                    },
                    onAccept: (data) {
                      // print('$dataColor accepted $data');
                    },
                    onLeave: (data) {
                      // print('$data left $dataColor');
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
