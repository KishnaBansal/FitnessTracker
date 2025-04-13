import 'package:fitness_app/models/ListWheelScroller.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> items = [
      "Lose Weight",
      "Gain Weight",
      "Stay Fit",
      "Build Muscle",
      "Improve Endurance",
      "Stay Healthy",
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        child: Column(
          children: [
            DetailPageTitle(
              text: "This helps us to create a persolnalized plan for you",
              title: "What is your goal?",
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.055),
            SizedBox(
              height: size.height * 0.5,
              child: ListWheelScroller(items: items),
            ),
            DetailPageButton(
              text: "Next",
              onTap: () {
                Navigator.pushNamed(context, '/activity');
              },
              showBackButton: true,
              onBackTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
