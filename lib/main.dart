import 'package:fast_app/All_Project/CalculatorApps1st/Calculator.dart';
import 'package:fast_app/All_Project/Module12Assignment/RegisterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AllBasicStructure.dart';
import 'All_Document/AlertBox.dart';
import 'All_Document/AnimatedContainer.dart';
import 'All_Document/AnimatedWidget.dart';
import 'All_Document/CustomWidget.dart';

import 'All_Document/DragDrow.dart';
import 'All_Document/ListView_Separated.dart';
import 'All_Document/Navigator.dart';
import 'All_Document/Package.dart';
import 'All_Document/Responsible.dart';
import 'All_Document/StateManagement.dart';
import 'All_Document/Stepper.dart';
import 'All_Document/TexField.dart';
import 'All_Document/TextField_adv.dart';
import 'All_Document/shimmerPackage.dart';
import 'All_Project/Navigator/Home.dart';
import 'All_Project/Navigator/TapberW.dart';
import 'All_Project/StudentProfileCard/Loading.dart';
import 'All_Project/StudentProfileCard/Profile.dart';
import 'All_Project/TodoAssignment/CreateScreen.dart';
import 'All_Project/TodoAssignment/homePageTodo.dart';
import 'firstDesign.dart';
import 'Practice.dart';
import 'AllMaterial.dart';
import 'All_Document/ListViewD.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomeWidget(),
            '/firstDesign': (context) => FirstDesign(),
            '/practice': (context) => PracticeW(),
            '/allMaterial': (context) => MyApps(),
            '/allBasicStructure': (context) => Apps(),
            '/AnimatedContainer': (context) => Animated(),
            '/AnimatedWidget': (context) => Animatedwidget(),
            '/CustomWidget': (context) => CustomWidget(),
            '/DragDrow': (context) => Dragdrow(),
            '/ListView_Separated': (context) => ListviewSeparetd(),
            '/Responsible': (context) => Responsible(),
            '/StateManagement': (context) => Statemanagement(),
            '/Stepper': (context) => StepperWidget(),
            '/TextField': (context) => TexfieldW(),
            '/TextField_adv': (context) => TextfieldAdv(),
            '/Calculator': (context) => Calculator(),
            '/RegisterPage': (context) => Module12(),
            '/ListViewD': (context) => ListviewD(),
            '/TabberWidget': (context) => TapberWidget(),
            '/HomePageTodo': (context) => Homepagetodo(),
            '/CreateScreen': (context) => Createscreen(),
            '/Package': (context) => Package(),
            '/ShimmerPackage': (context) => Shimmerpackage(),
            '/ShimmerPackage': (context) => DoctorHomeShimmer(),
            '/AlertBox': (context) => Alertbox(),
            '/NavigatorPage': (context) => NavigatorPage(),
            '/ProfilePage': (context) => ProfilePage(),
            '/LoadingPage': (context) => LoadingPage(),
          },
          initialRoute: '/LoadingPage',
        );
      },
      // child: const HomePage(title: 'First Method'),
    );


  }
}

//////Package ScreenUtilInit////
/*
 return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {

      },
      child: const HomePage(title: 'First Method'),
    );
 */
