import 'package:hello_flutter/model/level_config_model.dart';

class LevelConfig {
  static Map<String, LevelConfigModel> levelConfig = {
    "A": createSingleLevelConfig("A", "B"),
    "B": createSingleLevelConfig("B", "C"),
    "C": createSingleLevelConfig("C", "D"),
    "D": createSingleLevelConfig("D", "E"),
    "E": createSingleLevelConfig("E", "F"),
    "F": createSingleLevelConfig("F", "G"),
    "G": createSingleLevelConfig("G", "A")
  };

  static LevelConfigModel defaultLevel = levelConfig["A"]!;

  static LevelConfigModel createSingleLevelConfig(
      String levelName, String nextLevelName) {
    return LevelConfigModel(
        pathToLevelImage: "assets/images/$levelName.png",
        pathToLevelEndSound: "audio/$levelName.mp3",
        nextLevelName: nextLevelName);
  }
}
