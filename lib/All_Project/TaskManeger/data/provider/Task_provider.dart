import 'package:fast_app/All_Project/TaskManeger/data/models/TaskModelManager.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/task_count_model.dart';
import 'package:fast_app/All_Project/TaskManeger/data/service/api_caller.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/Custom_snakber.dart';
import 'package:fast_app/All_Project/TaskManeger/util/urls.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider with ChangeNotifier {
  final ApiCaller apiCaller = ApiCaller();
  bool isLoding = false;

  void setLoding(bool value) {
    isLoding = value;
    notifyListeners();
  }

  List<TaskModelManager> newTask = [];
  List<TaskModelManager> progressTask = [];
  List<TaskModelManager> completedTask = [];
  List<TaskModelManager> canceledTask = [];
  List<taskCountModel> countTask = [];

  Future<void> getAllTask(String status) async {
    setLoding(true);
    final response = await apiCaller.getRequest(url: TMUrls.AllTask(status));
    List<TaskModelManager> tempTask = [];
    if (response.isSuccess == true) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        tempTask.add(TaskModelManager.fromJson(jsonData));
        jsonData.addAll(jsonData);
      }
      if (status=='New Task') {
        newTask=tempTask;

      } else if(status=='Progress'){
        progressTask=tempTask;
      }else if(status=='Completed'){
        completedTask =tempTask;
      }else if(status=='Canceled') {
        canceledTask= tempTask;
      }
    }
    setLoding(false);
  }
//////Best suggest from AI ///////////////////
  /*getAllTask()-এ `try-catch-finally কেন?

getAllTask() শুরু হওয়ার সময় Loading ON করা হয়। এরপর API call করা হয়।

try → API call এবং data processing করার জায়গা।
catch → API call-এর সময় কোনো error হলে সেটা ধরার জায়গা।
finally → API সফল হোক বা error হোক, এই অংশ অবশ্যই execute হবে।

তাই finally-তে Loading OFF করা হয়।

মনে রাখার সহজ কথা:

try = কাজ করো
catch = error ধরো
finally = যাই হোক, Loading বন্ধ করো।*/
  Future<void> ai_getAllTask(String status) async {
    setLoding(true);

    try {
      final response = await apiCaller.getRequest(
        url: TMUrls.AllTask(status),
      );

      if (response.isSuccess == true) {
        final List<TaskModelManager> tempTask = [];

        for (Map<String, dynamic> jsonData
        in response.responseData['data']) {
          tempTask.add(
            TaskModelManager.fromJson(jsonData),
          );
        }

        if (status == 'New Task') {
          newTask = tempTask;
        } else if (status == 'Progress') {
          progressTask = tempTask;
        } else if (status == 'Completed') {
          completedTask = tempTask;
        } else if (status == 'Canceled') {
          canceledTask = tempTask;
        }
      }
    } finally {
      setLoding(false);
    }
  }
  //////////////////////////////////////////////////////////
  Future getAllTaskCount() async {
    setLoding(true);
    final response = await apiCaller.getRequest(url: TMUrls.taskCount);
    List<taskCountModel> listData = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        listData.add(taskCountModel.fromJson(jsonData));
      }
    } else {}
    countTask = listData;
    setLoding(false);
  }
  ///////ROW CODE KORE O KORE JAI BUT ONEK CODE LIKHA LAGE/////
/*
  Future<void> get_progressTask(BuildContext context) async {
    setLoding(true);
    final response = await apiCaller.getRequest(
      url: TMUrls.AllTask('Progress'),
    );
    List<TaskModelManager> AllTasklistData = [];
    if (response.isSuccess == true) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        AllTasklistData.add(TaskModelManager.fromJson(jsonData));
        jsonData.addAll(jsonData);
      }


    } else {
      return SnackBarMeassageError(
        context,
        message: response.responseData['data'],
      );
    }
    progressTask = AllTasklistData;
    setLoding(false);
  }*/


  Future<bool> deleteTask(String TasksId,) async {
    final response = await ApiCaller().getRequest(
      url: TMUrls.deleteTask(TasksId,),
    );
    if (response.isSuccess) {
      newTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      progressTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      completedTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      canceledTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      notifyListeners();
      await getAllTaskCount();
     return true;
    }else{
      return false;
    }
  }


  Future<void> provider_changeStatus(String TasksId,String status,BuildContext context) async {
    final response = await ApiCaller().getRequest(
      url: TMUrls.updateTask(TasksId, status),
    );


    if (response.isSuccess) {

      newTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      progressTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      completedTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      canceledTask.removeWhere( (task)=>task.sId.toString()== TasksId);
      notifyListeners();
      await getAllTask(status);
      // Navigator.pop(context);
      SnackBarMeassage(context, message: 'Edit Success');
    } else {
      Navigator.pop(context);
      SnackBarMeassageError(context, message: 'Edit Failed');
    }
  }
}
