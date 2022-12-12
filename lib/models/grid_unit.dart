class GridUnit {
  final String id;
  final String? data;
  final double left;
  final double top;

  const GridUnit({
    required this.id,
    this.data,
    required this.left,
    required this.top,
  });

  // static List<GridUnit> initializeGrid(
  //   double posLeft,
  //   double posTop,
  //   double squareSize,
  //   double boardPad,
  // ) {
  //   List<GridUnit> grid = [];
  //   grid = [
  //     GridUnit(
  //       id: '1',
  //       color: 'pink',
  //       left: posLeft + (squareSize * 0) + (boardPad * 0),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '2',
  //       color: 'red',
  //       left: posLeft + (squareSize * 1) + (boardPad * 1),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '3',
  //       color: 'deepOrange',
  //       left: posLeft + (squareSize * 2) + (boardPad * 2),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '4',
  //       color: 'orange',
  //       left: posLeft + (squareSize * 3) + (boardPad * 3),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '5',
  //       color: 'amber',
  //       left: posLeft + (squareSize * 4) + (boardPad * 4),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '6',
  //       color: 'yellow',
  //       left: posLeft + (squareSize * 5) + (boardPad * 5),
  //       top: posTop + (squareSize * 0) + (boardPad * 0),
  //     ),
  //     GridUnit(
  //       id: '7',
  //       color: 'lime',
  //       left: posLeft + (squareSize * 0) + (boardPad * 0),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '8',
  //       color: 'greenAccent',
  //       left: posLeft + (squareSize * 1) + (boardPad * 1),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '9',
  //       color: 'green',
  //       left: posLeft + (squareSize * 2) + (boardPad * 2),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '10',
  //       color: 'teal',
  //       left: posLeft + (squareSize * 3) + (boardPad * 3),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '11',
  //       color: 'cyan',
  //       left: posLeft + (squareSize * 4) + (boardPad * 4),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '12',
  //       color: 'lightBlue',
  //       left: posLeft + (squareSize * 5) + (boardPad * 5),
  //       top: posTop + (squareSize * 1) + (boardPad * 1),
  //     ),
  //     GridUnit(
  //       id: '13',
  //       color: 'blueAccent',
  //       left: posLeft + (squareSize * 0) + (boardPad * 0),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '14',
  //       color: 'blue',
  //       left: posLeft + (squareSize * 1) + (boardPad * 1),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '15',
  //       color: 'blueGrey',
  //       left: posLeft + (squareSize * 2) + (boardPad * 2),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '16',
  //       color: 'indigo',
  //       left: posLeft + (squareSize * 3) + (boardPad * 3),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '17',
  //       color: 'indigoAccent',
  //       left: posLeft + (squareSize * 4) + (boardPad * 4),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '18',
  //       color: 'purple',
  //       left: posLeft + (squareSize * 5) + (boardPad * 5),
  //       top: posTop + (squareSize * 2) + (boardPad * 2),
  //     ),
  //     GridUnit(
  //       id: '19',
  //       color: 'purpleAccent',
  //       left: posLeft + (squareSize * 0) + (boardPad * 0),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '20',
  //       color: 'deepPurple',
  //       left: posLeft + (squareSize * 1) + (boardPad * 1),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '21',
  //       color: 'deepPurpleAccent',
  //       left: posLeft + (squareSize * 2) + (boardPad * 2),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '22',
  //       color: 'brown',
  //       left: posLeft + (squareSize * 3) + (boardPad * 3),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '23',
  //       color: 'black',
  //       left: posLeft + (squareSize * 4) + (boardPad * 4),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '24',
  //       color: 'grey',
  //       left: posLeft + (squareSize * 5) + (boardPad * 5),
  //       top: posTop + (squareSize * 3) + (boardPad * 3),
  //     ),
  //     GridUnit(
  //       id: '25',
  //       color: 'pinkAccent',
  //       left: posLeft + (squareSize * 0) + (boardPad * 0),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //     GridUnit(
  //       id: '26',
  //       color: 'redAccent',
  //       left: posLeft + (squareSize * 1) + (boardPad * 1),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //     GridUnit(
  //       id: '27',
  //       color: 'deepOrangeAccent',
  //       left: posLeft + (squareSize * 2) + (boardPad * 2),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //     GridUnit(
  //       id: '28',
  //       color: 'orangeAccent',
  //       left: posLeft + (squareSize * 3) + (boardPad * 3),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //     GridUnit(
  //       id: '29',
  //       color: 'amberAccent',
  //       left: posLeft + (squareSize * 4) + (boardPad * 4),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //     GridUnit(
  //       id: '30',
  //       color: 'yellowAccent',
  //       left: posLeft + (squareSize * 5) + (boardPad * 5),
  //       top: posTop + (squareSize * 4) + (boardPad * 4),
  //     ),
  //   ];
  //   return grid;
  // }
}
