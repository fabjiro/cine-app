import 'package:animate_do/animate_do.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:cineapp/models/Mtandas.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EstrenoBanner extends StatelessWidget {
  const EstrenoBanner({
    Key? key,
    required this.itemTandas,
    required this.themeProvider,
  }) : super(key: key);

  final Mtandas itemTandas;
  final CustomThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: itemTandas.estreno,
      child: Positioned(
        right: 0,
        top: 40,
        child: FadeInRight(
          child: Container(
            width: 20.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 2,
              ),
              child: Center(
                child: Text(
                  "Estreno",
                  style: TextStyle(
                    color: themeProvider.theme.textColorInvert,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
