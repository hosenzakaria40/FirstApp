import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/model_task.dart';
import '../widget/Task_Card.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  TaskModelManeger taskModelManeger = TaskModelManeger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsetsGeometry.all(2),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Task_Card(
              title: taskModelManeger.title.toString(),
              subtitle: taskModelManeger.description.toString(),
              chipText: taskModelManeger.status.toString(),
              onEdit: () {},
              onDelete: () {},
              backgroundColor: AppColor.completeColor,
            );
          },
        ),
      ),
    );
  }
}
