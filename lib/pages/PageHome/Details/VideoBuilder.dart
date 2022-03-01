import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBuilder extends StatelessWidget {
  const VideoBuilder({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
