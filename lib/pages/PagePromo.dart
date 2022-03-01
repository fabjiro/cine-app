import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PromoPage extends StatefulWidget {
  PromoPage({Key? key}) : super(key: key);

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      child: Center(
        child: Text("Promo Page"),
      ),
    );
  }
}
