import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  _GamePage createState() => _GamePage ();
}

class _GamePage extends State<GamePage> {
  bool maxTurn = true;
  int count = 0;
  String winner = '';
  List<int> matchedIndexes = [];
  List<IconButton> players = [max,charles];
  final board = List.generate(9,(_) => []);


  static var max = IconButton(
    onPressed: null,
    icon: Image.asset('assets/images/max.png'),);
  
  static var charles = IconButton(
    onPressed: null,
    icon: Image.asset('assets/images/charles.png'),);

  String winnername(var n) {
    if (n == max) {
      return 'Max verstappen';
    } else {
      return 'Charles leclerc';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  ),
                itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (maxTurn && board[index] == []) {
        board[index].add(max);
        count++;
      } else {
        board[index].add(charles);
        count++;
      }

      maxTurn = !maxTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Row 1
    if (board[0] == board[1] &&
        board[0] == board[2] &&
        board[0] != []) {
      setState(() {
        winner = winnername(board[0]);
      });
    }

    // Row 2
    if (board[3] == board[4] &&
        board[3] == board[5] &&
        board[3] != []) {
      setState(() {
        winner = winnername(board[3]);
      });
    }
  // row 3
  if (board[6] == board[7] &&
        board[6] == board[8] &&
        board[6] != []) {
      setState(() {
        winner = winnername(board[6]);
      });
    }

  if (board[0] == board[3] &&
        board[0] == board[6] &&
        board[0] != []) {
      setState(() {
        winner = winnername(board[0]);
      });
    }

  if (board[1] == board[4] &&
        board[1] == board[7] &&
        board[1] != []) {
      setState(() {
        winner = winnername(board[1]);
      });
    }
  
  if (board[2] == board[5] &&
        board[2] == board[8] &&
        board[2] != []) {
      setState(() {
        winner = winnername(board[2]);
      });
    }
  
  if (board[0] == board[4] &&
        board[0] == board[8] &&
        board[0] != []) {
      setState(() {
        winner = winnername(board[0]);
      });
    }
  }
}