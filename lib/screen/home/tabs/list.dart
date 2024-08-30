import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:project_todo2/firebase_functios.dart';
import 'package:project_todo2/screen/home/tabs/task_items.dart';
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
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 75,
          child: StreamBuilder(
            stream: FirebaseFunctions.getTask(selectedCalenderDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text("Something went wrong"),
                      ElevatedButton(onPressed: () {}, child: Text("try again"))
                    ],
                  ),
                );
              }

              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              // var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
              if (tasks.isEmpty) {
                return Text("NoTasks");
              }
              return Expanded(
                // flex: 75,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return TaskItems(
                      taskModel: tasks[index],
                    );
                  },
                  itemCount: tasks.length,
                ),
              );
            },
          ),
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
                            ? AppStyle.selectedCalenderDayStyle
                            : AppStyle.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                      Text(
                        date.day.toString(),
                        style: inSelected
                            ? AppStyle.selectedCalenderDayStyle
                            : AppStyle.unselectedCalenderDayStyle,
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
// selectedCalenderDate = selectedDate;
// setState(() {});