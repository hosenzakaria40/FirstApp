import 'package:fast_app/All_Project/Use_providerApp/controller/provider_controller.dart';
import 'package:fast_app/All_Project/Use_providerApp/model/task_model.dart';
import 'package:fast_app/All_Project/Use_providerApp/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'glass_card.dart';

class TodoItemTile extends StatelessWidget {
  final Todo todo;

  const TodoItemTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              context.read<TaskProvider>().toggleTodoStatus(todo.id);
            },
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration:  Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.focusedBorder,
                  width: 2,
                ),
                color: todo.isCompleted ? AppColors.focusedBorder : Colors.transparent,
              ),
              child: AnimatedOpacity(
                opacity: todo.isCompleted ? 1.0 : 0.0,
                duration:  Duration(milliseconds: 500),
                child: const Icon(Icons.check, size: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration:  Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: todo.isCompleted ? AppColors.secondaryText : AppColors.primaryText,
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  child: Text(todo.title),
                ),
                if (todo.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration:  Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText.withOpacity(todo.isCompleted ? 0.5 : 1.0),
                    ),
                    child: Text(todo.description),
                  ),
                ]
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            onPressed: (){
              context.read<TaskProvider>().removeTodo(todo.id);
            },
          ),
        ],
      ),
    );
  }
}