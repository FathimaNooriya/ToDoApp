import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/screens/home_screen.dart';

class SignInContoller extends GetxController {
  // Controllers for text fields
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signInFormkey = GlobalKey<FormState>();

  // Dispose of the controllers
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  // Clear input fields
  void clear() {
    userNameController.clear();
    passwordController.clear();
  }

  // Validate username field
  String? userNameValidation() {
    if (userNameController.text.isEmpty) {
      return "Please Enter the user name";
    }
    return null;
  }

  // Validate password field
  String? passwordValidation() {
    if (passwordController.text.isEmpty) {
      return "Please Enter the password name";
    } else {
      return null;
    }
  }

  // Handle sign-in process
  void signIn() async {
    if (signInFormkey.currentState!.validate()) {
      if (passwordController.text == "1234" &&
          userNameController.text == "fathima") {
        try {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          Get.offAll(() => HomeScreen());
          clear();
        } catch (e) {
          Get.snackbar('Error', e.toString());
        }
      } else {
        Get.snackbar('Login Failed', "Invalied Username or Password");
      }
    } else {
      return;
    }
  }
}
