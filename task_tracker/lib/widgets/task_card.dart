import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: task.id,
      feedback: Material(
        elevation: 4,
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            task.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: Card(
        color: task.category == 'notStarted'
            ? Colors.grey.shade300
            : task.category == 'pending'
                ? Colors.yellow.shade300
                : Colors.green.shade300,
        child: ListTile(
          title: Text(task.text),
          trailing: PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Edit'),
                onTap: () => _showEditDialog(context),
              ),
              PopupMenuItem(
                child: const Text('Delete'),
                onTap: () {
                  context.read<TaskProvider>().deleteTask(task.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final controller = TextEditingController(text: task.text);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter task text',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<TaskProvider>().updateTask(
                  task.id,
                  controller.text.trim(),
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}