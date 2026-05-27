// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({super.key});

  @override
  State<PopularCoursesScreen> createState() => _PopularCoursesScreenState();
}

class _PopularCoursesScreenState extends State<PopularCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#666666"),
                    child: Image.asset(ThemeStrings.s6, color: AppTheme.isLightTheme ? Colors.black : Colors.white, height: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text("Popular Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("All Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                  SizedBox(height: 30),
                  com(ThemeStrings.s34, "4.9", "The Ultimate Ui/Ux Course"),
                  SizedBox(height: 30),
                  com(ThemeStrings.s35, "5.0", "The Complete Presentation"),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(ThemeStrings.s36, height: 100),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(ThemeStrings.s33, height: 16),
                              SizedBox(width: 5),
                              Text("5.0", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text("Photography Mastery", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("By James Morris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                              SizedBox(width: 10),
                              Image.asset(ThemeStrings.s26, height: 15),
                              SizedBox(width: 5),
                              Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                            ],
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 170,
                            decoration: BoxDecoration(color: HexColor("#C5C7D1"), borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Live at 03:30 on 25th Sept",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  com(ThemeStrings.s37, "4.9", "The Ultimate Ui/Ux Course"),
                  SizedBox(height: 30),
                  com(ThemeStrings.s38, "5.0", "The Complete Presentation"),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String img1, String tex1, String tex2) {
    return Row(
      children: [
        Image.asset(img1, height: 100),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(ThemeStrings.s33, height: 16),
                SizedBox(width: 5),
                Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Row(
              children: [
                Text("By James Morris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                SizedBox(width: 10),
                Image.asset(ThemeStrings.s26, height: 15),
                SizedBox(width: 5),
                Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "\$75.00",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
