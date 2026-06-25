import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';
import '../Model/TaskModel.dart';

void showMyEditDialog({
  required BuildContext context,
  required TaskModel task,
  required TextEditingController controller,
  required Future<void> Function(TaskModel) updateTask,
}) {
  final GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

  controller.text = task.title;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: TextDesign(
          text: 'Edit Task',
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        content: Form(
          key: dialogFormKey,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a task';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Task',
              hintText: 'Enter Task',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.clear();
              Navigator.pop(context);
            },
            child: TextDesign(
              text: 'Close',
              fontSize: 15.sp,
              color: Colors.indigo,
            ),
          ),
          TextButton(
            onPressed: () async {
              if (dialogFormKey.currentState!.validate()) {
                await updateTask(
                  TaskModel(
                    id: task.id,
                    title: controller.text,
                    isDone: task.isDone,
                  ),
                );

                controller.clear();
                Navigator.pop(context);
              }
            },
            child: TextDesign(
              text: 'Update',
              fontSize: 15.sp,
              color: Colors.indigo,
            ),
          ),
        ],
      );
    },
  );
}