import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_todo2/firebase_functios.dart';
import 'package:project_todo2/models/task_model.dart';
import 'package:project_todo2/utils/assets_color.dart';

import '../../edit_screen.dart';

class TaskItems extends StatefulWidget {
  TaskModel taskModel;

  TaskItems({super.key, required this.taskModel});

  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditScreen.routeNamed);
      },
      child: Container(
        height: 115,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Slidable(
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(widget.taskModel.id);
                },
                label: "Delete",
                backgroundColor: Colors.red,
                icon: Icons.delete,
                spacing: 8,
                autoClose: true,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              SlidableAction(
                onPressed: (context) {
                  Navigator.pushNamed(context, EditScreen.routeNamed);
                },
                label: "Edit",
                backgroundColor: Colors.blue,
                icon: Icons.edit,
                spacing: 8,
                autoClose: true,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 4,
                  decoration: BoxDecoration(
                      color: widget.taskModel.isDone
                          ? Colors.greenAccent
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.taskModel.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: widget.taskModel.isDone
                                ? Colors.greenAccent
                                : AppColors.primary),
                      ),
                      Text(widget.taskModel.description,
                          style: TextStyle(fontSize: 12, color: AppColors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                widget.taskModel.isDone
                    ? Text(
                        "Done!",
                        style:
                            TextStyle(fontSize: 22, color: Colors.greenAccent),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          widget.taskModel.isDone = true;
                          FirebaseFunctions.updateTask(widget.taskModel);
                        },
                        child: Icon(
                          Icons.done,
                          color: widget.taskModel.isDone
                              ? Colors.greenAccent
                              : Colors.white,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
