import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class Calendario extends StatelessWidget {
  Calendario({
    Key? key,
    required this.mes,
    required this.initialDay,
    required this.endDay,
    required this.firstDayMonth,
    required this.onTap,
  }) : super(key: key);

  final String mes;
  final int firstDayMonth;
  final int initialDay;
  final int endDay;
  final Function(int) onTap;
  int currenindex = 0;
  int currenValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleMes(mes: mes),
          Table(
              children: List<TableRow>.generate(6, (index) {
            if (index == 0) {
              return TableRow(
                children: [
                  TitleDay(title: "Dom"),
                  TitleDay(title: "Lun"),
                  TitleDay(title: "Mart"),
                  TitleDay(title: "Mier"),
                  TitleDay(title: "Juev"),
                  TitleDay(title: "Vier"),
                  TitleDay(title: "Sab"),
                ],
              );
            } else {
              return TableRow(
                children: List<Widget>.generate(7, (index) {
                  currenindex++;

                  if (currenindex <= firstDayMonth || currenValue > 30) {
                    return Container();
                  } else if (initialDay - 1 <= currenValue &&
                      endDay - 1 >= currenValue) {
                    currenValue++;
                    if (initialDay == currenValue) {
                      return InputDayColoredRounded(
                        value: currenValue,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5),
                        ),
                        onTap: (value) => onTap(value),
                      );
                    } else if (endDay == currenValue) {
                      return InputDayColoredRounded(
                        value: currenValue,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(5),
                        ),
                        onTap: (value) => onTap(value),
                      );
                    } else if (index == 0 || index == 6) {
                      if (index == 6) {
                        return InputDayColored(
                          value: currenValue,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(5),
                          ),
                          onTap: (value) => onTap(value),
                        );
                      } else {
                        return InputDayColored(
                          value: currenValue,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(5),
                          ),
                          onTap: (value) => onTap(value),
                        );
                      }
                    } else {
                      return InputDayColored(
                        value: currenValue,
                        onTap: (value) => onTap(value),
                      );
                    }
                  } else {
                    currenValue++;
                    return InputDay(
                      value: currenValue,
                    );
                  }
                }),
              );
            }
          })),
        ],
      ),
    );
  }
}

class TitleMes extends StatelessWidget {
  const TitleMes({
    Key? key,
    required this.mes,
  }) : super(key: key);

  final String mes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        mes,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class InputDayColoredRounded extends StatelessWidget {
  const InputDayColoredRounded({
    Key? key,
    required this.value,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);
  final int value;
  final BorderRadius borderRadius;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onTap(value),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Color(0XFF203239),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputDayColored extends StatelessWidget {
  const InputDayColored({
    Key? key,
    required this.value,
    required this.onTap,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);
  final int value;
  final BorderRadius borderRadius;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onTap(value),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0XFF203239).withOpacity(.5),
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputDay extends StatelessWidget {
  const InputDay({
    Key? key,
    required this.value,
  }) : super(key: key);

  final int value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleDay extends StatelessWidget {
  const TitleDay({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
  }
}
