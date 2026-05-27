// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class DistanceLearningv3Screen extends StatefulWidget {
  const DistanceLearningv3Screen({super.key});

  @override
  State<DistanceLearningv3Screen> createState() => _DistanceLearningv3ScreenState();
}

class _DistanceLearningv3ScreenState extends State<DistanceLearningv3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Top Picks for You", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Image.asset(ThemeStrings.v28, height: 10),
                                          SizedBox(width: 10),
                                          Text("22K Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Canava Graphic Design \nCourse - Beginner",
                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Image.asset(ThemeStrings.s26, height: 10),
                                          SizedBox(width: 10),
                                          Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(color: HexColor("#FBB344"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Enroll Now",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Image.asset(ThemeStrings.v28, height: 10),
                                          SizedBox(width: 10),
                                          Text("22K Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Canava Graphic Design \nCourse - Beginner",
                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Image.asset(ThemeStrings.s26, height: 10),
                                          SizedBox(width: 10),
                                          Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(color: HexColor("#FBB344"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Enroll Now",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        "View All",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  com(ThemeStrings.s34, ThemeStrings.s31),
                  SizedBox(height: 10),
                  Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                  SizedBox(height: 10),
                  com(ThemeStrings.s35, ThemeStrings.s32),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String img1, String img2) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(img1, height: 100),
            Padding(padding: const EdgeInsets.only(top: 5, right: 5), child: Image.asset(img2, height: 20)),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("The Ultimate Ui/Ux Course \nBeginner to Advanced", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Text("By James Morris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                SizedBox(width: 10),
                Image.asset(ThemeStrings.s26, height: 15),
                SizedBox(width: 5),
                Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "\$75.00",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
                SizedBox(width: 10),
                Image.asset(ThemeStrings.s33, height: 10),
                SizedBox(width: 5),
                Text("4.9", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
