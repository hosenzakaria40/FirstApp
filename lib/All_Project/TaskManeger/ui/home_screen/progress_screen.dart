import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/data/provider/Task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/TaskModelManager.dart';
import '../../data/models/task_count_model.dart';
import '../../data/service/api_caller.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
import '../widget/Task_Card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  /*
  final ApiCaller apiCaller = ApiCaller();
  List<TaskModelManager> All_taskList = [];

  Future<void> getAllTask() async {
    final response = await apiCaller.getRequest(
      url: TMUrls.AllTask('Progress'),
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
*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAllTask();
WidgetsBinding.instance.addPostFrameCallback((_) {
  final taskProvider =Provider.of<TaskProvider>(context,listen: false);
  taskProvider.getAllTask('Progress');
});


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Consumer<TaskProvider>(
        builder: (context,ProgressTaskProviders,child) {
          return Padding(
            padding: EdgeInsetsGeometry.all(2),
            child: ListView.builder(
              itemCount: ProgressTaskProviders.progressTask.length,
              itemBuilder: (context, index) {
                var item = ProgressTaskProviders.progressTask[index];
                return Task_Card(
                  backgroundColor: AppColor.progressColor,
                  refreshParent: () {
                    ProgressTaskProviders.getAllTask('Progress');
                    ProgressTaskProviders.getAllTaskCount();
                  },
                  taskModel: item,
                  sId: item.sId.toString(),
                );
              },
            ),
          );
        }
      ),
    );
  }
}
