import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/presentation/screens/home_screen.dart';
import '../../application/presentation/screens/sign_in_screen.dart';

class SharedPref {
  // Checks if the user is logged in
  Future<bool> isLoggedInFn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isLoggedIn') ?? false;
    } catch (e) {
      // Handle error while accessing SharedPreferences
      Get.snackbar('Error accessing SharedPreferences', e.toString());
      return false; // Default to false in case of an error
    }
  }

  // Navigates to the appropriate screen based on the login status
  Future<void> navigateToNextScreen() async {
    try {
      await Future.delayed(Duration(seconds: 3)); // Splash screen duration
      bool isLoggedIn = await isLoggedInFn();

      if (isLoggedIn) {
        Get.offAll(() => HomeScreen()); // Navigate to HomeScreen if logged in
      } else {
        Get.offAll(
            () => SignInScreen()); // Navigate to LoginScreen if not logged in
      }
    } catch (e) {
      // Handle unexpected errors during navigation
      Get.snackbar('Error during navigation', e.toString());
      // You can navigate to SignIn screen in case of an error
      Get.offAll(() => SignInScreen());
    }
  }
}
