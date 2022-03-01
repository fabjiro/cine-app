import 'package:cineapp/models/Mtandas.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FondoPortada extends StatelessWidget {
  const FondoPortada({
    Key? key,
    required this.itemTandas,
  }) : super(key: key);

  final Mtandas itemTandas;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: itemTandas.id,
      child: Container(
        width: 100.w,
        height: 55.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(itemTandas.portada),
          ),
        ),
      ),
    );
  }
}
