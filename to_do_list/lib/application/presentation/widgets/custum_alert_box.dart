import 'package:get/get.dart';
import 'package:to_do_list/domain/core/color_and_font.dart';

import '../../business_logic/home_controller.dart';

// Displays a custom alert dialog
customAlertDialoge(
    {required Function? onPress, required title, required discription}) {
  final HomeController homeController = Get.find();
  return Get.defaultDialog(
    title: title,
    middleText: discription,
    backgroundColor: homeController.isDark.value
        ? ColorAndFont.backgroundColor
        : ColorAndFont.backgroundLightColor,
    textConfirm: "OK",
    textCancel: "Cancel",
    onConfirm: () {
      onPress!();
      Get.back();
    },
    onCancel: () => Get.back(), // Close the dialog
  );
}
