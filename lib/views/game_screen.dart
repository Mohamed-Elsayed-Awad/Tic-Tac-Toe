import 'package:flutter/material.dart';
import 'package:tic_tac_toe_xo/widgets/custom_container.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = List.filled(9, "");
  int playerOneScore = 0;
  int playerTwoeScore = 0;
  late Arg arg;
  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)?.settings.arguments as Arg;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff3A7BD5),
            Color(0xff00D2FF),
          ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(44)),
                      child: Text(
                        "00:05",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 32),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Player 1's Turn",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: List.generate(
                              3,
                              (indexOfRow) => Expanded(
                                child: Row(
                                  children: List.generate(
                                    3,
                                    (indexOfContainer) {
                                      int index =
                                          indexOfRow * 3 + indexOfContainer;
                                      return GridTile(
                                        onClick: onClick,
                                        sympol: board[index],
                                        index: index,
                                        showBottomSide: indexOfRow < 2,
                                        showRightSide: indexOfContainer < 2,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  int counter = 0;
  void onClick(int index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      board[index] = arg.sympol;
    } else {
      board[index] = (arg.sympol == 'x') ? 'o' : 'x';
    }
    if (checkWinner("x")) {
      playerOneScore += 1;
      Future.delayed(Duration(milliseconds: 3000), reset);
    } else if (checkWinner("o")) {
      playerTwoeScore += 1;
      Future.delayed(Duration(milliseconds: 3000), reset);
    }
    (boardIsFull) => Future.delayed(Duration(milliseconds: 3000), reset);

    counter++;
    setState(() {});
  }

  bool boardIsFull() {
    return board.every((element) => element != '');
  }

  void reset() {
    board = List.filled(9, "");
    counter = 0;
    setState(() {});
  }

  checkWinner(String sympol) {
    List<List<int>> checkWinnerList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    return checkWinnerList.any(
        (winningCase) => winningCase.every((index) => board[index] == sympol));
  }
}

class GridTile extends StatelessWidget {
  const GridTile({
    super.key,
    required this.showRightSide,
    required this.showBottomSide,
    required this.index,
    required this.sympol,
    required this.onClick,
  });

  final int index;
  final void Function(int)? onClick;
  final String sympol;
  final bool showRightSide;
  final bool showBottomSide;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onClick!(index);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  bottom: showBottomSide
                      ? BorderSide(color: Colors.black)
                      : BorderSide.none,
                  right: showRightSide
                      ? BorderSide(color: Colors.black)
                      : BorderSide.none)),
          child: sympol.isNotEmpty
              ? Image.asset(
                  "assets/$sympol.png",
                  scale: 3.5,
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
