import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectorAnimationLoad extends StatelessWidget {
  const SelectorAnimationLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,
        height: 7.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      ),
    );
  }
}
