import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomThemeProvider with ChangeNotifier {
  CustomTheme theme = CustomThemes().temaClaro;
}

class CustomThemes {
  get temaClaro => CustomTheme(
        fondo: Color(0XFFf1f1f0),
        primario: Color(0XFF30475E),
        cardColor: Colors.white,
        textColor: Colors.black,
        textColorInvert: Colors.white,
        brightnessColor: Brightness.dark,
      );
  get temaOscuro => CustomTheme(
        fondo: Color(0XFF041C32),
        primario: Color(0XFFFFC600),
        cardColor: Color(0XFF064663),
        textColor: Colors.white,
        textColorInvert: Colors.black,
        brightnessColor: Brightness.light,
      );
}

class CustomTheme {
  Color? fondo;
  Color? primario;
  Color? textColor;
  Color? textColorInvert;
  Color? cardColor;
  Brightness? brightnessColor;

  CustomTheme({
    this.fondo,
    this.primario,
    this.textColor,
    this.textColorInvert,
    this.brightnessColor,
    this.cardColor,
  });
}
