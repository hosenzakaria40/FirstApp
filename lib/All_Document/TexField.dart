import 'package:flutter/material.dart';

class Texfield extends StatelessWidget {
  const Texfield({super.key});

  TextEditingController? get controller => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('TexFiled', style: TextStyle(fontSize: 30)),
                SizedBox(height: 10),

                TextField(
                  // maxLength: 10,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    ///??????
                    enabledBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(5),
                      // borderSide: BorderSide(color: Colors.red,width: 3)
                    ),
                    ///??????
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                 TextField(
                  maxLength: 10,
                  // controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // filled:true,
                    labelText: 'Number',
                    hintText: 'Enter Number',
                    prefixIcon: Icon(Icons.call),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(
                      // gapPadding: 10,
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // TextField(
                //   // maxLength: 10,
                //   maxLines: 5,
                //
                //   controller: controller,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     labelText: 'Address',
                //     hintText: 'Address',
                //     prefixIcon: Icon(Icons.add_location),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //       borderSide: BorderSide(color: Colors.blue, width: 10),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),

                // TextField(
                //   obscureText: true,
                //   maxLength: 10,
                //   // maxLines: 5,
                //   controller: controller,
                //   keyboardType: TextInputType.visiblePassword,
                //   decoration: InputDecoration(
                //     labelText: 'Password',
                //     hintText: 'Password',
                //     prefixIcon: Icon(Icons.password),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //       borderSide: BorderSide(color: Colors.red, width: 2),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
| বিষয়        | prefixIcon      | prefix              |
| ----------- | --------------- | ------------------- |
| মূল কাজ     | Icon show করা   | Any widget show করা |
| Padding     | Automatic বেশি  | কম                  |
| Position    | একদম start side | text এর কাছাকাছি    |
| Size        | fixed area নেয়  | widget যতটুকু লাগে  |
| বেশি use হয় | ✅               | কম                  |
-------------------------------------------------
-------------------------------------------------
prefix আর prefixIcon যেমন আলাদা, ঠিক তেমনি suffix আর suffixIcon ও আলাদা।

এগুলো TextField এর ডান পাশে কাজ করে।

 */
