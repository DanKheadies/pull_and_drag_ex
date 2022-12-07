import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({
    Key? key,
  }) : super(key: key);

  @override
  State<DragAndDrop> createState() => DragAndDropState();
}

class DragAndDropState extends State<DragAndDrop> {
  final List<DraggableGridItem> _listOfDraggableGridItem = [];

  @override
  void initState() {
    _generateImageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('D&D Ex'),
      ),
      body: SafeArea(
        child: DraggableGridViewBuilder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
          ),
          children: _listOfDraggableGridItem,
          dragCompletion: onDragAccept,
          isOnlyLongPress: false,
          dragFeedback: feedback,
          dragPlaceHolder: placeHolder,
        ),
      ),
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 9,
      child: list[index].child,
    );
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    log('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_1,
            color: Colors.pink,
          ),
          isDraggable: true,
          dragCallback: (context, isDragging) {
            log('isDragging: $isDragging');
          },
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_2,
            color: Colors.red,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_3,
            color: Colors.deepOrange,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_4,
            color: Colors.orange,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_5,
            color: Colors.yellow,
          ),
          isDraggable: false,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_6,
            color: Colors.green,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_7,
            color: Colors.teal,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_8,
            color: Colors.cyan,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_9,
            color: Colors.blue,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_10,
            color: Colors.indigo,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_11,
            color: Colors.purple,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_12,
            color: Colors.deepPurple,
          ),
          isDraggable: true,
        ),
        DraggableGridItem(
          child: GridItem(
            // image: Images.asset_13,
            color: Colors.black,
          ),
          isDraggable: true,
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    // required this.image,
    required this.color,
  }) : super(key: key);

  // final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8),
      // margin: const EdgeInsets.all(8),
      // child: Image.asset(
      //   image,
      //   fit: BoxFit.cover,
      // ),
      color: color,
    );
  }
}
