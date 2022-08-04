import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: tictac2()));
}

class tictac2 extends StatefulWidget {
  const tictac2({Key? key}) : super(key: key);

  @override
  State<tictac2> createState() => _tictac2State();
}

class _tictac2State extends State<tictac2> {
  String p1 = "X";
  String p2 = "0";
  String msg = "Game Is running";
  List<String> l = List.filled(10, "");
  int cnt = 0;
  int checkwin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic tac"),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: Text(
              msg,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
              child: Row(
            children: [abc(0), abc(1), abc(2)],
          )),
          Expanded(
              child: Row(
            children: [abc(3), abc(4), abc(5)],
          )),
          Expanded(
              child: Row(
            children: [abc(6), abc(7), abc(8)],
          )),
          ElevatedButton(
            onPressed: () {
              l = List.filled(9, "");
              cnt = 0;
              checkwin = 0;
              msg = "Game Is Running ";
              setState(() {});
            },
            child: Text(
              "Restart",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(
        child: InkWell(
      onTap: () {
        if (l[i] == "" && checkwin == 0) {
          if (cnt % 2 == 0) {
            l[i] = p1;
          } else {
            l[i] = p2;
          }
          cnt++;
          win();
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        color: Colors.black,
        margin: EdgeInsets.all(10),
        child: (Text(
          l[i],
          style: TextStyle(fontSize: 100, color: Colors.white),
        )),
      ),
    ));
  }

  void win() {
    if ((l[0] == "X" && l[1] == "X" && l[2] == "X") ||
        (l[3] == "X" && l[4] == "X" && l[5] == "X") ||
        (l[6] == "X" && l[7] == "X" && l[8] == "X") ||
        (l[0] == "X" && l[3] == "X" && l[6] == "X") ||
        (l[1] == "X" && l[4] == "X" && l[7] == "X") ||
        (l[2] == "X" && l[5] == "X" && l[8] == "X") ||
        (l[0] == "X" && l[4] == "X" && l[8] == "X") ||
        (l[2] == "X" && l[4] == "X" && l[6] == "X")) {
      msg = "$p1 Is win";
      checkwin = 1;
    } else if ((l[0] == "0" && l[1] == "0" && l[2] == "0") ||
        (l[3] == "0" && l[4] == "0" && l[5] == "0") ||
        (l[6] == "0" && l[7] == "0" && l[8] == "0") ||
        (l[0] == "0" && l[3] == "0" && l[6] == "0") ||
        (l[1] == "0" && l[4] == "0" && l[7] == "0") ||
        (l[2] == "0" && l[5] == "0" && l[8] == "0") ||
        (l[0] == "0" && l[4] == "0" && l[8] == "0") ||
        (l[2] == "0" && l[4] == "0" && l[6] == "0")) {
      msg = "$p2 Is win";
      checkwin = 1;
    } else if (cnt == 9) {
      msg = "Match Is Draw";
    }
  }
}
