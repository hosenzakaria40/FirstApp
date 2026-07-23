import 'package:fast_app/All_Project/TaskManeger/data/models/model_task.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/home_screen/edit_task.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../widget/Task_Card.dart';
import '../widget/card_widget.dart';
import '../widget/textSpam.dart';
import '../widget/text_design.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TaskModelManeger taskModelManeger = TaskModelManeger();

  Future<void>editTask()async{
     showEditTaskAlertDialog(
      context,
      titleController,
      descriptionController,
      statusController,
      () {
        taskModelManeger.title = titleController.text;
        taskModelManeger.description = descriptionController.text;
        taskModelManeger.status = statusController.text;

        setState(() {});
        Navigator.pop(context);
      },
    );
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
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          spacing: 5,
          children: [
            SizedBox(
              height: 100,
              child: GridView(
                padding: EdgeInsetsGeometry.all(5),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // mainAxisSpacing: 2,
                  crossAxisCount: 4,
                  // crossAxisSpacing: 2,
                  // childAspectRatio: 0.9,
                ),
                children: [
                  CardWidget(title: 'New Task', number: 20),
                  CardWidget(title: 'Progress', number: 8),
                  CardWidget(title: 'Complete', number: 5),
                  CardWidget(title: 'Canceled', number: 2),
                ],
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Task_Card(
                    title: taskModelManeger.title.toString(),
                    subtitle: taskModelManeger.description.toString(),
                    chipText: taskModelManeger.status.toString(),
                    onEdit: () {
                      editTask();
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
