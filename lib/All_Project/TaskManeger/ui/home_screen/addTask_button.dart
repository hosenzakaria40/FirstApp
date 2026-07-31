import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:fast_app/All_Project/TaskManeger/util/urls.dart';
import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import '../../data/auth_controller/auth_controller.dart';
import '../../data/service/api_caller.dart';
import '../../util/assets_path.dart';
import '../widget/Custom_snakber.dart';
import '../widget/primary_button.dart';
import '../widget/validator.dart';

class AddTaskButton extends StatefulWidget {
  const AddTaskButton({super.key});

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  final titleController = TextEditingController();
  final discriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // List<TaskModelManeger> taskList = [];

  Future<void> addTask() async {
    final ApiResponse response = await ApiCaller().postRequest(
      url: TMUrls.createTask,
      body: {
        'title': titleController.text,
        'description': discriptionController.text,
        'status': 'New Task',
      },
    );
    if (response.isSuccess ) {
      SnackBarMeassage(context, message: 'Add Success');
    } else {
      print("AuthController Error: ${AuthController.token}");
      SnackBarMeassageError(context, message: 'Add Error');
    }
  }

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
        backgroundColor: AppColor.primaryButton,
        actions: [
          PopupMenuButton<String>(
            color: AppColor.primaryIcon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            offset: Offset(0, 10),
            shadowColor: AppColor.secondaryText,

            icon: Icon(Icons.more_vert, size: 35, color: AppColor.primaryIcon),
            // onSelected: (value) {
            //   print(value);
            // },
            itemBuilder: (context) => [
              PopupMenuItem(
                // value: "Edit",
                child: CustomTextDesign(
                  text: 'Edit profile',
                  fontSize: 20,
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/UpdateProfile');
                },
              ),
              PopupMenuItem(
                // value: "Log Out",/////////na dilaw problem nai
                child: CustomTextDesign(
                  text: 'Log Out',
                  fontSize: 20,
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/LoginScreen');
                },
              ),
            ],
          ),
        ],
        title: Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AssetsPath.logoPath2),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextDesign(
                  text: 'Mr. Jakaria Hosen',
                  fontSize: 20,
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextDesign(
                  text: 'hosenzakaria40@Gmail.com',
                  fontSize: 15,
                  color: AppColor.primaryText,
                ),
              ],
            ),
          ],
        ),
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
                      addTask();
                      Navigator.pushNamed(context, '/');
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
