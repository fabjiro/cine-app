import 'package:card_swiper/card_swiper.dart';
import 'package:cineapp/constantes.dart';
import 'package:cineapp/data.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Proximamente extends StatefulWidget {
  Proximamente({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  final CustomThemeProvider themeProvider;

  @override
  _ProximamenteState createState() => _ProximamenteState();
}

class _ProximamenteState extends State<Proximamente> {
  late String _currenTitle;

  @override
  void initState() {
    super.initState();
    listProximamente.shuffle();
    _currenTitle = listProximamente[0].title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(paddingScreen),
            child: Text(
              "Proximamente",
              style: TextStyle(
                fontSize: 18.sp,
                color: widget.themeProvider.theme.textColor!.withOpacity(.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ), //Proximamente
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
                    onIndexChanged: (int value) {
                      setState(
                          () => _currenTitle = listProximamente[value].title);
                    },
                    itemCount: listProximamente.length,
                    itemWidth: 70.w,
                    layout: SwiperLayout.STACK,
                    autoplay: true,
                    autoplayDelay: 3000,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    listProximamente[index].portada,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.grey,
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
            child: Text(
              _currenTitle,
              style: TextStyle(
                fontSize: 16.sp,
                color: widget.themeProvider.theme.textColor!.withOpacity(.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
