import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../data/models/model_task.dart';
import '../../util/assets_path.dart';
import '../widget/text_design.dart';
import '../widget/validator.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryButton,
        // actions: [
        //   PopupMenuButton<String>(
        //     color: AppColor.primaryIcon,
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //     elevation: 10,
        //     offset: Offset(0, 10),
        //     shadowColor: AppColor.secondaryText,
        //
        //     icon: Icon(Icons.more_vert, size: 35, color: AppColor.primaryIcon,),
        //     // onSelected: (value) {
        //     //   print(value);
        //     // },
        //     itemBuilder: (context) => [
        //       PopupMenuItem(
        //         // value: "Edit",
        //           child: CustomTextDesign(text: 'Edit', fontSize: 20, color: AppColor.primaryText,fontWeight: FontWeight.bold,),
        //           onTap: () {
        //             Navigator.pushReplacementNamed(context, '/LoginScreen');
        //           }
        //       ),
        //       PopupMenuItem(
        //         // value: "Log Out",/////////na dilaw problem nai
        //           child: CustomTextDesign(text: 'Log Out', fontSize: 20, color: AppColor.primaryText,fontWeight: FontWeight.bold,),
        //           onTap: () {
        //             Navigator.pushReplacementNamed(context, '/LoginScreen');
        //           }
        //       ),
        //     ],
        //   )
        // ],
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              CustomTextDesign(
                text: 'Update Profile',
                fontSize: 40,
                color: AppColor.primaryText,
                fontWeight: FontWeight.w900,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.primaryIcon,
                  backgroundColor: AppColor.primaryButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                  elevation: 10,
                  shadowColor: AppColor.secondaryText,
                  side: BorderSide(color: AppColor.secondaryText),
                  splashFactory: InkSplash.splashFactory,
                  // minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text('Change Photo'),
              ),
              UserInput(
                controller: nameController,
                hintText: 'Full Name',
                keyboardType: TextInputType.text,
                labelText: 'Name',
                validator: Validators.requiredField,
              ),
              UserInput(
                controller: emailController,
                hintText: 'Enter Email',
                keyboardType: TextInputType.text,
                labelText: 'Email',
                validator: Validators.requiredField,
              ),
              UserInput(
                controller: phoneController,
                hintText: 'Enter Phone',
                keyboardType: TextInputType.text,
                labelText: 'Phone',
                validator: Validators.requiredField,
              ),
              primaryButton(
                child: Text('Update'),
                onPressed: () {
                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
