import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../data/models/profileDModel.dart';
import '../../data/service/api_caller.dart';
import '../../util/assets_path.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
import '../widget/primary_button.dart';
import '../widget/text_design.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(AssetsPath.logoPath2),
            ),
            CustomTextDesign(
              text: mList.isNotEmpty ? (mList.first.email ?? '') : '',
              fontSize:30,
              color: AppColor.primaryText,
              fontWeight: FontWeight.w900,
            ),
            CustomTextDesign(
              text:"ID:${ mList.isNotEmpty ? (mList.first.sId ?? '') : ''}",
              fontSize: 20,
              color: AppColor.primaryText,

            ),
            CustomTextDesign(
              text: "Password:${mList.isNotEmpty ? (mList.first.password ?? '') : ''}",
              fontSize: 20,
              color: AppColor.primaryText,
            ),
            primaryButton(
              child: Text('Update'),
              onPressed: () {
                Navigator.pushNamed(context, '/UpdateProfile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
