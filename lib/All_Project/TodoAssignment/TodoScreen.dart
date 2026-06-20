import 'package:flutter/material.dart';
import 'CreateScreen.dart';

class Todoscreen extends StatefulWidget {
  TextEditingController todoTEController = TextEditingController();
 Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  TextEditingController todoTEController = TextEditingController();
  bool isChecked = false;
  List list=['jhgfhgff',45454];
  void addTodo(){
    if(todoTEController.text.isEmpty){
      setState(() {
        list.add(todoTEController.text);
        todoTEController.clear();
      });
    }
  }
  ScrollController todo = ScrollController();
  void removeTodo(int index){
    list.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.check_box, color: Colors.blue, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Taski',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Welcome,',
                    children: [
                      TextSpan(
                        text: ' John',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You\'ve got 7 tasks todo',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(

                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount:list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Checkbox(value:isChecked,
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                                isChecked = value!;
                              });
                            }

                        ),
                        trailing: IconButton(onPressed: (){
                          removeTodo(index);
                        }, icon: Icon(Icons.delete,color: Colors.red,)),
                        title: Text(list[index].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
