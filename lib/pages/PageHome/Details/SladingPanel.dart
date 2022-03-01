import 'package:animate_do/animate_do.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:cineapp/models/Mtandas.dart';
import 'package:cineapp/pages/PageHome/DetailInfoPage.dart';
import 'package:cineapp/pages/PageHome/DetailMenuToggle.dart';
import 'package:cineapp/pages/PageHome/Details/DetailCalendar.dart';
import 'package:cineapp/pages/PageHome/PageToggleView.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SladingPanel extends StatelessWidget {
  const SladingPanel({
    Key? key,
    required this.themeProvider,
    required this.pageController,
    required this.itemTandas,
  }) : super(key: key);

  final CustomThemeProvider themeProvider;
  final PageController pageController;
  final Mtandas itemTandas;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: SlidingUpPanel(
        backdropColor: themeProvider.theme.fondo!,
        minHeight: 55.h,
        maxHeight: 70.h,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        panel: Column(
          children: [
            Container(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Container(
                    width: 12.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
            MenuToggle(
              onChange: (index) {
                pageController.jumpToPage(index);
              },
            ),
            PageToggleView(
              pageController: pageController,
              itemTandas: itemTandas,
              pages: [
                DetailInfoPage(
                  themeProvider: themeProvider,
                  itemTandas: itemTandas,
                ),
                DetailCalendar(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
