import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/data/provider/Task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/TaskModelManager.dart';
import '../../data/service/api_caller.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
import '../widget/Task_Card.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
  /*
  final ApiCaller apiCaller = ApiCaller();
  List<TaskModelManager> All_taskList = [];

  Future<void> getAllTask() async {
    final response = await apiCaller.getRequest(
      url: TMUrls.AllTask('Canceled'),
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
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAllTask();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TaskProvider>(context,listen: false);
      provider.getAllTask('Canceled');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Consumer<TaskProvider>(
        builder: (context,CanceledTaskProvider,child) {
          return Padding(
            padding: EdgeInsetsGeometry.all(2),
            child: ListView.builder(
              itemCount: CanceledTaskProvider.canceledTask.length,
              itemBuilder: (context, index) {
                var item = CanceledTaskProvider.canceledTask[index];
                return Task_Card(
                  backgroundColor: AppColor.canceledColor,
                  refreshParent: () {
                    CanceledTaskProvider.getAllTask('Canceled');
                    CanceledTaskProvider.getAllTaskCount();
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
