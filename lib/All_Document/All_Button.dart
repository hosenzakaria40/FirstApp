import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'apps',
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.greenAccent,////1
          backgroundColor: Colors.green[900],

          ////2  only 100-900 value
          // backgroundColor: Colors.greenAccent.shade700,////3
          // backgroundColor: Colors.greenAccent.withOpacity(0.6),////4////only0.1-0.1value
          drawer: Drawer(backgroundColor: Colors.blue),
          appBar: AppBar(
            title: Text('data'),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 40),
            elevation: 10,
            centerTitle: true,
            // toolbarOpacity: 100,
            // leadingWidth: 50,
            backgroundColor: Colors.teal,
            clipBehavior: Clip.antiAlias,
          ),
          body: Center(
            child: Column(
              // mainAxisAlignment:MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('tab', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 200,
                  child:
                      /*
                    কোথায় ব্যবহার হয়:
                    ✔ Submit button
                    ✔ Login / Sign up
                    ✔ Confirm action
                    ✔ Main CTA (Call To Action)
                       */
                      ElevatedButton(
                        onPressed: () {
                          print('Sing');
                        },
                        child: Text('sing', style: TextStyle(fontSize: 30)),
                      ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 200,
                  /*
                  কোথায় ব্যবহার হয়:
                  ✔ Cancel / Back
                  ✔ Alternative option
                  ✔ Secondary action

                  👉 Example:
                    Dialog → Cancel button
                    Form → Reset button
                    */
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('outine', style: TextStyle(fontSize: 30)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  onDoubleTap: () {},
                  onLongPress: () {},
                  child: Text('data'),
                ),
                GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {},
                  onLongPressUp: () {},
                  child: Text('seemor'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text('Edit Address'),
                  icon: Icon(Icons.edit_calendar_outlined),
                ),
                TextButton(onPressed: (){}, child: Text('data'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Flutter এ অনেক ধরনের button আছে। সবচেয়ে বেশি ব্যবহার হয় এগুলো:

1.....ElevatedButton
উঁচু/shadow যুক্ত button
গুরুত্বপূর্ণ action এর জন্য
ElevatedButton(  onPressed: () {},  child: Text('Click'),)

2....TextButton
শুধু text থাকে
background থাকে না
TextButton(  onPressed: () {},  child: Text('Text Button'),)

3.....OutlinedButton
border থাকে
lightweight action এর জন্য
OutlinedButton(  onPressed: () {},  child: Text('Outline'),)

4....IconButton
শুধু icon button
IconButton(  onPressed: () {},  icon: Icon(Icons.favorite),)

5....FloatingActionButton
গোলাকার floating button
সাধারণত নিচে থাকে
FloatingActionButton(  onPressed: () {},  child: Icon(Icons.add),)

6...DropdownButton
dropdown menu button
DropdownButton(  items: [],  onChanged: (value) {},)

7....PopupMenuButton
তিন ডট menu button
PopupMenuButton(  itemBuilder: (context) => [],)

8...BackButton
automatic back button
BackButton()

9...CloseButton
close icon button
CloseButton()

10......ToggleButtons
multiple selectable button
ToggleButtons(  isSelected: [true, false],  children: [    Icon(Icons.home),    Icon(Icons.settings),  ],)

11...CupertinoButton
iOS style button

12...CupertinoButton(  child: Text('iOS'),  onPressed: () {},)

সবচেয়ে বেশি ব্যবহার হয়:
...ElevatedButton
....TextButton
.....OutlinedButton
......IconButton
.......FloatingActionButton
এগুলাকে Flutter এর modern button system বলা হয়।
 */