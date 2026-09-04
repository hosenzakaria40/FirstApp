import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final fireStore = FirebaseFirestore.instance;

  Future<void> createData() async {
    try {
      await fireStore.collection('users').add({
        'name': 'John Doe',
        'score': 100,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Data Added");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  Future<void> readData() async {
    try {
      final querySnapshot = await fireStore.collection('users').get();
      for (var doc in querySnapshot.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    } catch (e) {
      print("Error reading data: $e");
    }
  }

  Future<void> updateData() async {
    try {
      // Note: In a real app, you would pass the specific document ID
      final collection = await fireStore.collection('users').get();
      if (collection.docs.isNotEmpty) {
        final docId = collection.docs.first.id;
        await fireStore.collection('users').doc(docId).update({'score': 150});
        print("Data Updated");
      }
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  Future<void> deleteData() async {
    try {
      final collection = await fireStore.collection('users').get();
      if (collection.docs.isNotEmpty) {
        final docId = collection.docs.first.id;
        await fireStore.collection('users').doc(docId).delete();
        print("Data Deleted");
      }
    } catch (e) {
      print("Error deleting data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextButton(
                onPressed: createData,
                child: Text('ADD DATA', style: TextStyle(fontSize: 50)),
              ),
              TextButton(
                onPressed: readData,
                child: Text('READ DATA', style: TextStyle(fontSize: 50)),
              ),
              TextButton(
                onPressed: deleteData,
                child: Text('DELETE DATA', style: TextStyle(fontSize: 50)),
              ),
              TextButton(
                onPressed: updateData,
                child: Text('UPDATE DATA', style: TextStyle(fontSize: 50)),
              ),
              Text('FireBase CRUD Operation', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
