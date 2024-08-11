import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/theme_data.dart';
import '../presentation/screens/sign_in_screen.dart';
import 'add_task_controller.dart';

class HomeController extends GetxController {
  final AddTaskController addTaskController = Get.put(AddTaskController());

  // Observable variables
  RxInt deleteIndex = 0.obs;
  RxBool taskDone = false.obs;
  RxBool isDark = true.obs;
  ThemeData themeMode = darkTheme;

  // Toggle theme between light and dark mode
  toggleTheme() {
    themeMode = isDark.value ? darkTheme : lightTheme;
    refresh();
  }

  // Delete a task from the list
  deleteTask() {
    addTaskController.taskList.removeAt(deleteIndex.value);
  }

  // Sign out and clear shared preferences
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => SignInScreen());
  }
}
