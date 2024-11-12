import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task.dart';
import 'providers/task_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const TaskTrackerApp(),
    ),
  );
}

class TaskTrackerApp extends StatelessWidget {
  const TaskTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      home: const HomeScreen(),
    );
  }
}