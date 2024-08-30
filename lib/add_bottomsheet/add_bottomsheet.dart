import 'package:flutter/material.dart';
import 'package:project_todo2/firebase_functios.dart';
import 'package:project_todo2/models/task_model.dart';
import 'package:project_todo2/utils/assets_color.dart';
import 'package:project_todo2/utils/date_time_extension.dart';

import '../utils/assets_Style.dart';

class AddBottomSheet extends StatefulWidget {
  static const String routeNmaed = "AddBottomSheet";

  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddBottomSheet(),
            ));
  }
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.40,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: AppStyle.bottomSheetTitle,
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Enter task title"),
            controller: titleController,
          ),
          const SizedBox(height: 12),
          TextField(
            decoration:
                const InputDecoration(hintText: "Enter task description"),
            controller: descriptionController,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Selected Data",
            style: AppStyle.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                showMyDatePidker();
              },
              child: Text(
                selectedDate.toformattedDate,
                style: AppStyle.normalGreyTextStyle,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
              print(selectedDate);
              TaskModel task = TaskModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  date:
                      DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
              FirebaseFunctions.addTask(task).then((value) {
                Navigator.pop(context);
              });
            },
            child: Text(
              "Add",
              style: AppStyle.normalGreyTextStyle.copyWith(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          )
        ],
      ),
    );
  }

  void showMyDatePidker() async {
    selectedDate = await showDatePicker(
            context: context,
            builder: (context, child) => Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                    primary: AppColors.primary,
                  )),
                  child: child!,
                ),
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
