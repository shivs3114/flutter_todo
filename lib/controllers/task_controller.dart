import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/task_model.dart';

class TaskController extends GetxController {
  final RxList<Task> tasks = <Task>[].obs;
  final TextEditingController inputController = TextEditingController();

  void addTask(String title) {
    final text = title.trim();
    if (text.isEmpty) {
      Get.snackbar(
        'Empty task',
        'Please enter a task before adding.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        icon: const Icon(Icons.error_outline, color: Colors.white),
      );
      return;
    }

    tasks.add(Task(title: text));
    inputController.clear();
  }

  void toggleTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }

  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks.removeAt(index);
  }
}
