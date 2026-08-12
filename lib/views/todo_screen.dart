import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/task_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              _buildAddTaskCard(controller, theme),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.tasks.isEmpty) {
                    return const EmptyState();
                  }

                  return ListView.separated(
                    itemCount: controller.tasks.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = controller.tasks[index];
                      return TaskItem(
                        task: task,
                        onToggle: () => controller.toggleTask(index),
                        onDelete: () => _confirmDelete(context, controller, index),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddTaskCard(TaskController controller, ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.inputController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'What needs to be done?',
                  border: InputBorder.none,
                  isDense: true,
                ),
                onSubmitted: (_) => controller.addTask(controller.inputController.text),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => controller.addTask(controller.inputController.text),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, TaskController controller, int index) {
    final taskTitle = controller.tasks[index].title;

    Get.defaultDialog(
      title: 'Delete Task?',
      middleText: 'Are you sure you want to delete "$taskTitle"?',
      textCancel: 'Cancel',
      textConfirm: 'Delete',
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.deleteTask(index);
        Get.back();
      },
    );
  }
}
