import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../data/services/shared_preferences.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after the splash screen is displayed
    SharedPref().navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation asset
            Lottie.asset('assets/Animation.json', width: 250, height: 250),
            SizedBox(height: 20),
            Text(
              'My Task App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
