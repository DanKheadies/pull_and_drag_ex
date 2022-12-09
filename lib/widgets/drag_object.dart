import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
