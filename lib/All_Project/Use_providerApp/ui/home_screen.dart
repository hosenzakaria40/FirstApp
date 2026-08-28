import 'package:fast_app/All_Project/Use_providerApp/controller/provider_controller.dart';
import 'package:fast_app/All_Project/Use_providerApp/theme/app_color.dart';
import 'package:fast_app/All_Project/Use_providerApp/widget/add_task.dart';
import 'package:fast_app/All_Project/Use_providerApp/widget/glass_animation.dart';
import 'package:fast_app/All_Project/Use_providerApp/widget/glass_card.dart';
import 'package:fast_app/All_Project/Use_providerApp/widget/progress_ring.dart';
import 'package:fast_app/All_Project/Use_providerApp/widget/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home_ScreenTask extends StatefulWidget {
  const Home_ScreenTask({Key? key}) : super(key: key);

  @override
  State<Home_ScreenTask> createState() => _Home_ScreenTaskState();
}

class _Home_ScreenTaskState extends State<Home_ScreenTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,///Appber background use body
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/00.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Consumer<TaskProvider>(
            builder: (context, todoProvider, child) => Column(
              children: [
                const SizedBox(height: 20),
                ProgressRing(progress: todoProvider.progress),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GlassCard(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.task_alt, color: AppColors.focusedBorder),
                        const SizedBox(width: 12),
                        Text(
                          '${todoProvider.completedTodos} of ${todoProvider.totalTodos} tasks completed today',
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: todoProvider.todos.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.coffee,
                          size: 64,
                          color: AppColors.secondaryText.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'All caught up!',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Enjoy your day',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 100),
                    itemCount: todoProvider.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todoProvider.todos[index];
                      return TodoItemTile(todo: todo);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GlassFab(
        icon: const Icon(Icons.add, color: AppColors.primaryText, size: 32),
        onPressed: () async {
          final result = await showDialog<Map<String, String>>(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
          if (result != null) {
            context.read<TaskProvider>().addTodo(
              result['title']!,
              result['description']!,
            );
          }
        },
      ),
    );
  }
}