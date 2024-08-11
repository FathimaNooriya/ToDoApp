import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/color_and_font.dart';
import '../../business_logic/add_task_controller.dart';
import '../../business_logic/home_controller.dart';
import '../widgets/custum_text_field.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
    this.updateTask = false,
  });
  final bool updateTask;

  @override
  Widget build(BuildContext context) {
    final AddTaskController addTaskController = Get.find();
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Center(
          child: updateTask
              ? Text("Update Task")
              : Text(
                  "Add Task",
                  style: ColorAndFont.titleText,
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(11),
                  ),
                  color: homeController.isDark.value
                      ? ColorAndFont.backgroundColor
                      : ColorAndFont.appBarLightColor,
                ),
                height: MediaQuery.of(context).size.height * .5,
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * .02),
                  child: Form(
                    key: addTaskController.taskFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add new task",
                          style: ColorAndFont.stdText,
                        ),
                        CustomTextFeild(
                          controller: addTaskController.taskTitleController,
                          label: "Study dart",
                          textInputType: TextInputType.text,
                          maxLines: 1,
                          validation: addTaskController.taskTitleValidation,
                        ),
                        Text(
                          "Enter Task Description",
                          style: ColorAndFont.stdText,
                        ),
                        CustomTextFeild(
                          label: "Task Details",
                          controller:
                              addTaskController.taskDiscriptionController,
                          textInputType: TextInputType.multiline,
                          maxLines: 3,
                          validation:
                              addTaskController.taskDescriptionValidation,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              updateTask
                                  ? addTaskController.updateTaskList()
                                  : addTaskController.addTask();
                            },
                            child: updateTask ? Text("Update") : Text("Save")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
