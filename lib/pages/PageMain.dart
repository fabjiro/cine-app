import 'package:cineapp/SalomonBottomBar.dart';
import 'package:cineapp/data.dart';
import 'package:cineapp/dio.dart';
import 'package:cineapp/models/Mproximamente.dart';
import 'package:cineapp/models/MstateCartelerda.dart';
import 'package:cineapp/models/Mtandas.dart';
import 'package:cineapp/pages/PageAnimationLoad.dart';
import 'package:cineapp/pages/PageHome.dart';
import 'package:cineapp/pages/PagePromo.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();
  int _currentIndex = 0;
  late Future _noreload;

  @override
  void initState() {
    super.initState();
    _noreload = dataPeliculas(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _noreload,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PageAnimationLoad();
        } else {
          return Scaffold(
            body: SafeArea(
              child: PageView(
                controller: pageController,
                children: [
                  HomePage(),
                  PromoPage(),
                ],
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (int value) {
                if (value != _currentIndex) {
                  pageController.jumpToPage(value);
                  setState(() => _currentIndex = value);
                }
              },
              items: [
                SalomonBottomBarItem(
                  icon: Icon(Iconsax.home),
                  title: Text("Tandas"),
                  selectedColor: Colors.purple,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Iconsax.heart),
                  title: Text("Promociones"),
                  selectedColor: Colors.pink,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Future<void> dataPeliculas(BuildContext context) async {
  try {
    final listProx = await dio.get('/api/proximamente');
    final listTand = await dio.get("/api/tandas");
    final stateCartelera = await dio.get("/api/carteleras/state");

    mstateCarteleras = MstateCarteleras.fromMap({
      'currentCartelera': stateCartelera.data['currentCartelera'],
      'mes': stateCartelera.data['mes'],
      'initialDay': stateCartelera.data['fechas'][0],
      'endDay': stateCartelera.data['fechas']
          [stateCartelera.data['fechas'].length - 1],
      'firstDayMonth': stateCartelera.data['firstDayMonth'],
    });

    // get proximamente
    List<dynamic> data =
        listProx.data.map((e) => Mproximamente.fromMap(e)).toList();

    data.forEach((element) => listProximamente.add(element));

    // get tandas
    data = listTand.data.map((e) => Mtandas.fromMap(e)).toList();
    data.forEach((element) => listTandas.add(element));
  } catch (e) {
    Navigator.of(context).pushNamed('noconnection');
  }
}
