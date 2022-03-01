import 'package:cineapp/dio.dart';
import 'package:cineapp/pages/PageMain.dart';
import 'package:cineapp/pages/PageNoConnection.dart';
import 'package:cineapp/sharedPreferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Providers/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceShared().initPref();
  dio = new Dio(
    BaseOptions(baseUrl: "https://cinefabjiro.herokuapp.com/"),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CustomThemeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomThemeProvider themeProvider =
        Provider.of<CustomThemeProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: themeProvider.theme.brightnessColor,
      ),
    );

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Cine App',
          theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.theme.fondo,
            primaryColor: themeProvider.theme.primario,
            textTheme: TextTheme(
              bodyText1: GoogleFonts.varelaRound(),
              bodyText2: GoogleFonts.varelaRound(),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: 'main',
          routes: {
            'main': (_) => MainPage(),
            'noconnection': (_) => PageNoConnection(),
          },
        );
      },
    );
  }
}
