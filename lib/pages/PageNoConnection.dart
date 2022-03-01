import 'package:cineapp/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PageNoConnection extends StatefulWidget {
  PageNoConnection({Key? key}) : super(key: key);

  @override
  State<PageNoConnection> createState() => _PageNoConnectionState();
}

class _PageNoConnectionState extends State<PageNoConnection> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<CustomThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/noconnection.json"),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 85.w,
                child: Text(
                  "Necesitamos una conexion a internet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              // btn
              Container(
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: themeProvider.theme.primario,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  child: Center(
                    child: Text(
                      "Reintentar",
                      style: TextStyle(
                        color: themeProvider.theme.textColorInvert,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
