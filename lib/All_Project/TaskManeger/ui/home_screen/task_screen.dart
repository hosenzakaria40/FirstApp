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
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final ApiCaller apiCaller = ApiCaller();
  List<TaskModelManager> All_taskList = [];

  Future<void> getAllTask() async {
    final response = await apiCaller.getRequest(
      url: TMUrls.AllTask('New Task'),
    );
    List<TaskModelManager> AllTasklistData = [];
    if (response.isSuccess == true) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        AllTasklistData.add(TaskModelManager.fromJson(jsonData));
        jsonData.addAll(jsonData);
      }
      setState(() {
        All_taskList = AllTasklistData;
      });
    } else {
      return SnackBarMeassageError(
        context,
        message: response.responseData['data'],
      );
    }
  }

  List<taskCountModel> ModelList = [];

  Future getAllTaskCount() async {
    final response = await apiCaller.getRequest(url: TMUrls.taskCount);
    List<taskCountModel> listData = [];

    if (response.isSuccess == true) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        listData.add(taskCountModel.fromJson(jsonData));
      }

      setState(() {
        ModelList = listData;
      });
    } else {
      SnackBarMeassageError(context, message: response.responseData['data']);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
    getAllTaskCount();
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
                itemCount: ModelList.length,
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
                    title: ModelList[index].sId ?? '',
                    number: ModelList[index].sum ?? 0,
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: All_taskList.length,
                itemBuilder: (context, index) {
                  var item = All_taskList[index];
                  return Task_Card(
                    backgroundColor: AppColor.newTaskColor,
                    refreshParent: () {
                      getAllTask();
                      getAllTaskCount();
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
