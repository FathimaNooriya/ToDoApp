import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/core/color_and_font.dart';
import '../../business_logic/home_controller.dart';
import '../../business_logic/sign_in_contoller.dart';
import '../widgets/custum_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate controllers using GetX dependency injection
    final SignInContoller signInContoller = Get.put(SignInContoller());
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Center(
          child: Text(
            "Sign In",
            style: ColorAndFont.titleText,
          ),
        ),
      ),
      body: Center(
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
            height: MediaQuery.of(context).size.height * .4,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: signInContoller.signInFormkey, // Form key for validation
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Username",
                      style: ColorAndFont.stdText,
                    ),
                    // Call custom widget for user name input
                    CustomTextFeild(
                      controller: signInContoller.userNameController,
                      label: "Enter Username (fathima)",
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      validation: signInContoller.userNameValidation,
                    ),
                    Text(
                      "Password",
                      style: ColorAndFont.stdText,
                    ),
                    // Call custom widget for password input
                    CustomTextFeild(
                      label: "Enter password (1234)",
                      controller: signInContoller.passwordController,
                      textInputType: TextInputType.multiline,
                      maxLines: 1,
                      validation: signInContoller.passwordValidation,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          signInContoller
                              .signIn(); // Call sign-in method on button press
                        },
                        child: Text("SignIn")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
