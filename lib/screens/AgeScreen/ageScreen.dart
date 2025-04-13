import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/models/ListWheelScroller.dart';
import 'package:fitness_app/models/detailButtonPage.dart';
import 'package:fitness_app/models/detailPageTitle.dart';
import 'package:fitness_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    for (int i = 1; i < 100; i++) {
      items.add(i.toString());
    }
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
          child: Consumer<UserProvider>(
            builder: (context, userProvider, _) {
              return Container(
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
                      title: "How old are you?",
                      text: "This helps us to create your personalized plan",
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
                        userProvider.setAge(int.parse(items[userProvider.age]));
                        Navigator.pushNamed(context, '/weight');
                      },
                      showBackButton: true,
                      onBackTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
