// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/course/course_with_chapters_v3.dart';

class CourseListingv2Screen extends StatefulWidget {
  const CourseListingv2Screen({super.key});

  @override
  State<CourseListingv2Screen> createState() => _CourseListingv2ScreenState();
}

class _CourseListingv2ScreenState extends State<CourseListingv2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset(
                ThemeStrings.v46,
                fit: BoxFit.fill,
                // height: MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(ThemeStrings.t28, height: 20),
                      SizedBox(height: 50),
                      Text(
                        "Mobile Design",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).padding.bottom + 20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5,761 Results", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14)),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(ThemeStrings.s45, height: 15)]),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                com(ThemeStrings.s34, ThemeStrings.s31, "Canava Graphic Design \nCourse - Beginner"),
                SizedBox(height: 10),
                Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                SizedBox(height: 10),
                com(ThemeStrings.s35, ThemeStrings.s32, "The Complete Presentation \nand speech"),
                SizedBox(height: 10),
                Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                SizedBox(height: 10),
                com(ThemeStrings.s36, ThemeStrings.s31, "CSS - The Complete Guide \n2021"),
                SizedBox(height: 10),
                Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                SizedBox(height: 10),
                com(ThemeStrings.s37, ThemeStrings.s31, "Photography Master -\nClass Course"),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget com(String img1, String img2, String tex1) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CoursewithChaptersv3Screen()));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(img1, height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(ThemeStrings.v37, height: 10),
                            SizedBox(width: 5),
                            Text(
                              "4.0",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [Text("By James Morris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor))],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("\$100", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Image.asset(ThemeStrings.s26, height: 15),
                  SizedBox(width: 5),
                  Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
