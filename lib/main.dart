import 'package:bingo_carvalho/widgets/bingo_grid.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BingoApp());
}

class BingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BingoScreen(),
    );
  }
}

class BingoScreen extends StatefulWidget {
  @override
  _BingoScreenState createState() => _BingoScreenState();
}

class _BingoScreenState extends State<BingoScreen> {
  List<int> numbers = [];

  void generateGrid() {
    setState(() {
      List<int> allNumbers = List.generate(75, (index) => index + 1);
      allNumbers.shuffle(Random());
      numbers = allNumbers.take(25).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bingo Carvalho Game"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade800,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple.shade700,
              child: Center(
                child: Text(
                  "REGRAS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: numbers.isEmpty
                  ? Center(
                      child: Text(
                        "Press the button to generate the grid",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : BingoGrid(numbers: numbers),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple.shade700,
              child: Center(
                child: ElevatedButton(
                  onPressed: generateGrid,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: Text(
                      "Generate Grid",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
