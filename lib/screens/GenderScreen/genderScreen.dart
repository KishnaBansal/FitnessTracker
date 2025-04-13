import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderscreenState();
}

class _GenderscreenState extends State<GenderPage> {
  bool isMale = false;
  bool isFemale = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            DetailPageTitle(
              title: "Tell us about yourself",
              text: "This will help us to find the best\n content for you",
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.055),
            GenderIcon(
              icon: Icons.male,
              title: "Male",
              onTap: () {
                setState(
                  () {
                    isMale = true;
                    isFemale = false;
                  },
                );
              },
              isSelected: isMale,
            ),
            SizedBox(height: size.height * 0.05),
            GenderIcon(
              icon: Icons.female,
              title: "Female",
              onTap: () {
                setState(
                  () {
                    isMale = false;
                    isFemale = true;
                  },
                );
              },
              isSelected: isFemale,
            ),
            Spacer(),
            DetailPageButton(
              text: "Next",
              onTap: () {
                Navigator.pushNamed(context, '/age');
              },
              showBackButton: false,
            ),
          ],
        ),
      ),
    );
  }
}

class GenderIcon extends StatelessWidget {
  const GenderIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: isSelected ? PrimaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(icon,
                  color: isSelected ? Colors.black : Colors.white,
                  size: size.width * 0.09),
              SizedBox(height: size.height * 0.02),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
