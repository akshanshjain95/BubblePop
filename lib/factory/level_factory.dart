import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/level/LevelImpl.dart';

import '../level/level.dart';

class LevelFactory {

  static Level getLevel(String levelName, BuildContext context) {
    switch (levelName) {
      case "A": return LevelImpl(pathToLevelImage: "assets/images/letter_A.png", pathToLevelEndSound: "audio/a_audio.mp3", nextLevelName: "B", context: context);
      case "B": return LevelImpl(pathToLevelImage: "assets/images/letter_B.png", pathToLevelEndSound: "audio/b_audio.mp3", nextLevelName: "C", context: context);
      case "C": return LevelImpl(pathToLevelImage: "assets/images/letter_C.png", pathToLevelEndSound: "audio/c_audio.mp3", nextLevelName: "D", context: context);
      case "D": return LevelImpl(pathToLevelImage: "assets/images/letter_D.png", pathToLevelEndSound: "audio/d_audio.mp3", nextLevelName: "E", context: context);
      case "E": return LevelImpl(pathToLevelImage: "assets/images/letter_E.png", pathToLevelEndSound: "audio/e_audio.mp3", nextLevelName: "F", context: context);
      case "F": return LevelImpl(pathToLevelImage: "assets/images/letter_F.png", pathToLevelEndSound: "audio/f_audio.mp3", nextLevelName: "G", context: context);
      case "G": return LevelImpl(pathToLevelImage: "assets/images/letter_G.png", pathToLevelEndSound: "audio/g_audio.mp3", nextLevelName: "A", context: context);
      default: return LevelImpl(pathToLevelImage: "assets/images/letter_A.png", pathToLevelEndSound: "audio/a_audio.mp3", nextLevelName: "B", context: context);
    }
  }
}