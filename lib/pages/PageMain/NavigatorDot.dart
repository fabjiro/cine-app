import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavigatorDot extends StatefulWidget {
  NavigatorDot({
    Key? key,
    required this.onChange,
    required this.currentIndex,
    required this.items,
  }) : super(key: key);

  final Function(int vlaue) onChange;
  final int currentIndex;
  final List<ButtonNavigatorDot> items;
  @override
  _NavigatorDotState createState() => _NavigatorDotState();
}

class _NavigatorDotState extends State<NavigatorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 8.5.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 2.0), //(x,y)
            blurRadius: 2.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) {
              return InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => widget.onChange(index),
                child: widget.items[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ButtonNavigatorDot extends StatelessWidget {
  const ButtonNavigatorDot({
    Key? key,
    required this.selectedColor,
    required this.icon,
  }) : super(key: key);

  final Color selectedColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 7.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            // SizedBox(
            //   height: 1.h,
            // ),
            // Container(
            //   width: 1.w,
            //   height: .5.h,
            //   decoration: BoxDecoration(
            //     color: selectedColor,
            //     borderRadius: BorderRadius.circular(50),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
