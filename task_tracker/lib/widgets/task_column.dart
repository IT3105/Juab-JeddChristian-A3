import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'task_card.dart';

class TaskColumn extends StatelessWidget {
  final String title;
  final String category;

  const TaskColumn({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: (taskId) {
        context.read<TaskProvider>().moveTask(taskId, category);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: category == 'notStarted'
                ? Colors.grey.shade200
                : category == 'pending'
                    ? Colors.yellow.shade100
                    : Colors.green.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                    final tasks = taskProvider.getTasksByCategory(category);
                    return ListView.separated(
                      itemCount: tasks.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return TaskCard(task: tasks[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}