import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'DialogueBox/showMyCustomDialog.dart';
import 'DialogueBox/showMySnackBar.dart';
import 'Widget/TextDesign.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isLabelVisible =true;


  void toggleLabelVisibility() {
  if (isLabelVisible == true) {
    setState(() {
  isLabelVisible = false;
  });
  } else {
  return setState(() {
    isLabelVisible = false;
  });
  }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60.h,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              // height: 300.w,
              // width: 300.w,
              child: Card(
                elevation: 5,

                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Badge(
                        isLabelVisible:isLabelVisible ,
                        offset: Offset(-15.w, 5.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                          vertical: 1.sp,
                        ),
                        backgroundColor: Colors.red,

                        textColor: Colors.white,
                        label: Text('New'),
                        child: CircleAvatar(
                          backgroundColor: Colors.indigo[100],
                          radius: 40.w,
                          child:
                          Icon(
                            Icons.person,
                            size: 40.sp,
                            color: Colors.indigo[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextDesign(
                        text: 'Mike Rack',
                        fontSize: 20.sp,
                        color: Colors.indigo[700]!,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5.h),
                      TextDesign(
                        text: 'ID:STU-2025-0042',
                        fontSize: 15.sp,
                        color: Colors.grey[700]!,
                      ),
                      SizedBox(height: 5.h),
                      TextDesign(
                        text: 'Computer Science & Engineering',
                        fontSize: 15.sp,
                        color: Colors.grey[700]!,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.sp),
                            backgroundColor: Colors.indigo[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            showMyCustomDialog(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline, size: 15.sp),
                              SizedBox(width: 5.w),
                              Text(
                                'View Details',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(10.sp),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            side: BorderSide(
                              color: Colors.green[700]!,
                              width: 1.w,
                            ),
                          ),
                          onPressed: () {
                            toggleLabelVisibility();
                            showMySnackBar(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_box_outlined, size: 15.sp),
                              SizedBox(width: 5.w),
                              Text(
                                'Mark Present',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
