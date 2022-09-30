import 'package:flutter/material.dart';

abstract class Level {
  String pathToLevelImage;
  String pathToLevelEndSound;

  String nextLevelName;

  BuildContext context;

  Level({required this.pathToLevelImage, required this.pathToLevelEndSound, required this.nextLevelName, required this.context});

  Widget init();
  void endLevel();
}