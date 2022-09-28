import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../bubble.dart';

class Utilities {

  static List<Widget> getRowsXColsBubbles(int rows, int cols) {
    return generateList(rows).map((row) {

      List<Bubble> rowChildren = generateList(cols).map((col) => Bubble(bubblesInRow: rows, bubblesInColumn: cols)).toList();

      return Row(children: rowChildren);
    }).toList();
  }

  static List<int> generateList(int num) => List.generate(num, (index) => identity(index));

  static T identity<T>(T x) => x;

  //Not making singleton and making instances on each call, as when a singleton
  //is created for audio player and multiple concurrent requests are received,
  //then since audio player instance is single, some requests are not served as
  //other requests are being played. Also, lag increases in playing a sound.
  static void play(String pathToFile) {
    AudioCache audioCache = AudioCache();
    AudioPlayer audioPlayer = AudioPlayer();

    audioPlayer.setPlayerMode(PlayerMode.lowLatency);

    audioPlayer.audioCache = audioCache;

    AssetSource assetSource = AssetSource(pathToFile);
    audioPlayer.play(assetSource);
  }
}