import 'package:fast_app/All_Project/TaskManeger/ui/home_screen/navigation_screen.dart'
    show NavigationScreen;
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    NavigationScreen(),
    NavigationScreen(),
    NavigationScreen(),
    NavigationScreen(),
    NavigationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Expanded(child: pages[0])]),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),

          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),

          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorite'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),

          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: (index) {
          setState(() {
            pages[index];
          });
        },
        selectedIndex: 0,
      ),
    );
  }
}
