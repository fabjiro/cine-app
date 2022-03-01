import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoIndicator extends StatelessWidget {
  const VideoIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      height: 10,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      ),
    );
  }
}
