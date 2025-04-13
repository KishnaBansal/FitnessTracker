import 'package:fitness_app/constants/color.dart';
import 'package:flutter/material.dart';

class ListWheelScroller extends StatelessWidget {
  final List<String> items;
  const ListWheelScroller({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ListWheelScrollView(
      magnification: 1.3,
      useMagnifier: true,
      overAndUnderCenterOpacity: 0.22,
      physics: FixedExtentScrollPhysics(),
      controller: FixedExtentScrollController(initialItem: items.length ~/ 2),
      itemExtent: 50,
      diameterRatio: 1.5,
      children: items.map((level) {
        return Text(
          level,
          style: TextStyle(
            color: PrimaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }
}
