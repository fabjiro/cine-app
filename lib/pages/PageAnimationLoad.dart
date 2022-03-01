import 'package:cineapp/LoadAnimation.dart';
import 'package:cineapp/pages/PageAnimationLoad/HeaderAnimationLoad.dart';
import 'package:cineapp/pages/PageAnimationLoad/ProximamenteAnimationLoad.dart';
import 'package:cineapp/pages/PageAnimationLoad/SelectorAnimationLoad.dart';
import 'package:cineapp/pages/PageAnimationLoad/TandasAnimationLoad.dart';
import 'package:flutter/material.dart';

class PageAnimationLoad extends StatefulWidget {
  PageAnimationLoad({Key? key}) : super(key: key);

  @override
  _PageAnimationLoadState createState() => _PageAnimationLoadState();
}

class _PageAnimationLoadState extends State<PageAnimationLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadAnimation(
          child: Column(
            children: [
              HeaderAnimationLoad(),
              SelectorAnimationLoad(),
              ProximamenteAnimatioLoad(),
              TandasAnimationLoad(),
            ],
          ),
        ),
      ),
    );
  }
}
