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

class BingoScreen extends StatelessWidget {
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
              child: BingoGrid(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple.shade700,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica do jogo
                  },
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
                      "Enter the game",
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

class BingoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> allNumbers = List.generate(75, (index) => index + 1);
    allNumbers.shuffle(Random());
    List<int> numbers = allNumbers.take(25).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade900,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.pink.shade300, width: 2),
          ),
          child: Center(
            child: Text(
              numbers[index].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
