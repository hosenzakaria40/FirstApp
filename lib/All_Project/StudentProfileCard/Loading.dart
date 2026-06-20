import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}


class _LoadingPageState extends State<LoadingPage> {
@override
void initState() {
  super.initState();
  Future.delayed(Duration(seconds: 2), () {
    Navigator.pushReplacementNamed(context, '/ProfilePage');
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Student Profile'),
        titleTextStyle: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo[700],
        centerTitle: true,
      ),
      body: Center(
        child: Shimmer.fromColors(
          period: Duration(milliseconds: 500),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: SizedBox(height: 300.w, width: 300.w, child: Card()),
        ),
      ),
    );
  }
}
