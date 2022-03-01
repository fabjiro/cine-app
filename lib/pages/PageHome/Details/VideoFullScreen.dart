import 'dart:async';
import 'package:cineapp/DataVideo.dart';
import 'package:cineapp/pages/PageHome/Details/VideoBuilder.dart';
import 'package:cineapp/pages/PageHome/Details/VideoIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class VideoFullScreen extends StatefulWidget {
  VideoFullScreen({Key? key}) : super(key: key);

  @override
  State<VideoFullScreen> createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {
  Future setHorizontal() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // await Wakelock.enable();
  }

  Future restartOrientation() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    // await Wakelock.disable();
  }

  hideControls() {
    t = new Timer(Duration(seconds: 3), () {
      setState(() => showControls = false);
    });
  }

  @override
  void initState() {
    super.initState();
    setHorizontal();
    hideControls();
  }

  @override
  void dispose() {
    super.dispose();
    restartOrientation();
    if (t.isActive) {
      t.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                if (t.isActive) t.cancel();

                if (!videoController.value.isPlaying && showControls == true) {
                  return;
                }

                if (videoController.value.isPlaying) {
                  if (showControls == false) {
                    hideControls();
                    setState(() => showControls = true);
                  } else if (showControls == true) {
                    setState(() => showControls = false);
                  }
                  return;
                }
              },
              child: VideoBuilder(controller: videoController),
            ),
            Visibility(
              visible: showControls,
              child: Positioned(
                left: 20,
                top: 25,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showControls,
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      (t.isActive && videoController.value.isPlaying)
                          ? t.cancel()
                          : hideControls();
                      videoController.value.isPlaying
                          ? videoController.pause()
                          : videoController.play();

                      setState(() {});
                    },
                    child: videoController.value.isPlaying
                        ? Icon(
                            Icons.pause,
                            size: 30.sp,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 30.sp,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showControls,
              child: Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: VideoIndicator(
                        controller: videoController,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.fullscreen_exit,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
