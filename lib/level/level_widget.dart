import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/level/level.dart';

class LevelState extends StatefulWidget {
  final Level level;

  const LevelState({super.key, required this.level});

  @override
  State<StatefulWidget> createState() {
    return LevelWidget(level: level);
  }
}

class LevelWidget extends State<LevelState> {
  final Level level;

  LevelWidget({required this.level});

  @override
  Widget build(BuildContext context) {
    return level.init();
  }
}
