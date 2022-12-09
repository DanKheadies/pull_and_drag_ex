import 'package:flutter/material.dart';

import 'package:pull_and_drag_ex/models/models.dart';
import 'package:pull_and_drag_ex/widgets/widgets.dart';

class GameGrid extends StatefulWidget {
  final double boardPad;
  final double gridWidth;
  final double squareSize;

  const GameGrid({
    super.key,
    required this.boardPad,
    required this.gridWidth,
    required this.squareSize,
  });

  @override
  State<GameGrid> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  double touchOpac = 1;
  String selectedColor = '';
  bool canDrag = true;

  // List<GridUnit> grid = [];
  // Map<String, GridUnit> grid2 = {};
  List<Unit> grid = [];

  double posLeft = 0;
  double posTop = 0;

  @override
  void initState() {
    super.initState();

    grid = [
      Unit(
        color: 'pink',
        left: posLeft + (widget.squareSize * 0) + (widget.boardPad * 0),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'red',
        left: posLeft + (widget.squareSize * 1) + (widget.boardPad * 1),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'deepOrange',
        left: posLeft + (widget.squareSize * 2) + (widget.boardPad * 2),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'orange',
        left: posLeft + (widget.squareSize * 3) + (widget.boardPad * 3),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'amber',
        left: posLeft + (widget.squareSize * 4) + (widget.boardPad * 4),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'yellow',
        left: posLeft + (widget.squareSize * 5) + (widget.boardPad * 5),
        top: posTop + (widget.squareSize * 0) + (widget.boardPad * 0),
      ),
      Unit(
        color: 'lime',
        left: posLeft + (widget.squareSize * 0) + (widget.boardPad * 0),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'greenAccent',
        left: posLeft + (widget.squareSize * 1) + (widget.boardPad * 1),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'green',
        left: posLeft + (widget.squareSize * 2) + (widget.boardPad * 2),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'teal',
        left: posLeft + (widget.squareSize * 3) + (widget.boardPad * 3),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'cyan',
        left: posLeft + (widget.squareSize * 4) + (widget.boardPad * 4),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'lightBlue',
        left: posLeft + (widget.squareSize * 5) + (widget.boardPad * 5),
        top: posTop + (widget.squareSize * 1) + (widget.boardPad * 1),
      ),
      Unit(
        color: 'blueAccent',
        left: posLeft + (widget.squareSize * 0) + (widget.boardPad * 0),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'blue',
        left: posLeft + (widget.squareSize * 1) + (widget.boardPad * 1),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'blueGrey',
        left: posLeft + (widget.squareSize * 2) + (widget.boardPad * 2),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'indigo',
        left: posLeft + (widget.squareSize * 3) + (widget.boardPad * 3),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'indigoAccent',
        left: posLeft + (widget.squareSize * 4) + (widget.boardPad * 4),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'purple',
        left: posLeft + (widget.squareSize * 5) + (widget.boardPad * 5),
        top: posTop + (widget.squareSize * 2) + (widget.boardPad * 2),
      ),
      Unit(
        color: 'purpleAccent',
        left: posLeft + (widget.squareSize * 0) + (widget.boardPad * 0),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'deepPurple',
        left: posLeft + (widget.squareSize * 1) + (widget.boardPad * 1),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'deepPurpleAccent',
        left: posLeft + (widget.squareSize * 2) + (widget.boardPad * 2),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'brown',
        left: posLeft + (widget.squareSize * 3) + (widget.boardPad * 3),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'black',
        left: posLeft + (widget.squareSize * 4) + (widget.boardPad * 4),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'grey',
        left: posLeft + (widget.squareSize * 5) + (widget.boardPad * 5),
        top: posTop + (widget.squareSize * 3) + (widget.boardPad * 3),
      ),
      Unit(
        color: 'pinkAccent',
        left: posLeft + (widget.squareSize * 0) + (widget.boardPad * 0),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
      Unit(
        color: 'redAccent',
        left: posLeft + (widget.squareSize * 1) + (widget.boardPad * 1),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
      Unit(
        color: 'deepOrangeAccent',
        left: posLeft + (widget.squareSize * 2) + (widget.boardPad * 2),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
      Unit(
        color: 'orangeAccent',
        left: posLeft + (widget.squareSize * 3) + (widget.boardPad * 3),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
      Unit(
        color: 'amberAccent',
        left: posLeft + (widget.squareSize * 4) + (widget.boardPad * 4),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
      Unit(
        color: 'yellowAccent',
        left: posLeft + (widget.squareSize * 5) + (widget.boardPad * 5),
        top: posTop + (widget.squareSize * 4) + (widget.boardPad * 4),
      ),
    ];
  }

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
    // print('status-pre:');
    // grid.forEach((element) {
    //   print(element.color);
    //   print(element.left);
    //   print(element.top);
    // });

    // print('invading: $invading');
    int invIndex = grid.indexWhere((unit) => unit.color == invading);
    String invColor = grid[invIndex].color;
    double invLeft = grid[invIndex].left;
    double invTop = grid[invIndex].top;
    // print(invIndex);
    // print(invColor);
    // print(invLeft);
    // print(invTop);

    // print('retreating: $retreating');
    int retIndex = grid.indexWhere((unit) => unit.color == retreating);
    String retColor = grid[retIndex].color;
    double retLeft = grid[retIndex].left;
    double retTop = grid[retIndex].top;
    // print(retIndex);
    // print(retColor);
    // print(retLeft);
    // print(retTop);

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

    // print('status-post:');
    // grid.forEach((element) {
    //   print(element.color);
    //   print(element.left);
    //   print(element.top);
    // });

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
    return Padding(
      padding: EdgeInsets.all(widget.boardPad),
      child: Stack(
        children: [
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'pink')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'pink')].top,
            size: widget.squareSize,
            dataColor: 'pink',
            color: Colors.pink,
            canAccept: selectedColor != 'pink' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'red')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'red')].top,
            size: widget.squareSize,
            dataColor: 'red',
            color: Colors.red,
            canAccept: selectedColor != 'red' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'deepOrange')]
                .left,
            top:
                grid[grid.indexWhere((unit) => unit.color == 'deepOrange')].top,
            size: widget.squareSize,
            dataColor: 'deepOrange',
            color: Colors.deepOrange,
            canAccept: selectedColor != 'deepOrange' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'orange')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'orange')].top,
            size: widget.squareSize,
            dataColor: 'orange',
            color: Colors.orange,
            canAccept: selectedColor != 'orange' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'amber')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'amber')].top,
            size: widget.squareSize,
            dataColor: 'amber',
            color: Colors.amber,
            canAccept: selectedColor != 'amber' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'yellow')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'yellow')].top,
            size: widget.squareSize,
            dataColor: 'yellow',
            color: Colors.yellow,
            canAccept: selectedColor != 'yellow' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'lime')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'lime')].top,
            size: widget.squareSize,
            dataColor: 'lime',
            color: Colors.lime,
            canAccept: selectedColor != 'lime' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'greenAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'greenAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'greenAccent',
            color: Colors.greenAccent,
            canAccept: selectedColor != 'greenAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'green')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'green')].top,
            size: widget.squareSize,
            dataColor: 'green',
            color: Colors.green,
            canAccept: selectedColor != 'green' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'teal')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'teal')].top,
            size: widget.squareSize,
            dataColor: 'teal',
            color: Colors.teal,
            canAccept: selectedColor != 'teal' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'cyan')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'cyan')].top,
            size: widget.squareSize,
            dataColor: 'cyan',
            color: Colors.cyan,
            canAccept: selectedColor != 'cyan' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left:
                grid[grid.indexWhere((unit) => unit.color == 'lightBlue')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'lightBlue')].top,
            size: widget.squareSize,
            dataColor: 'lightBlue',
            color: Colors.lightBlue,
            canAccept: selectedColor != 'lightBlue' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'blueAccent')]
                .left,
            top:
                grid[grid.indexWhere((unit) => unit.color == 'blueAccent')].top,
            size: widget.squareSize,
            dataColor: 'blueAccent',
            color: Colors.blueAccent,
            canAccept: selectedColor != 'blueAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'blue')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'blue')].top,
            size: widget.squareSize,
            dataColor: 'blue',
            color: Colors.blue,
            canAccept: selectedColor != 'blue' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left:
                grid[grid.indexWhere((unit) => unit.color == 'blueGrey')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'blueGrey')].top,
            size: widget.squareSize,
            dataColor: 'blueGrey',
            color: Colors.blueGrey,
            canAccept: selectedColor != 'blueGrey' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left:
                grid[grid.indexWhere((unit) => unit.color == 'blueGrey')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'blueGrey')].top,
            size: widget.squareSize,
            dataColor: 'blueGrey',
            color: Colors.blueGrey,
            canAccept: selectedColor != 'blueGrey' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'indigo')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'indigo')].top,
            size: widget.squareSize,
            dataColor: 'indigo',
            color: Colors.indigo,
            canAccept: selectedColor != 'indigo' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'indigoAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'indigoAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'indigoAccent',
            color: Colors.indigoAccent,
            canAccept: selectedColor != 'indigoAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'purple')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'purple')].top,
            size: widget.squareSize,
            dataColor: 'purple',
            color: Colors.purple,
            canAccept: selectedColor != 'purple' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'purpleAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'purpleAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'purpleAccent',
            color: Colors.purpleAccent,
            canAccept: selectedColor != 'purpleAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'deepPurple')]
                .left,
            top:
                grid[grid.indexWhere((unit) => unit.color == 'deepPurple')].top,
            size: widget.squareSize,
            dataColor: 'deepPurple',
            color: Colors.deepPurple,
            canAccept: selectedColor != 'deepPurple' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[
                    grid.indexWhere((unit) => unit.color == 'deepPurpleAccent')]
                .left,
            top: grid[
                    grid.indexWhere((unit) => unit.color == 'deepPurpleAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'deepPurpleAccent',
            color: Colors.deepPurpleAccent,
            canAccept:
                selectedColor != 'deepPurpleAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'brown')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'brown')].top,
            size: widget.squareSize,
            dataColor: 'brown',
            color: Colors.brown,
            canAccept: selectedColor != 'brown' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'black')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'black')].top,
            size: widget.squareSize,
            dataColor: 'black',
            color: Colors.black,
            canAccept: selectedColor != 'black' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'grey')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'grey')].top,
            size: widget.squareSize,
            dataColor: 'grey',
            color: Colors.grey,
            canAccept: selectedColor != 'grey' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'pinkAccent')]
                .left,
            top:
                grid[grid.indexWhere((unit) => unit.color == 'pinkAccent')].top,
            size: widget.squareSize,
            dataColor: 'pinkAccent',
            color: Colors.pinkAccent,
            canAccept: selectedColor != 'pinkAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left:
                grid[grid.indexWhere((unit) => unit.color == 'redAccent')].left,
            top: grid[grid.indexWhere((unit) => unit.color == 'redAccent')].top,
            size: widget.squareSize,
            dataColor: 'redAccent',
            color: Colors.redAccent,
            canAccept: selectedColor != 'redAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[
                    grid.indexWhere((unit) => unit.color == 'deepOrangeAccent')]
                .left,
            top: grid[
                    grid.indexWhere((unit) => unit.color == 'deepOrangeAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'deepOrangeAccent',
            color: Colors.deepOrangeAccent,
            canAccept:
                selectedColor != 'deepOrangeAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'orangeAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'orangeAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'orangeAccent',
            color: Colors.orangeAccent,
            canAccept: selectedColor != 'orangeAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'amberAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'amberAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'amberAccent',
            color: Colors.amberAccent,
            canAccept: selectedColor != 'amberAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
          DragObject(
            left: grid[grid.indexWhere((unit) => unit.color == 'yellowAccent')]
                .left,
            top: grid[grid.indexWhere((unit) => unit.color == 'yellowAccent')]
                .top,
            size: widget.squareSize,
            dataColor: 'yellowAccent',
            color: Colors.yellowAccent,
            canAccept: selectedColor != 'yellowAccent' && selectedColor != '',
            canDrag: canDrag,
            onTapDown: colorSelected,
            onTapUp: resetDraggables,
            changePositions: changePositions,
          ),
        ],
      ),
    );
  }
}
