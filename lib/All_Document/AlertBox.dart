import 'package:flutter/material.dart';

class Alertbox extends StatefulWidget {
  const Alertbox({super.key});

  @override
  State<Alertbox> createState() => _AlertboxState();
}

class _AlertboxState extends State<Alertbox> {
  void showMyAlertDialog() {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white,
      /*Dialog-এর পিছনের background overlay color*/
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      anchorPoint: Offset(10, 10),

      context: context,
      builder: (context) => AlertDialog(
        title: Text('This is Title'),
        content: Text('This is alert box Content'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void showMyAlertDialogWithIcons() {
    showDialog(
      barrierDismissible: false,
      // barrierColor: Colors.white,/*Dialog-এর পিছনের background overlay color*/
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,

      // anchorPoint: Offset(10, 10),
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Icon(Icons.warning, color: Colors.red, size: 30),
            SizedBox(height: 10),
            Divider(indent: 5, endIndent: 5, thickness: 2),
          ],
        ),
        content: Container(
          height: 100,
          width: 100,
          color: Colors.indigo,
          child: CircleAvatar(radius: 30, backgroundColor: Colors.red),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(onPressed: () {}, child: Text('data')),
          TextButton(onPressed: () {}, child: Text('data')),
        ],
      ),
    );
  }

  void showMySimpleAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('This is Title'),
        children: [
          Text('This is alert box Content'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          SimpleDialogOption(onPressed: () {}, child: Text('data')),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
        titlePadding: EdgeInsetsGeometry.all(10),
        contentPadding: EdgeInsetsGeometry.all(40),
        backgroundColor: Colors.white,
      ),
    );
  }

  void showMyBottomSheet() {
    showModalBottomSheet(context: context, builder: ( context) =>Container(
      child: Column(
        children: [
          Text('This is Title'),
          Text('This is alert box Content'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    ));
  }
  void showMySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is SnackBar'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                showMyAlertDialog();
              },
              child: Text('AlertDialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showMyAlertDialogWithIcons();
              },
              child: Text('AlertDialogIcons'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showMySimpleAlertDialog();
              },
              child: Text('SimpleAlertDialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('data')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('data')),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
