import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              padding: MediaQuery.of(context).viewInsets,
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
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "add new task",
            textAlign: TextAlign.center,
            style: AssetsStyle.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
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
            "selected data",
            style: AssetsStyle.bottomSheetTitle,
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
                style: AssetsStyle.normalGreyTextStyle,
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                // addTodoToFireStore();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }

  void showMyDatePidker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
