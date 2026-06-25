import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';
import '../DataBase/task_db.dart';
import '../Model/TaskModel.dart';
import '../Widget/deleteDilogBox.dart';
import '../Widget/dilogBox.dart';
import '../core/AppColor.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _editController = TextEditingController();
  List<TaskModel> ToDotasks = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _addController.dispose();
    _editController.dispose();
    super.dispose();
  }

  Future<void> addTask() async {
    await TaskDbHelper.insertTask(
      TaskModel(title: _addController.text, isDone: false),
    );

    await refreshTasks();
  }

  Future<void> refreshTasks() async {
    final tasks = await TaskDbHelper.getAllTasks();
    setState(() {
      ToDotasks = tasks;
    });
  }

  Future<void> updateTask(TaskModel task) async {
    await TaskDbHelper.updateTask(task);
    await refreshTasks();
  }

  Future<void> deleteTask(int id) async {
    await TaskDbHelper.deleteTask(id);
    refreshTasks();
  }

  Future<void> toggleTask(TaskModel task) async {
    await updateTask(
      TaskModel(id: task.id, title: task.title, isDone: !task.isDone),
    );
  }

  @override
  void initState() {
    super.initState();
    refreshTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
        backgroundColor:AppColor.appBarColor,
        titleTextStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildForm(),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: ToDotasks.length,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  final task = ToDotasks[index];
                  return Card(
                    elevation: 3.sp,
                    child: ListTile(
                      contentPadding: EdgeInsetsGeometry.symmetric(
                        vertical: 5.sp,
                        horizontal: 0,
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                          color: task.isDone ? Colors.grey : Colors.black,
                        ),
                      ),
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          toggleTask(task);
                        },

                        ///.............../////////
                        /////option 1
                        // fillColor: MaterialStateProperty.resolveWith(
                        //       (states) {
                        //     if (states.contains(MaterialState.disabled)) {
                        //       return Colors.red;
                        //     }
                        //
                        //     if (states.contains(MaterialState.selected)) {
                        //       return Colors.green;
                        //     }
                        //
                        //     return Colors.white;
                        //   },
                        // ),
                        /////option 2  best option
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => states.contains(MaterialState.selected)
                              ? Colors.green
                              : Colors.white,
                        ),
                        /////option 3 sort option only selected
                        // activeColor: Colors.blue,
                        ////....................////
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        checkColor: Colors.white,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showMyEditDialog(
                                context: context,
                                task: task,
                                controller: _editController,
                                updateTask: (TaskModel task) {
                                  return updateTask(task);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blueGrey,
                              size: 15.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDeleteDialogBox(
                                context: context,
                                task: task,
                                deleteTask: deleteTask,
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _addController,
                    decoration: InputDecoration(
                      labelText: 'Task',
                      hintText: 'Enter Task',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 5.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.sp),
                      side: BorderSide(color: Colors.blue),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor:AppColor.primaryColorButton,
                    padding: EdgeInsetsGeometry.symmetric(vertical: 18.sp),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await addTask();
                      _addController.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
  }
}
