import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              // //যদি আপনি একটি আয়তক্ষেত্র প্রদর্শন করতে চান:
              Container(color: Colors.blue, height: 100, width: 100),
              Container(color: Colors.red, height: 100.h, width: 100.w,child: Center(child: Text('Awoto katro')),),
              // //যদি আপনি প্রস্থের উপর ভিত্তি করে একটি বর্গক্ষেত্র প্রদর্শন করতে চান
              SizedBox(height: 10),
              Container(color: Colors.indigo, height: 100.w, width: 100.w,child: Center(child: Text('Square')),),
              SizedBox(height: 10),
              Text('I am mr.King',style: TextStyle(fontSize: 20.sp),),
              SizedBox(height: 10),
              Icon(Icons.favorite,size: 30.sp,color: Colors.red,),
              SizedBox(height: 10),
              StaggeredGrid.count(

                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing:2,
                          children:  [
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 3,
                child: Image.asset('assets/00.jpg'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child:Image.asset('assets/00.jpg'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assets/00.jpg'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:Image.asset('assets/00.jpg'),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Image.asset('assets/00.jpg'),
              ),
                          ],
                        ),
              SizedBox(height: 10),
              MasonryGridView.count(
                itemCount: 20,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,

                  crossAxisCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.blue,
                      height: 200.w,
                      width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage('assets/SC.png'),
                        fit: BoxFit.cover,
                        // scale: 2,
                      ),
                    ),
                    // child: Image.asset('assets/SC.png',scale: 2,fit: BoxFit.cover,),
                    );
                  }
                  ),
              SizedBox(height: 20,),

              /*

ছোট item-এর নিচের খালি জায়গা অন্য item দিয়ে fill করে দেয়।
+-----+-----+
|  1  |     |
|     |  2  |
+-----+     |
|  3  |     |
+-----+-----+
|     |  4  |
|  5  |     |
+-----+-----+

               */
              MasonryGridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,

                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,


                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.blue,
                      height: 250.w,
                      width: 200.w,
                      child: Image.asset('assets/IMG.jpg',scale: 2,fit: BoxFit.cover,),
                    );
                  })

          
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
