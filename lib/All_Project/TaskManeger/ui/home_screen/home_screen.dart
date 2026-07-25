import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/util/assets_path.dart';
import 'package:flutter/material.dart';

import '../../data/auth_controller/auth_controller.dart';
import 'canceled_screen.dart';
import 'completed_screen.dart';
import 'profile_screen.dart';
import 'progress_screen.dart';
import 'task_screen.dart';
import '../widget/text_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> pages = [
    TaskScreen(),
    ProgressScreen(),
    CompletedScreen(),
    CanceledScreen(),
    ProfileScreen(),
  ];

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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            offset: Offset(0, 10),
            shadowColor: AppColor.secondaryText,

            icon: Icon(Icons.more_vert, size: 35, color: AppColor.primaryIcon,),
            // onSelected: (value) {
            //   print(value);
            // },
            itemBuilder: (context) => [
              PopupMenuItem(
                // value: "Edit",
                child: CustomTextDesign(text: 'Edit profile', fontSize: 20, color: AppColor.primaryText,fontWeight: FontWeight.bold,),
                onTap: () {

                  Navigator.pushNamed(context, '/UpdateProfile');
                }
              ),
              PopupMenuItem(
                // value: "Log Out",/////////na dilaw problem nai
                child: CustomTextDesign(text: 'Log Out', fontSize: 20, color: AppColor.primaryText,fontWeight: FontWeight.bold,),
                onTap: () {
                  AuthController.logOut();
                  Navigator.pushReplacementNamed(context, '/LoginScreen');
                }
              ),
            ],
          )
        ],
        title: Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                AssetsPath.logoPath2 
            ),

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextDesign(text: 'Mr. Jakaria Hosen', fontSize: 20, color: AppColor.primaryText,fontWeight: FontWeight.bold,),
                CustomTextDesign(text: 'hosenzakaria40@Gmail.com', fontSize: 15, color: AppColor.primaryText,),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor:AppColor.primaryButton,
        height: 50,
        overlayColor: MaterialStateProperty.all(AppColor.newTaskColor),
        indicatorColor: AppColor.newTaskColor,
        surfaceTintColor: AppColor.deleteColor,

        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        maintainBottomViewPadding: true,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            );
          }

          return const TextStyle(
            color: Colors.black,
            fontSize: 14,
          );
        }),


        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
        elevation: 1,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: Duration(milliseconds: 200),
        labelPadding: EdgeInsetsGeometry.all(1),
        destinations: [
          NavigationDestination(icon: Icon(Icons.task,color: AppColor.primaryIcon), label: 'New Task',),

          NavigationDestination(icon: Icon(Icons.refresh,color: AppColor.primaryIcon), label: 'Progress'),

          NavigationDestination(icon: Icon(Icons.task_alt_outlined,color: AppColor.primaryIcon), label:'Completed'),
          NavigationDestination(icon: Icon(Icons.cancel_outlined,color: AppColor.primaryIcon), label: 'Canceled'),

          NavigationDestination(icon: Icon(Icons.person,color: AppColor.primaryIcon), label: 'Profile'),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
