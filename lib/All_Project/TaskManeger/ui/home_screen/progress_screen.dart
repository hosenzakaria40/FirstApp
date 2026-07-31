import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/TaskModelManager.dart';
import '../widget/Task_Card.dart';

class ProgressScreen extends StatefulWidget {
  final List<TaskModelManager> taskList;
  final String status;
  const ProgressScreen({super.key, required this.taskList, required this.status});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  TaskModelManager taskModelManeger = TaskModelManager();

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
              title: item.title.toString(),
              subtitle: item.description.toString(),
              chipText:widget.status,
              onEdit: () {},
              onDelete: () {},
              backgroundColor: AppColor.progressColor,
            );
          },
        ),
      ),
    );
  }
}
