import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../core/app_color.dart';
import '../../data/auth_controller/auth_controller.dart';
import '../../data/models/profileDModel.dart';
import '../../data/models/profile_model.dart';
import '../../data/models/user_model.dart';
import '../../data/service/api_caller.dart';
import '../../util/assets_path.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
import '../widget/text_design.dart';
import '../widget/validator.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<ProfileDModel> mList = [];

  Future<void> getProfile() async {
    final response = await ApiCaller().getRequest(url: TMUrls.ProfileDetails);
    if (response.isSuccess == true) {
      List<ProfileDModel> listData = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        listData.add(ProfileDModel.fromJson(jsonData));
      }
      setState(() {
        mList = listData;
      });
    } else {
      SnackBarMeassageError(context, message: response.responseData['data']);
    }
  }

  final Logger _logger = Logger();
  model_upDate_profile data = model_upDate_profile();


  // Future<void> updateProfile() async {
  //   final response = await ApiCaller().postRequest(
  //     url: TMUrls.ProfileUpdate,
  //     body: {
  //       'email':data.email,
  //       'firstName': data.firstName,
  //       'lastName':data.lastName,
  //       'mobile':data.mobile,
  //       'password':data.password,
  //     },
  //   );
  //   _logger.i(response.responseData);
  //   setState(() {});
  //   if (response.isSuccess) {
  //    AuthController.getUserData();
  //     _emailController.clear();
  //     _nameController.clear();
  //     _lastNameController.clear();
  //     _phoneController.clear();
  //     _passwordController.clear();
  //     SnackBarMeassage(context, message: 'Update Success');
  //     Navigator.pushReplacementNamed(context, '/HomeScreen');
  //   } else {
  //     SnackBarMeassageError(context, message: 'Update Error');
  //   }
  // }
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
    // updateProfile();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryButton,
        title: Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AssetsPath.logoPath2),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextDesign(
                    text: mList.isNotEmpty
                        ? (mList.first.email ?? '')
                        : 'EmptyName',
                    fontSize: 20,
                    color: AppColor.primaryText,
                  ),
                  CustomTextDesign(
                    text:
                        'ID:${mList.isNotEmpty ? (mList.first.sId ?? '') : ''}',
                    fontSize: 15,
                    color: AppColor.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                  controller: _emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                UserInput(
                  controller: _nameController,
                  hintText: 'First Name',
            
                  keyboardType: TextInputType.text,
                  validator: Validators.fullName,
                ),
                UserInput(
                  controller: _lastNameController,
                  hintText: 'Last Name',
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.fullName,
                ),
                UserInput(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: Validators.phone,
                ),
                UserInput(
                  controller: _passwordController,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.password,
                ),
            
                primaryButton(
                  child: Text('Update'),
                  onPressed: () {
                    // updateProfile();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



