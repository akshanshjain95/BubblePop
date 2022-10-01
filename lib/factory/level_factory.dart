import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/level/LevelImpl.dart';
import 'package:hello_flutter/model/level_config_model.dart';

import '../config/LevelConfig.dart';
import '../level/level.dart';

class LevelFactory {
  static Level getLevel(String levelName, BuildContext context) {
    LevelConfigModel? levelConfigModel =
        LevelConfig.levelConfig[levelName] ?? LevelConfig.defaultLevel;

    return LevelImpl(
        pathToLevelImage: levelConfigModel.pathToLevelImage,
        pathToLevelEndSound: levelConfigModel.pathToLevelEndSound,
        nextLevelName: levelConfigModel.nextLevelName,
        context: context);
  }
}
