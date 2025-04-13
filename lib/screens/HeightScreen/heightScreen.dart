import 'package:fitness_app/models/ListWheelScroller.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:flutter/material.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    List<String> items = [];
    for (int i = 0; i < 200; i++) {
      items.add(i.toString());
    }
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
              title: "What is your height?",
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
                Navigator.pushNamed(context, '/goal');
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
