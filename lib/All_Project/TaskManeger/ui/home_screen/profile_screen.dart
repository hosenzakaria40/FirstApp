import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../util/assets_path.dart';
import '../widget/primary_button.dart';
import '../widget/text_design.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            CustomTextDesign(text: 'Mr. Jakaria Hosen', fontSize: 40, color: AppColor.primaryText,fontWeight: FontWeight.w900,),
            CustomTextDesign(text: 'hosenzakaria40@Gmail.com', fontSize: 25, color: AppColor.primaryText,),
            CustomTextDesign(text: '01914366469', fontSize: 25, color: AppColor.primaryText,),
            primaryButton(child: Text('Update'), onPressed: (){
              Navigator.pushReplacementNamed(context, '/UpdateProfile');
            }),

          ],
        ),
      ),

    );
  }
}
