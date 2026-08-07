import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/TaskModelManager.dart';
import '../../data/models/task_count_model.dart';
import '../../data/service/api_caller.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
import '../widget/Task_Card.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  final ApiCaller apiCaller = ApiCaller();
  List<TaskModelManager> All_taskList = [];

  Future<void> getAllTask() async {
    final response = await apiCaller.getRequest(
      url: TMUrls.AllTask('Completed'),
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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsetsGeometry.all(2),
        child: ListView.builder(
          itemCount: All_taskList.length,
          itemBuilder: (context, index) {
            var item = All_taskList[index];
            return Task_Card(
              backgroundColor: AppColor.completeColor,
              refreshParent: () {
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
