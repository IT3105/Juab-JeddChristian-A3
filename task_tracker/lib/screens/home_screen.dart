import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_column.dart';
import '../widgets/add_task_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              'Task Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            const AddTaskForm(),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TaskColumn(
                      title: 'Not Started',
                      category: 'notStarted',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TaskColumn(
                      title: 'In Progress',
                      category: 'pending',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TaskColumn(
                      title: 'Finished',
                      category: 'finished',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}