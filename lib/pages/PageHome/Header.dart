import 'package:cineapp/constantes.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  final CustomThemeProvider themeProvider;

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
              Text(
                "Cine",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.theme.textColor,
                ),
              ),
              Text(
                "Siglo Nuevo",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.theme.textColor!.withOpacity(.75),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
