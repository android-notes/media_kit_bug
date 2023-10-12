
import 'package:flutter/material.dart';

// Make sure to add following packages to pubspec.yaml:
// * media_kit
// * media_kit_video
// * media_kit_libs_video
import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart'; // Provides [VideoController] & [Video] etc.

class VideoPlayerScreen extends StatefulWidget {
  String assetVideo;

  VideoPlayerScreen({super.key, required this.assetVideo});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    updateVideo(widget.assetVideo);
  }

  void updateVideo(String assetVideo) {
    player.open(Media(assetVideo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Use [Video] widget to display video output.
          child: Video(controller: controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  void didUpdateWidget(VideoPlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 在widget更新时检查assetVideo是否改变，如果改变了就更新视频
    if (widget.assetVideo != oldWidget.assetVideo) {
      updateVideo(widget.assetVideo);
    }
  }
}
