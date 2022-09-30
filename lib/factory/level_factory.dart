import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/level/LevelImpl.dart';

import '../level/level.dart';

class LevelFactory {

  static Level getLevel(String levelName, BuildContext context) {
    switch (levelName) {
      case "A": return LevelImpl(pathToLevelImage: "assets/images/letter_A.png", pathToLevelEndSound: "audio/a_audio.mp3", nextLevelName: "B", context: context);
      case "B": return LevelImpl(pathToLevelImage: "assets/images/letter_B.png", pathToLevelEndSound: "audio/b_audio.mp3", nextLevelName: "A", context: context);
      default: return LevelImpl(pathToLevelImage: "assets/images/letter_A.png", pathToLevelEndSound: "audio/a_audio.mp3", nextLevelName: "B", context: context);
    }
  }
}