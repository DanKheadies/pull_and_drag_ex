// import 'dart:async';

import 'package:flutter/material.dart';

// import './drag_and_drop.dart';
import 'grid_no_swap.dart';
import 'grid_swap.dart';

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
      // home: const GridNoSwap(),
      home: const GridSwap(),
    );
  }
}
