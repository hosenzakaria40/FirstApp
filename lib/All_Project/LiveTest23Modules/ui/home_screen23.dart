import 'package:fast_app/All_Project/LiveTest23Modules/controller23/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen23 extends StatelessWidget {
  const HomeScreen23({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task App'),
      backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.pushNamed(context,  '/AddTaskButton');
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:    context.watch<TaskProvider23>().totalTodos, // Example count
                itemBuilder: (context, index) {
                  final item = context.watch<TaskProvider23>().todos[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title),
                      titleAlignment: ListTileTitleAlignment.center,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(item.description),
                          Row(
                            children: [
                              IconButton(onPressed: () {
                                context.read<TaskProvider23>().toggleTodoStatus(item.id);
                              }, icon: Icon(item.isCompleted ? Icons.check_circle : Icons.check_circle_outline),),
                              const Spacer(),
                              IconButton(onPressed: () {
                                context.read<TaskProvider23>().removeTodo(item.id);
                              }, icon: const Icon(Icons.delete),),
                            ],
                          )
                        ],
                      ),
                                  
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
