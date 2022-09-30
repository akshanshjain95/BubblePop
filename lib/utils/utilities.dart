import 'package:audioplayers/audioplayers.dart';

class Utilities {
  static List<int> generateList(int num) =>
      List.generate(num, (index) => identity(index));

  static T identity<T>(T x) => x;

  //Not making singleton and making instances on each call, as when a singleton
  //is created for audio player and multiple concurrent requests are received,
  //then since audio player instance is single, some requests are not served as
  //other requests are being played. Also, lag increases in playing a sound.
  static void play(String pathToFile,
      {bool isLowLatencyNeeded = true, Function? completionCallback}) {
    AudioCache audioCache = AudioCache();
    AudioPlayer audioPlayer = AudioPlayer();

    if (isLowLatencyNeeded) audioPlayer.setPlayerMode(PlayerMode.lowLatency);

    audioPlayer.audioCache = audioCache;

    AssetSource assetSource = AssetSource(pathToFile);

    if (completionCallback != null) {
      audioPlayer.onPlayerComplete.listen((event) {
        completionCallback();
      });
    }

    audioPlayer.play(assetSource);
  }
}
