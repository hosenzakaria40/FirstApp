import 'dart:math';

import 'package:fast_app/All_Project/TaskManeger/data/models/TaskModelManager.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/home_screen/edit_task.dart';
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
  final String status;
  const TaskScreen({super.key, required this.taskList, required this.status});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TaskModelManager taskModelManeger = TaskModelManager();
  ApiCaller apiCaller = ApiCaller();

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
    }else{
      SnackBarMeassageError(context, message:response.responseData['data']);
    }
  }



  // Future<void> editTask() async {
  //   showEditTaskAlertDialog(
  //     context,
  //     titleController,
  //     descriptionController,
  //     statusController,
  //     () {
  //       taskModelManeger.title = titleController.text;
  //       taskModelManeger.description = descriptionController.text;
  //       taskModelManeger.status = statusController.text;
  //
  //       setState(() {});
  //       Navigator.pop(context);
  //       SnackBarMeassage(context, message: 'Edit Success');
  //     },
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();
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
                    title: ModelList[index].sId.toString(),
                    number: ModelList[index].sum ?? 0,
                  );
                },
              ),
            ),
            // Row(
            //   // crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomTextDesign(
            //       text: 'New Task',
            //       fontSize: 20,
            //       color: AppColor.primaryText,
            //       fontWeight: FontWeight.bold,
            //     ),
            //
            //     TextButton(
            //       onPressed: () {},
            //       child: CustomTextDesign(
            //         text: 'See all',
            //         fontSize: 15,
            //         color: AppColor.primaryButton,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.taskList.length,
                itemBuilder: (context, index) {
                  var item=widget.taskList[index];
                  return Task_Card(
                    title:item.title.toString(),
                    subtitle: item.description.toString(),
                    chipText:widget.status,
                    onEdit: () {
                      // editTask();
                    },
                    onDelete: () {},
                    backgroundColor: AppColor.newTaskColor,
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
