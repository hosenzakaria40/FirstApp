import 'dart:math';

import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/data/service/api_caller.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/material.dart';

import '../../data/models/TaskModelManager.dart';
import '../../util/urls.dart';
import 'Custom_snakber.dart';

class Task_Card extends StatefulWidget {
  final TaskModelManager taskModel;

  final Color backgroundColor;

  final String sId;
  final VoidCallback refreshParent;

  const Task_Card({
    super.key,
    required this.backgroundColor,
    required this.refreshParent,
    required this.taskModel,
    required this.sId,
  });

  @override
  State<Task_Card> createState() => _Task_CardState();
}

class _Task_CardState extends State<Task_Card> {
  Future<void> deleteTask() async {
    final response = await ApiCaller().getRequest(
      url: TMUrls.deleteTask(widget.sId.toString()),
    );

    setState(() {});

    if (response.isSuccess) {
      widget.refreshParent();
      SnackBarMeassage(context, message: 'Task delete Success');
    }
  }

  Future<void> changeStatus(String status) async {
    final response = await ApiCaller().getRequest(
      url: TMUrls.updateTask(widget.taskModel.sId.toString(), status),
    );
    setState(() {});

    if (response.isSuccess) {
      widget.refreshParent();
      Navigator.pop(context);
      SnackBarMeassage(context, message: 'Edit Success');
    } else {
      Navigator.pop(context);
      SnackBarMeassageError(context, message: 'Edit Failed');
    }
  }

  void showEditTaskAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: ListTile(
                title: Text('New Task'),
                trailing: widget.taskModel.status == 'New Task'
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  changeStatus('New Task');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Progress'),
                trailing: widget.taskModel.status == 'Progress'
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  changeStatus('Progress');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Completed'),
                trailing: widget.taskModel.status == 'Completed'
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  changeStatus('Completed');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Canceled'),
                trailing: widget.taskModel.status == 'Canceled'
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  changeStatus('Canceled');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,

      child: ListTile(
        title: CustomTextDesign(
          text: widget.taskModel.title.toString(),
          fontSize: 25,
          color: AppColor.primaryText,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextDesign(
              text: widget.taskModel.description.toString(),
              fontSize: 15,
              color: AppColor.secondaryText,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 5),
            CustomTextDesign(
              text: widget.taskModel.createdDate.toString(),
              fontSize: 10,
              color: AppColor.secondaryText,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                Chip(
                  label: CustomTextDesign(
                    text: widget.taskModel.status.toString(),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryIcon,
                  ),
                  backgroundColor: widget.backgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showEditTaskAlertDialog();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.edit_note,
                    color: AppColor.secondaryText,
                    size: 15,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    deleteTask();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColor.deleteColor,
                    size: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


























