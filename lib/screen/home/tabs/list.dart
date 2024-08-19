import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:project_todo2/utils/date_time_extension.dart';

import '../../../utils/assets_Style.dart';
import '../../../utils/assets_color.dart';

class ListTab extends StatefulWidget {
  static const String routeNamed = "ListTab";

  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selectedCalenderDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCalender(),
        Spacer(
          flex: 75,
        )
      ],
    );
  }

  buildCalender() {
    return Expanded(
      flex: 25,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.primary,
              )),
              Expanded(
                  child: Container(
                color: AppColors.bgColor,
              )),
            ],
          ),
          EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            focusDate: selectedCalenderDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChange: (selectedDate) {},
            itemBuilder: (context, date, inSelected, onDateTapped) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedCalenderDate = date;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.White,
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        date.dayName,
                        style: inSelected
                            ? AssetsStyle.selectedCalenderDayStyle
                            : AssetsStyle.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                      Text(
                        date.day.toString(),
                        style: inSelected
                            ? AssetsStyle.selectedCalenderDayStyle
                            : AssetsStyle.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
