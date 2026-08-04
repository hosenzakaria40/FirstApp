import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:fast_app/All_Project/TaskManeger/util/assets_path.dart';
import 'package:flutter/material.dart';

import '../../data/auth_controller/auth_controller.dart';
import '../../data/models/TaskModelManager.dart';
import '../../data/models/profileDModel.dart';
import '../../data/models/task_count_model.dart';
import '../../data/service/api_caller.dart';
import '../../util/urls.dart';
import '../widget/Custom_snakber.dart';
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
  ApiCaller apiCaller = ApiCaller();
  int _currentIndex = 0;

  List<Widget> get pages => [
    TaskScreen(
      taskList: All_taskList,
      parameterGetAllTask: () {getAllTask();},
      parameterGetAllTaskCount: () {getAllTaskCount();},
      countModelList: ModelList,
    ),

    ProgressScreen(
      taskList: All_taskList,
      parameterGetAllTask: () {
        getAllTask();
      }, parameterGetAllTaskCount: () { getAllTaskCount(); },
    ),

    CompletedScreen(
      taskList:All_taskList,
      parameterGetAllTask: () {
        getAllTask();
      },
      parameterGetAllTaskCount: () {
        getAllTaskCount();
      },
    ),

    CanceledScreen(
      taskList: All_taskList,
      parameterGetAllTask: () {
        getAllTask();
      },
      parameterGetAllTaskCount: () {
        getAllTaskCount();
      },
    ),

    ProfileScreen(),
  ];



  List<ProfileDModel> mList=[];
  Future<void> getProfile() async {
  final response = await ApiCaller().getRequest(url: TMUrls.ProfileDetails);
  if (response.isSuccess == true) {
  List<ProfileDModel> listData = [];
  for (Map<String, dynamic> jsonData in response.responseData['data']) {
  listData.add(ProfileDModel.fromJson(jsonData));
  }
  setState(() {
  mList= listData ;
  });

  }else{
  SnackBarMeassageError(context, message:response.responseData['data']);
  }


  }

  List<TaskModelManager> All_taskList = [];
  Future<void> getAllTask() async {
  final response = await apiCaller.getRequest(url: TMUrls.AllTask('New Task'));
  List<TaskModelManager> AllTasklistData = [];
  if (response.isSuccess == true) {
  for (Map<String, dynamic> jsonData in response.responseData['data']) {
  AllTasklistData.add(TaskModelManager.fromJson(jsonData));
  jsonData.addAll(jsonData);
  }
  setState(() {
  All_taskList = AllTasklistData;
  });
  }else{
  return SnackBarMeassageError(context, message:response.responseData['data']);
  }
  }

  List<taskCountModel> ModelList = [];
  Future getAllTaskCount() async {
  final response = await apiCaller.getRequest(url: TMUrls.taskCount);
  List<taskCountModel> listData = [];

  if (response.isSuccess == true) {
  for (Map<String, dynamic> jsonData in response.responseData['data']) {
  listData.add(taskCountModel.fromJson(jsonData));
  }

  setState(() {
  ModelList = listData;
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
  getAllTask();
  getAllTaskCount();
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
  CustomTextDesign(
  text: mList.isNotEmpty ? (mList.first.email ?? '') : 'EmptyName',
  fontSize: 20,
  color: AppColor.primaryText,
  ),
  CustomTextDesign(
  text:'ID:${ mList.isNotEmpty ? (mList.first.sId ?? '') : ''}',
  fontSize: 15,
  color: AppColor.primaryText,
  fontWeight: FontWeight.bold,
  ),
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
