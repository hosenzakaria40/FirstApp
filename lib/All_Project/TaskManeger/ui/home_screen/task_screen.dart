import 'dart:math';

import 'package:fast_app/All_Project/TaskManeger/data/models/TaskModelManager.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/Change_task.dart';
import 'package:fast_app/All_Project/TaskManeger/util/urls.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../data/models/task_count_model.dart';
import '../../data/service/api_caller.dart';
import '../widget/Custom_snakber.dart';
import '../widget/Task_Card.dart';
import '../widget/card_widget.dart';

class TaskScreen extends StatefulWidget {
  final List<TaskModelManager> taskList;
  final void Function() parameterGetAllTask;
  final void Function() parameterGetAllTaskCount;
  final List<taskCountModel> countModelList;

  const TaskScreen({
    super.key,
    required this.taskList,
    required this.parameterGetAllTask,
    required this.parameterGetAllTaskCount,
    required this.countModelList,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddTaskButton');
        },
        backgroundColor: AppColor.primaryButton,
        child: Icon(
          Icons.add,
          color: AppColor.primaryIcon,
          fontWeight: FontWeight.w900,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          spacing: 5,
          children: [
            SizedBox(
              height: 100,
              child: GridView.builder(
                itemCount: widget.countModelList.length,
                padding: EdgeInsetsGeometry.all(5),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // mainAxisSpacing: 2,
                  crossAxisCount: 4,
                  // crossAxisSpacing: 2,
                  // childAspectRatio: 0.9,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    title: widget.countModelList[index].sId ?? '',
                    number: widget.countModelList[index].sum ?? 0,
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.taskList.length,
                itemBuilder: (context, index) {
                  var item = widget.taskList[index];
                  return Task_Card(
                    backgroundColor: AppColor.newTaskColor,
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
          ],
        ),
      ),
    );
  }
}
