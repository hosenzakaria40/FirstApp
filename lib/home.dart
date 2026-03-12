import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'apps',
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.greenAccent,////1
          backgroundColor: Colors.green[900],////2  only 100-900 value
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
                  child: ElevatedButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
