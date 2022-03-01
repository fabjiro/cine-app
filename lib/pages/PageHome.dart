import 'package:cineapp/pages/PageHome/Header.dart';
import 'package:cineapp/pages/PageHome/Tandas.dart';
import 'package:cineapp/pages/PageHome/proximamente.dart';
import 'package:cineapp/pages/PageHome/selector.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<CustomThemeProvider>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Header(themeProvider: themeProvider),
          SelectorCuidad(),
          Proximamente(themeProvider: themeProvider),
          Tandas(themeProvider: themeProvider)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
