import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double weight = 60.0;
  @override
  Widget build(BuildContext context) {
    // List<String> levels = List.generate(170, (index) => '${index + 40} kg'); // Sample levels
    List<String> levels = [];
    for (var i = 5; i <= 500; i++) {
      levels.add(i.isEven ? "|" : "I");
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          bottom: size.height * 0.03,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          children: [
            // Title Section
            DetailPageTitle(
              title: "What is your weight?",
              text: "You can change this later in the settings",
              color: Colors.white,
            ),

            // Spacer instead of fixed SizedBox
            // Spacer(),
            SizedBox(height: size.height*0.055),

            // Weight Text
            Text(
              '$weight kg',
              style: TextStyle(
                color: PrimaryColor,
                fontSize: size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Dynamic height for the ListWheelScrollView
            SizedBox(
              height: size.height * 0.4, // Adjust height proportionally
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView(
                  itemExtent: size.height * 0.036,
                  magnification: 1.2,
                  useMagnifier: true,
                  overAndUnderCenterOpacity: 0.3,
                  physics: FixedExtentScrollPhysics(),
                  controller: FixedExtentScrollController(initialItem: (weight * 2).round()-1),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      weight = (index + 1) / 2;
                    });
                  },
                  children: levels.map(
                    (level) {
                      return RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          level,
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: size.height * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),

            // Spacer for flexible layout
            Spacer(),

            // Buttons Section
            DetailPageButton(
              text: "Next",
              onTap: () {
                Navigator.pushNamed(context, '/height');
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
