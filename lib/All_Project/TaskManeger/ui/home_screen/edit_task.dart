import 'package:flutter/material.dart';

import '../widget/user_input.dart';

void showEditTaskAlertDialog(
  BuildContext context,
  TextEditingController titleController,
  TextEditingController descriptionController,
  TextEditingController statusController,
  VoidCallback onPress,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Edit Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          UserInput(
            controller: titleController,
            hintText: 'Title',
            keyboardType: TextInputType.text,
          ),
          UserInput(
            controller: descriptionController,
            hintText: 'Description',
            keyboardType: TextInputType.text,
          ),
          UserInput(
            controller: statusController,
            hintText: 'Status',
            keyboardType: TextInputType.text,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(onPressed: onPress, child: Text('submit')),
      ],
    ),
  );
}
