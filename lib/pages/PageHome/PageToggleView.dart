import 'package:cineapp/models/Mtandas.dart';
import 'package:flutter/material.dart';

class PageToggleView extends StatelessWidget {
  const PageToggleView({
    Key? key,
    required this.pageController,
    required this.itemTandas,
    required this.pages,
  }) : super(key: key);
  final PageController pageController;
  final Mtandas itemTandas;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: pages,
        ),
      ),
    );
  }
}
