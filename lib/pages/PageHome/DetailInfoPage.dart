import 'dart:async';

import 'package:cineapp/DataVideo.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:cineapp/pages/PageHome/Details/VideoFullScreen.dart';
import 'package:cineapp/models/Mtandas.dart';
import 'package:cineapp/pages/PageHome/Details/VideoBuilder.dart';
import 'package:cineapp/pages/PageHome/Details/VideoIndicator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class DetailInfoPage extends StatefulWidget {
  const DetailInfoPage({
    Key? key,
    required this.themeProvider,
    required this.itemTandas,
  }) : super(key: key);

  final CustomThemeProvider themeProvider;
  final Mtandas itemTandas;

  @override
  _DetailInfoPageState createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage>
    with AutomaticKeepAliveClientMixin {
  bool firstLoad = true;

  hideControls() {
    t = new Timer(Duration(seconds: 3), () {
      setState(() => showControls = false);
    });
  }

  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.itemTandas.title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              widget.itemTandas.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(.7),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Trailer",
              style: TextStyle(
                fontSize: 20.sp,
                color: widget.themeProvider.theme.textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            firstLoad
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        firstLoad = false;
                        videoController = VideoPlayerController.network(
                            widget.itemTandas.trailer)
                          ..addListener(() => setState(() {}))
                          ..setLooping(true)
                          ..initialize().then((value) {
                            videoController.play();
                            hideControls();
                          });
                      },
                      child: Container(
                        width: 90.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 70.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (t.isActive) t.cancel();

                          if (!videoController.value.isPlaying &&
                              showControls == true) {
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoFullScreen()),
                                ),
                                child: Icon(
                                  Icons.fullscreen,
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
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
