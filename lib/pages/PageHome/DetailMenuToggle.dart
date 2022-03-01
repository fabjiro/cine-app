import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuToggle extends StatefulWidget {
  const MenuToggle({
    Key? key,
    required this.onChange,
  }) : super(key: key);
  final Function(int) onChange;

  @override
  _MenuToggleState createState() => _MenuToggleState();
}

class _MenuToggleState extends State<MenuToggle> {
  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Center(
        child: Container(
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.35),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Toggle(
                  label: "Info",
                  isSelected: (_currentSelected == 0),
                  onTap: () {
                    setState(() => _currentSelected = 0);
                    widget.onChange(0);
                  },
                ),
                Toggle(
                  label: "Carteleras",
                  isSelected: (_currentSelected == 1),
                  onTap: () {
                    setState(() => _currentSelected = 1);
                    widget.onChange(1);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Toggle extends StatelessWidget {
  const Toggle(
      {Key? key,
      required this.label,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final String label;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.sp),
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                  text: label,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.white : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
