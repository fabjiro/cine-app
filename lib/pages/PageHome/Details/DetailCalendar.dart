import 'package:cineapp/data.dart';
import 'package:cineapp/pages/PageHome/Details/calendar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailCalendar extends StatefulWidget {
  const DetailCalendar({
    Key? key,
  }) : super(key: key);

  @override
  _DetailCalendarState createState() => _DetailCalendarState();
}

class _DetailCalendarState extends State<DetailCalendar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Center(
        child: Container(
          width: 90.w,
          child: Calendario(
            mes: mstateCarteleras.mes,
            firstDayMonth: mstateCarteleras.firstDayMonth,
            initialDay: mstateCarteleras.initialDay,
            endDay: mstateCarteleras.endDay,
            onTap: (index) {
              print(index);
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
