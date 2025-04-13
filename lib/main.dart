import 'package:fitness_app/screens/ActivityLevelScreen/activityLevelScreen.dart';
import 'package:fitness_app/screens/AgeScreen/ageScreen.dart';
import 'package:fitness_app/screens/GenderScreen/genderScreen.dart';
import 'package:fitness_app/screens/GoalScreen/goalScreen.dart';
import 'package:fitness_app/screens/HeightScreen/heightScreen.dart';
import 'package:fitness_app/screens/LoginSignUp/forgotPassword.dart';
import 'package:fitness_app/screens/LoginSignUp/loginSignUp.dart';
import 'package:fitness_app/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:fitness_app/screens/WeightScreen/weightScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        "/onboarding": (context) => OnBoardingScreen(),
        "/gender": (context) => GenderPage(),
        "/age": (context) => AgePage(),
        "/height": (context) => HeightPage(),
        "/weight": (context) => WeightPage(),
        "/activity": (context) => ActivityLevelPage(),
        '/goal': (context) => GoalPage(),
        //login signup
        '/forgot-password': (context) => ForgetPasswordScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
