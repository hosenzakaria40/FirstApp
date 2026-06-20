import 'package:flutter/material.dart';

class TapberWidget extends StatefulWidget {
  const TapberWidget({super.key});

  @override
  State<TapberWidget> createState() => _TapberWidgetState();
}

class _TapberWidgetState extends State<TapberWidget>with SingleTickerProviderStateMixin{
  late TabController  _tabController;
  int _currentIndex = 0;
  // int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this,initialIndex: _currentIndex);
    // _tabController.addListener(() {
    //   setState(() {
    //     _currentIndex = _tabController.index;
    //   });
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _currentIndex++;
            _tabController.animateTo(_currentIndex);
          });
          if(_currentIndex==2){
             _currentIndex=-1;
          }

        },
        child: Icon(Icons.add),
      ),

        appBar: AppBar(
          toolbarHeight: 30,
          elevation: 1,
          backgroundColor: Colors.blue,
          title: Text('Tapber'),
          centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Home',icon: Icon(Icons.home),),
            Tab(text: 'Mail',icon: Icon(Icons.contact_mail),),
            Tab(text: 'Profile',icon: Icon(Icons.person),),

          ],

        ),
      ),
      body: TabBarView(
        controller:_tabController ,
        children: [
          Container(color:Colors.blue ,child: Center(child: Text('Home'))),
          Container(color: Colors.red,child: Center(child: Text('Mail'))),
          Container(color: Colors.orange,child: Center(child: Text('Profile'))),


        ],
      ),
    );
  }
}
