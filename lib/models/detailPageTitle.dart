import 'package:flutter/material.dart';

class DetailPageTitle extends StatelessWidget {
  final String text;
  final String title;
  final Color color;
  const DetailPageTitle({super.key, required this.text, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    double screenWidth = size.width;
    double paddingValue = screenWidth * 0.08;
    return Column(
      children: [
        SizedBox(height: size.height * 0.1),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            title.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          padding: EdgeInsets.symmetric(horizontal: paddingValue),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: screenWidth * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
