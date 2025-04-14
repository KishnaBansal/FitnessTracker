import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/padding_margin.dart';
import 'package:fitness_app/screens/homeScreen/homeScreen.dart';
import 'package:flutter/material.dart';

class WorkoutCategoriesPage extends StatefulWidget {
  const WorkoutCategoriesPage({super.key});

  @override
  State<WorkoutCategoriesPage> createState() => _WorkoutCategoriesPageState();
}

class _WorkoutCategoriesPageState extends State<WorkoutCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    List<String> workoutCategories = ["Beginner", "Intermediate", "Advanced"];
    int selectedCategory = 0;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: AppPadding.horizontalPadding(context),
            child: Column(
              children: [
                Text(
                  "Workout Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ToggleButtons(
                  isSelected: List.generate(workoutCategories.length,
                      (index) => index == selectedCategory),
                  onPressed: (int index) {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  children: workoutCategories.map((category) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCategory ==
                                  workoutCategories.indexOf(category)
                              ? PrimaryColor
                              : Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              category.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: selectedCategory ==
                                        workoutCategories.indexOf(category)
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ));
                  }).toList(),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ImageStack(
                    size: size,
                    title: "Day 01 - Warm Up",
                    time: "| 9:00 AM - 10:00 AM",
                    image: 'assets/onboardingImages/home1.jpg',
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ImageStack(
                    size: size,
                    title: "Day 01 - Warm Up",
                    time: "| 9:00 AM - 10:00 AM",
                    image: 'assets/onboardingImages/home2.jpg',
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ImageStack(
                    size: size,
                    title: "Day 01 - Warm Up",
                    time: "| 9:00 AM - 10:00 AM",
                    image: 'assets/onboardingImages/home3.png',
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ImageStack(
                    size: size,
                    title: "Day 01 - Warm Up",
                    time: "| 9:00 AM - 10:00 AM",
                    image: 'assets/onboardingImages/home2.jpg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
