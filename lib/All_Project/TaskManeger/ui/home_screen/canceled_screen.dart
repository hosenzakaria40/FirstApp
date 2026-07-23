import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/model_task.dart';
import '../widget/Task_Card.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
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
              backgroundColor: AppColor.canceledColor,
            );
          },
        ),
      ),
    );
  }
}
