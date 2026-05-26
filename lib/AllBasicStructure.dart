import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Apps());
}

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apps',
      theme:ThemeData(primaryColor: Colors.blue),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 1,
          toolbarHeight: 60,
          toolbarOpacity: 1,
          // titleSpacing: 100,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 30,fontFamily:'serif',),
          actions: [
              // 🔍 Search
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  print('Search clicked');
                },
              ),

              // 🔔 Notification
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {},
                  ),

                  // 🔴 Notification badge
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),

              // 👤 Profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300',
                  ),
                ),
              ),

              // ⋮ Menu
              PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'settings', child: Text('Settings')),
                  const PopupMenuItem(value: 'logout', child: Text('Logout')),
                ],
              ),
            ],
        ),
      ),
    );
  }
}
