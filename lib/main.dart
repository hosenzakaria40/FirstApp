import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppstate createState() {
    return _MyAppstate();
  }
}

class _MyAppstate extends State<MyApp> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fast_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))
          ),
          toolbarOpacity: .9,
          toolbarHeight: 90.0,
          elevation: 30.0,
          //ai te shadow colors ar bottom height barai
          shadowColor: Colors.yellow,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('object');
            },
          ),
          title: Text('big title'),
          centerTitle: true,
          //title ka center a niya jai
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {
              print('search');
            },),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {
              print('favorite');
            },),
            IconButton(icon: Icon(Icons.person), onPressed: () {
              print('person');
            },)
          ],
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: 'person',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'favorite',
                icon: Icon(Icons.favorite),
              ),
              Tab(
                text: 'shopping_cart',
                icon: Icon(Icons.shopping_cart),
              ),
              Tab(
                text: 'card_travel',
                icon: Icon(Icons.card_travel),
              )
            ],
          ),
          bottomOpacity: .9,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('Person'),),
            Center(child: Text('Favorite'),),
            Center(child: Text('Shopping_cart'),),
            Center(child: Text('card_travel'),)
          ],//
        ),
        bottomNavigationBar: Material(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            // current index=0;
            // controller: ,
            tabs: [
              Tab(
                text: 'person',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'favorite',
                icon: Icon(Icons.favorite),
              ),
              Tab(
                text: 'shopping_cart',
                icon: Icon(Icons.shopping_cart),

              ),
              Tab(
                text: 'card_travel',
                icon: Icon(Icons.card_travel),
              )
            ],
          ),
        ),
      ),
    );
  }
}

