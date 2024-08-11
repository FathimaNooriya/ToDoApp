import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/core/color_and_font.dart';
import '../../business_logic/add_task_controller.dart';
import '../../business_logic/home_controller.dart';
import '../widgets/custum_alert_box.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate controllers using GetX dependency injection
    final AddTaskController addTaskController = Get.put(AddTaskController());
    final HomeController homeController = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My tasks ",
            style: ColorAndFont.titleText, // Apply custom title text style
          ),
          actions: [
            Obx(() {
              return Switch(
                  value: homeController.isDark.value,
                  onChanged: (Value) {
                    homeController.isDark.value = Value;
                    homeController.toggleTheme();
                  });
            }),
            Icon(Icons.dark_mode),
            IconButton(
              onPressed: () {
                customAlertDialoge(
                    onPress: homeController.signOut,
                    title: "Alert",
                    discription: "Are you sure that, you want to loguot?");
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: Obx(() {
          // Observe taskList for changes and rebuild UI accordingly
          return addTaskController.taskList.isEmpty
              ? Center(child: Text("No tasks left"))
              : ListView.builder(
                  itemCount: addTaskController.taskList.length,
                  itemBuilder: (BuildContext, index) {
                    // Display each task
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: homeController.isDark.value
                                  ? ColorAndFont.appBarColor
                                  : ColorAndFont.appBarLightColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            // Checkbox to mark task as done
                            leading: Checkbox(
                                value:
                                    addTaskController.taskList[index].taskDone,
                                onChanged: (value) {
                                  // Update the task's done status
                                  addTaskController.taskList[index].taskDone =
                                      value!;
                                  addTaskController.taskList.refresh();
                                }),
                            title: Text(
                              "${addTaskController.taskList[index].tittle}",
                            ),
                            subtitle: Text(
                                "${addTaskController.taskList[index].taskDescription}"),
                            // Button to delete task with confirmation dialog
                            trailing: IconButton(
                              onPressed: () {
                                homeController.deleteIndex.value = index;
                                customAlertDialoge(
                                    title: "Alert",
                                    discription:
                                        "Are you sure, you want to delete the task?",
                                    onPress: homeController.deleteTask);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ),
                        // Tap on task to update the task
                        onTap: () {
                          addTaskController.updateScreen(index);
                          Get.to(AddTaskScreen(
                            updateTask: true,
                          ));
                        },
                      ),
                    );
                  });
        }),
        // Floating button to add a new task
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddTaskScreen());
          },
          child: Icon(Icons.add),
        ));
  }
}
