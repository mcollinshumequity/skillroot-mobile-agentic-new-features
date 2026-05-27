// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class Walkthrough1Screen extends StatefulWidget {
  const Walkthrough1Screen({super.key});

  @override
  State<Walkthrough1Screen> createState() => _Walkthrough1ScreenState();
}

class _Walkthrough1ScreenState extends State<Walkthrough1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SizedBox()),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(ThemeStrings.v20, height: 220)]),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Explore Online\nCourses",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("All types of educational & professional courses available online. ", textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14)),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 30,
                  decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#33354E") : Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(width: 5),
                CircleAvatar(radius: 4, backgroundColor: Theme.of(context).dividerColor),
                SizedBox(width: 5),
                CircleAvatar(radius: 4, backgroundColor: Theme.of(context).dividerColor),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
