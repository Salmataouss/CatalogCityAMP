import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  void togglePlayButton(VideoPlayerController c) {
    if (c.value.isPlaying) {
      c.pause();
    } else {
      c.play();
    }
    update();
  }

  bool isPlaying(VideoPlayerController c) {
    return c.value.isPlaying;
  }

  bool isMute(VideoPlayerController c) {
    return c.value.volume == 0.0;
  }

  void toggleVolume(VideoPlayerController c) {
    if (c.value.volume == 0.0) {
      c.setVolume(1.0);
    } else {
      c.setVolume(0.0);
    }
    update();
  }
}
