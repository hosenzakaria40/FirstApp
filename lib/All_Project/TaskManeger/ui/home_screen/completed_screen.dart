import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/TaskModelManager.dart';
import '../widget/Task_Card.dart';

class CompletedScreen extends StatefulWidget {
  final List<TaskModelManager> taskList;
  final void Function() parameterGetAllTask;
  final void Function() parameterGetAllTaskCount;

  const CompletedScreen({
    super.key,
    required this.taskList,
    required this.parameterGetAllTask,
    required this.parameterGetAllTaskCount,
  });

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.parameterGetAllTask();
    widget.parameterGetAllTaskCount();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsetsGeometry.all(2),
        child: ListView.builder(
          itemCount: widget.taskList.length,
          itemBuilder: (context, index) {
            var item = widget.taskList[index];
            return Task_Card(
              backgroundColor: AppColor.completeColor,
              refreshParent: () {
                setState(() {
                  widget.parameterGetAllTask();
                  widget.parameterGetAllTaskCount();
                });
              },
              taskModel: item,
              sId: item.sId.toString(),
            );
          },
        ),
      ),
    );
  }
}
