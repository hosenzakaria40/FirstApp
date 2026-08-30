import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../TaskManeger/core/app_color.dart';
import '../../TaskManeger/ui/widget/primary_button.dart';
import '../../TaskManeger/ui/widget/text_design.dart';
import '../../TaskManeger/ui/widget/user_input.dart';
import '../../TaskManeger/ui/widget/validator.dart';
import '../controller23/provider_controller.dart';


class AddTaskButton23 extends StatefulWidget {
  const AddTaskButton23({super.key});

  @override
  State<AddTaskButton23> createState() => _AddTaskButton23State();
}

class _AddTaskButton23State extends State<AddTaskButton23> {
  final titleController = TextEditingController();
  final discriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    discriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,

        title:Text('Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                CustomTextDesign(
                  text: 'Add New Task',
                  fontSize: 30,
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                UserInput(
                  controller: titleController,
                  hintText: "Enter your text title...",
                  keyboardType: TextInputType.text,
                  labelText: 'Title',
                  validator: Validators.requiredField,
                ),
                CustomTextDesign(
                  text: 'Description',
                  fontSize: 20,
                  color: AppColor.secondaryText,
                  fontWeight: FontWeight.bold,
                ),
                UserInput(
                  controller: discriptionController,
                  hintText: "Enter Description...",
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  labelText: 'Description',
                  validator: Validators.requiredField,
                ),
                primaryButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TaskProvider23>().addTodo(
                        titleController.text.trim(),
                        discriptionController.text.trim(),
                      );
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
