//
//
// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(Myapp());
//
// }
// class Myapp extends StatelessWidget {
//   const Myapp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Zakaria App',
//           theme: ThemeData(
//             primarySwatch: Colors.green,
//           ),
//
//           darkTheme: ThemeData.dark(),
//           themeMode: ThemeMode.system,
//
//           initialRoute: '/',
//           routes: {
//             // '/': (context) => HomePage(),
//             // '/about': (context) => AboutPage(),
//           },
//
//       home:Scaffold(
//
//         drawer: Drawer(
//           backgroundColor: Colors.cyanAccent,
//           child: ListView(
//             children: [
//               Text('data'),
//               Text('d'),
//               Text('ta'),
//           ],
//         ),
//         ),
//           appBar: AppBar(
//
//             title: SizedBox(child: Text('Zakaria App')),
//             automaticallyImplyActions: true,
//             centerTitle: true,
//             backgroundColor: Colors.green,
//             toolbarHeight: 50,
//             elevation: 7,
//             leadingWidth: 50,
//             // leading: IconButton(
//             //   icon: Icon(Icons.menu),
//             //   onPressed: () {},
//             // ),
//             ////Costume
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {print('arrow');},
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(80),
//               ),
//             ),
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.red, Colors.blue, Colors.green],
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.search),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: Icon(Icons.settings),
//                 onPressed: () {},
//               ),
//             ],
//             // bottom: TabBar(
//               // tabs: [
//               //   Tab(text: 'Home'),
//               //   Tab(text: 'Profile'),
//               // ],
//             // ),
//           ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

/// main methode
void main() {
  runApp(app());
}

/////Material
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'apps ', home: Home());
  }
}

////home
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child: Center(
          child: Column(
            children: [
              IconButton( icon: Icon(Icons.import_export_outlined),onPressed: (){print('back');},),
              Text('data1'),
              Text('data2'),
              Text('data3'),
              Text('data4'),
              Text('data5'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('flutter'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        shadowColor: Colors.black,
        actions: [
          Icon(Icons.face_2),
          Icon(Icons.favorite),
          Icon(Icons.card_travel),

        ],

      ),
      body: Body(),
    );
  }

}
////Body
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          Text('body ', style:TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 50),),
        ]
    );
  }
}

