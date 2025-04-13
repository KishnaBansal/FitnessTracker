import 'package:fitness_app/models/ListWheelScroller.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:flutter/material.dart';

class ActivityLevelPage extends StatefulWidget {
  const ActivityLevelPage({super.key});

  @override
  State<ActivityLevelPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<ActivityLevelPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> items = [
      "Rookie",
      "Beginner",
      "Intermediate",
      "Advanced",
      "Pro",
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
              title: "What is Your activity level?",
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.055),
            SizedBox(
              height: size.height * 0.5,
              child: ListWheelScroller(items: items),
            ),
            DetailPageButton(
              text: "Next",
              onTap: () {},
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
