import 'package:cineapp/constantes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TandasAnimationLoad extends StatelessWidget {
  const TandasAnimationLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(paddingScreen),
            child: Container(
              width: 30.w,
              height: 3.2.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          ), //
          SizedBox(
            height: 5,
          ),
          Container(
            width: 100.w,
            height: 20.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: paddingScreen),
              itemCount: 4,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: paddingScreen,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 30.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
