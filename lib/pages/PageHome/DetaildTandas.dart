import 'package:cineapp/Providers/theme.dart';
import 'package:cineapp/models/Mtandas.dart';
import 'package:cineapp/pages/PageHome/Details/BackBtn.dart';
import 'package:cineapp/pages/PageHome/Details/EstrenoBanner.dart';
import 'package:cineapp/pages/PageHome/Details/FondoPortada.dart';
import 'package:cineapp/pages/PageHome/Details/SladingPanel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailTandas extends StatefulWidget {
  DetailTandas({
    Key? key,
    required this.itemTandas,
  }) : super(key: key);

  final Mtandas itemTandas;
  @override
  State<DetailTandas> createState() => _DetailTandasState();
}

class _DetailTandasState extends State<DetailTandas> {
  PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<CustomThemeProvider>(context);
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: <Widget>[
            FondoPortada(
              itemTandas: widget.itemTandas,
            ),
            EstrenoBanner(
              itemTandas: widget.itemTandas,
              themeProvider: themeProvider,
            ),
            BackBtn(),
            SladingPanel(
              themeProvider: themeProvider,
              pageController: pageController,
              itemTandas: widget.itemTandas,
            ),
          ],
        ),
      ),
    );
  }
}
