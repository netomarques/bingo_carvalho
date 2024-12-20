import 'package:flutter/material.dart';

class BingoGrid extends StatelessWidget {
  final List<int> numbers;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final Color backgroundColor;
  final Color borderColor;

  const BingoGrid({
    Key? key,
    required this.numbers,
    this.crossAxisCount = 5,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.backgroundColor = const Color(0xFF4A148C), // Purple shade 900
    this.borderColor = const Color(0xFFF06292), // Pink shade 300
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) => _buildGridItem(numbers[index]),
    );
  }

  _buildGridItem(int number) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
