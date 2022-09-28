import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:hello_flutter/utils/utilities.dart';

class Bubble extends StatefulWidget {
  final int bubblesInRow;
  final int bubblesInColumn;

  const Bubble({required this.bubblesInRow, required this.bubblesInColumn});

  @override
  State<Bubble> createState() => BubbleState(bubblesInRow, bubblesInColumn);
}

class BubbleState extends State<Bubble> {
  final int bubblesInRow;
  final int bubblesInColumn;

  bool isPopped = false;

  BubbleState(this.bubblesInRow, this.bubblesInColumn);

  @override
  Widget build(BuildContext context) {
    if (isPopped) {
      Utilities.play("audio/pop_sound.mp3");

      return SizedBox(
          width: MediaQuery.of(context).size.width / bubblesInColumn,
          height: MediaQuery.of(context).size.height / bubblesInRow);
    } else {
      return Material(
          color: Colors.white.withOpacity(0.5),
          type: MaterialType.circle,
          child: InkWell(
              onTap: onTap,
              child: Image.asset('assets/images/t_buuble3.png',
                  width: MediaQuery.of(context).size.width / bubblesInColumn,
                  height: MediaQuery.of(context).size.height / bubblesInRow)));
    }
  }

  void onTap() {
    // Bubble should be popped only once.
    if (!isPopped) {
      setState(() {
        isPopped = true;
      });
    }
  }
}
