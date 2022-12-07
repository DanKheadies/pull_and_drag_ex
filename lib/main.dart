import 'dart:async';

import 'package:flutter/material.dart';

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

  void colorSelected(String color) {
    print('selected: $color');
    setState(() {
      selectedColor = color;
    });
    // Timer(const Duration(seconds: 2), () {
    //   setState(() {
    //     canDrag = false;
    //   });
    // });
  }

  void resetDraggables() {
    print('resetting');
    setState(() {
      selectedColor = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final double squareSize = MediaQuery.of(context).size.width / 3.75;
    // print(squareSize);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      // Positioned(
                      //   left: 0,
                      //   top: 0,
                      //   child: Draggable<String>(
                      //     data: 'red',
                      //     feedback: Container(
                      //       height: 100,
                      //       width: 100,
                      //       color: Colors.red[700],
                      //     ),
                      //     childWhenDragging: Container(
                      //       height: 100,
                      //       width: 100,
                      //       color: Colors.red.withOpacity(0.5),
                      //     ),
                      //     child: Container(
                      //       height: 100,
                      //       width: 100,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ),
                      DragObject(
                        left: 0,
                        top: 0,
                        size: squareSize,
                        dataColor: 'pink',
                        color: Colors.pink,
                        canAccept:
                            selectedColor != 'pink' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 110,
                        top: 0,
                        size: squareSize,
                        dataColor: 'red',
                        color: Colors.red,
                        canAccept:
                            selectedColor != 'red' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 220,
                        top: 0,
                        size: squareSize,
                        dataColor: 'deepOrange',
                        color: Colors.deepOrange,
                        canAccept: selectedColor != 'deepOrange' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 0,
                        top: 110,
                        size: squareSize,
                        dataColor: 'orange',
                        color: Colors.orange,
                        canAccept:
                            selectedColor != 'orange' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 110,
                        top: 110,
                        size: squareSize,
                        dataColor: 'yellow',
                        color: Colors.yellow,
                        canAccept:
                            selectedColor != 'yellow' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 220,
                        top: 110,
                        size: squareSize,
                        dataColor: 'green',
                        color: Colors.green,
                        canAccept:
                            selectedColor != 'green' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 0,
                        top: 220,
                        size: squareSize,
                        dataColor: 'teal',
                        color: Colors.teal,
                        canAccept:
                            selectedColor != 'teal' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 110,
                        top: 220,
                        size: squareSize,
                        dataColor: 'cyan',
                        color: Colors.cyan,
                        canAccept:
                            selectedColor != 'cyan' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 220,
                        top: 220,
                        size: squareSize,
                        dataColor: 'blue',
                        color: Colors.blue,
                        canAccept:
                            selectedColor != 'blue' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 00,
                        top: 330,
                        size: squareSize,
                        dataColor: 'indigo',
                        color: Colors.indigo,
                        canAccept:
                            selectedColor != 'indigo' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 110,
                        top: 330,
                        size: squareSize,
                        dataColor: 'purple',
                        color: Colors.purple,
                        canAccept:
                            selectedColor != 'purple' && selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      DragObject(
                        left: 220,
                        top: 330,
                        size: squareSize,
                        dataColor: 'deepPurple',
                        color: Colors.deepPurple,
                        canAccept: selectedColor != 'deepPurple' &&
                            selectedColor != '',
                        canDrag: canDrag,
                        onTapDown: colorSelected,
                        onTapUp: resetDraggables,
                      ),
                      // Positioned(
                      //   left: 110,
                      //   top: 330,
                      //   child: DragTarget(
                      //     builder: ((context, candidateData, rejectedData) {
                      //       return Container(
                      //         height: squareSize,
                      //         width: squareSize,
                      //         color: Colors.purple,
                      //       );
                      //     }),
                      //     onWillAccept: (data) {
                      //       print('purple will accept $data');
                      //       return data == 'purple';
                      //     },
                      //     onAccept: (data) {
                      //       print('purple accepted $data');
                      //     },
                      //     onLeave: (data) {
                      //       print('$data left purple');
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Draggable<String>(
      //           data: 'red',
      //           feedback: Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.red[700],
      //           ),
      //           childWhenDragging: Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.red.withOpacity(0.5),
      //           ),
      //           child: Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.red,
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         DragTarget(
      //           builder: ((context, candidateData, rejectedData) {
      //             return Container(
      //               height: 100,
      //               width: 100,
      //               color: Colors.green,
      //             );
      //           }),
      //           onWillAccept: (data) {
      //             print('will accept: $data');
      //             return data == 'green';
      //           },
      //           onAccept: (data) {
      //             print('accepted: $data');
      //           },
      //           onLeave: (data) {
      //             print('on leave: $data');
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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

  @override
  Widget build(BuildContext context) {
    // print('$dataColor can accept: $canAccept');
    return Positioned(
      left: left,
      top: top,
      child: InkWell(
        onTapDown: (_) => onTapDown(dataColor),
        // onTapCancel: () => onTapUp,
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
