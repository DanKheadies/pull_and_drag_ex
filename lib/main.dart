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

  @override
  Widget build(BuildContext context) {
    final double squareSize = MediaQuery.of(context).size.width / 3.75;
    print(squareSize);

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
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
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
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
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
                      ),
                      DragObject(
                        left: 110,
                        top: 0,
                        size: squareSize,
                        dataColor: 'red',
                        color: Colors.red,
                      ),
                      DragObject(
                        left: 220,
                        top: 0,
                        size: squareSize,
                        dataColor: 'deepOrange',
                        color: Colors.deepOrange,
                      ),
                      DragObject(
                        left: 0,
                        top: 110,
                        size: squareSize,
                        dataColor: 'orange',
                        color: Colors.orange,
                      ),
                      DragObject(
                        left: 110,
                        top: 110,
                        size: squareSize,
                        dataColor: 'yellow',
                        color: Colors.yellow,
                      ),
                      DragObject(
                        left: 220,
                        top: 110,
                        size: squareSize,
                        dataColor: 'green',
                        color: Colors.green,
                      ),
                      DragObject(
                        left: 0,
                        top: 220,
                        size: squareSize,
                        dataColor: 'teal',
                        color: Colors.teal,
                      ),
                      DragObject(
                        left: 110,
                        top: 220,
                        size: squareSize,
                        dataColor: 'cyan',
                        color: Colors.cyan,
                      ),
                      DragObject(
                        left: 220,
                        top: 220,
                        size: squareSize,
                        dataColor: 'blue',
                        color: Colors.blue,
                      ),
                      DragObject(
                        left: 00,
                        top: 330,
                        size: squareSize,
                        dataColor: 'indigo',
                        color: Colors.indigo,
                      ),
                      DragObject(
                        left: 110,
                        top: 330,
                        size: squareSize,
                        dataColor: 'purple',
                        color: Colors.purple,
                      ),
                      DragObject(
                        left: 220,
                        top: 330,
                        size: squareSize,
                        dataColor: 'deepPurple',
                        color: Colors.deepPurple,
                      ),
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
  }) : super(key: key);

  final double left;
  final double top;
  final double size;
  final String dataColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Stack(
        children: [
          DragTarget(
            builder: ((context, candidateData, rejectedData) {
              return Container(
                height: size,
                width: size,
                color: Colors.transparent,
              );
            }),
            onWillAccept: (data) {
              print('will accept: $data');
              return data == dataColor;
            },
            onAccept: (data) {
              print('accepted: $data');
            },
            onLeave: (data) {
              print('on leave: $data');
            },
          ),
          Draggable<String>(
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
            child: Container(
              height: size,
              width: size,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
