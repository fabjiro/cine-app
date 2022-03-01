import 'package:cineapp/constantes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderAnimationLoad extends StatelessWidget {
  const HeaderAnimationLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 10.h,
      padding: EdgeInsets.only(
        top: paddingScreen,
        left: paddingScreen,
        right: paddingScreen,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20.w,
                height: 3.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 40.w,
                height: 3.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
