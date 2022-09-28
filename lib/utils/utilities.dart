import 'package:flutter/material.dart';

import '../bubble.dart';

class Utilities {

  static List<Widget> getRowsXColsBubbles(int rows, int cols) {
    print(rows);
    print(cols);
    return generateList(rows).map((row) {

      List<Bubble> rowChildren = generateList(cols).map((col) => Bubble(bubblesInRow: rows, bubblesInColumn: cols)).toList();

      return Row(children: rowChildren);
    }).toList();
  }

  static List<int> generateList(int num) => List.generate(num, (index) => identity(index));

  static T identity<T>(T x) => x;
}