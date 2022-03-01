import 'package:card_swiper/card_swiper.dart';
import 'package:cineapp/constantes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sizer/sizer.dart';

class ProximamenteAnimatioLoad extends StatelessWidget {
  const ProximamenteAnimatioLoad({
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
              width: 35.w,
              height: 3.2.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 4.5.w,
              ),
              Container(
                width: 95.w,
                height: 40.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingScreen),
                  child: Swiper(
                    onIndexChanged: (int value) {},
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    itemWidth: 70.w,
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50.w,
              height: 3.2.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
