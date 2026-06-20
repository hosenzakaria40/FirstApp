import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerpackage extends StatelessWidget {
  const Shimmerpackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,

          itemBuilder:(context,index){
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,

              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                title: Container(
                  width: 100,
                  height: 30,
                  color: Colors.white,
                ),
                trailing: Container(
                  width: 100,
                  height: 30,
                  color: Colors.white,
                ),
                subtitle: Container(
                  width: 100,
                  height: 10,
                  color: Colors.white,
                ),

               )
            );
          }
            ),

    );
  }
}










class DoctorHomeShimmer extends StatelessWidget {
  const DoctorHomeShimmer({super.key});

  Widget shimmerBox({
    required double height,
    required double width,
    double radius = 12,
  }) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F8),
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Header
              Container(
                height: 220.h,
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [

                            shimmerBox(
                              height: 50,
                              width: 50,
                              radius: 25,
                            ),

                            SizedBox(width: 10.w),

                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                shimmerBox(
                                  height: 12,
                                  width: 80,
                                ),

                                SizedBox(height: 8.h),

                                shimmerBox(
                                  height: 18,
                                  width: 150,
                                ),
                              ],
                            ),
                          ],
                        ),

                        shimmerBox(
                          height: 25,
                          width: 25,
                          radius: 8,
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    shimmerBox(
                      height: 18,
                      width: 220,
                    ),

                    SizedBox(height: 25.h),

                    Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(15.r),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// Categories Title
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: shimmerBox(
                    height: 18,
                    width: 100,
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// Categories
              SizedBox(
                height: 90.h,
                child: ListView.separated(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: 15.w),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [

                        shimmerBox(
                          height: 55,
                          width: 55,
                          radius: 30,
                        ),

                        SizedBox(height: 8.h),

                        shimmerBox(
                          height: 10,
                          width: 40,
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),

              /// Recommended Doctors Title
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: shimmerBox(
                    height: 18,
                    width: 170,
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// Doctor Cards
              SizedBox(
                height: 230.h,
                child: ListView.separated(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Container(
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(
                                  12.r),
                            ),
                          ),

                          SizedBox(height: 10.h),

                          shimmerBox(
                            height: 15,
                            width: 100,
                          ),

                          SizedBox(height: 8.h),

                          shimmerBox(
                            height: 12,
                            width: 70,
                          ),

                          SizedBox(height: 10.h),

                          shimmerBox(
                            height: 12,
                            width: 40,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
