import 'package:flutter/material.dart';

class Createscreen extends StatefulWidget {
  TextEditingController todoTEController = TextEditingController();
 Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.check_box_outline_blank_rounded,color: Colors.black54,size: 25,),
                  SizedBox(width: 10,),
                  Text(
                    'What\'s in your mind?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),

              TextField(
                controller: widget.todoTEController,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.grey.shade200,
                  hintText: 'Add a note... ',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  ),
                  prefixIcon: Icon(Icons.create_sharp,color: Colors.black38,),
                  // suffixIcon: Icon(Icons.more_horiz,color: Colors.black38,),
                  border:InputBorder.none,
                ),
                maxLines: 5,
                minLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

              ),
              SizedBox(height: 200,),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade100,
                    foregroundColor: Colors.indigo,
                    alignment: Alignment.topLeft,
                    textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // addTodo();

                  },
                  child: Text('+ Create task'),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
