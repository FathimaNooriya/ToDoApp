import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/model/task_model.dart';

class AddTaskController extends GetxController {
  // Controllers for text fields
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDiscriptionController =
      TextEditingController();

  // Observable variables
  final taskFormkey = GlobalKey<FormState>();
  RxBool taskdone = false.obs;
  RxInt updateIndex = 0.obs;
  RxList<TaskModel> taskList = <TaskModel>[].obs;

  // Dispose of the controllers
  @override
  void onClose() {
    super.onClose();
    taskTitleController.dispose();
    taskDiscriptionController.dispose();
  }

  // Clear input fields and reset task status
  void clear() {
    taskDiscriptionController.clear();
    taskTitleController.clear();
    taskdone.value = false;
  }

  // Validate task title
  String? taskTitleValidation() {
    if (taskTitleController.text.isEmpty) {
      return "Please Enter task title";
    }
    return null;
  }

  // Validate task description
  String? taskDescriptionValidation() {
    if (taskDiscriptionController.text.isEmpty) {
      return "Please Enter the task Description";
    } else {
      return null;
    }
  }

  // Initialize input fields for editing a task
  void updateScreen(int index) {
    updateIndex.value = index;
    taskTitleController.text = taskList[index].tittle;
    taskDiscriptionController.text = taskList[index].taskDescription;
    taskdone.value = taskList[index].taskDone;
  }

  // Update an existing task
  void updateTaskList() {
    if (taskFormkey.currentState!.validate()) {
      taskList[updateIndex.value] = TaskModel(
          tittle: taskTitleController.text,
          taskDescription: taskDiscriptionController.text,
          taskDone: taskdone.value);
      taskList.refresh();
      Get.back();
      clear();
    } else {
      return;
    }
  }

  // Add a new task
  void addTask() {
    if (taskFormkey.currentState!.validate()) {
      taskList.add(TaskModel(
          tittle: taskTitleController.text,
          taskDescription: taskDiscriptionController.text,
          taskDone: false));
      taskList.refresh();
      Get.back();
      clear();
    } else {
      return;
    }
  }
}
