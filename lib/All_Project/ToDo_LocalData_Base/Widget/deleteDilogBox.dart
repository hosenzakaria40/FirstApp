import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';
import '../Model/TaskModel.dart';

void showDeleteDialogBox({
  required BuildContext context,
  required TaskModel task,
  required Future<void> Function(int) deleteTask,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
            title: TextDesign(
              text: 'Delete Task',
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            content: TextDesign(
              text: 'Are you sure you want to delete this task?',
              fontSize: 15.sp,
              color: Colors.grey,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextDesign(
                  text: 'Close',
                  fontSize: 15.sp,
                  color: Colors.indigo,
                ),
              ),

              TextButton(
                onPressed: () {
                  deleteTask(task.id!);
                  Navigator.pop(context);
                },
                child: TextDesign(
                  text: 'Delete',
                  fontSize: 15.sp,
                  color: Colors.indigo,
                ),
              )
            ]
        );
      }
  );

}