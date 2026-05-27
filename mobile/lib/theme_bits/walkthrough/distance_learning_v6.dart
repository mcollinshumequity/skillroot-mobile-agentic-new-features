// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/course/course_listing_v2.dart';
import 'package:skillroot/theme_bits/course/course_with_chapters_v2.dart';
import 'package:skillroot/theme_bits/course/search_v2.dart';

class DistanceLearningv6Screen extends StatefulWidget {
  const DistanceLearningv6Screen({super.key});

  @override
  State<DistanceLearningv6Screen> createState() => _DistanceLearningv6ScreenState();
}

class _DistanceLearningv6ScreenState extends State<DistanceLearningv6Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(AppTheme.isLightTheme ? ThemeStrings.v57 : ThemeStrings.dv57, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Image.asset(ThemeStrings.v33, height: 40), Image.asset(AppTheme.isLightTheme ? ThemeStrings.s19 : ThemeStrings.ds19, height: 20)]),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Hello",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Surinder T.",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RaisedTextField(
                  hintText: "Search Courses",
                  prefixIcon: IconButton(icon: Image.asset(ThemeStrings.s40, height: 20), onPressed: () {}),
                  click: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Searchv2Screen()));
                  },
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "See All",
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseListingv2Screen()));
                        },
                        child: SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(ThemeStrings.v34, height: 150),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                                    child: Text(
                                      "Mobile \nDesign",
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(ThemeStrings.v35, height: 150),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                                    child: Text(
                                      "3D \nModeling",
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(ThemeStrings.v36, height: 150),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                                    child: Text(
                                      "Web \nDesigning",
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Recently Watched", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseWithChaptersv2Screen()));
                        },
                        child: SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Image.asset(ThemeStrings.s23, height: 120),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 10),
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(color: HexColor("#FFE0DE"), borderRadius: BorderRadius.all(Radius.circular(5))),
                                          child: Center(
                                            child: Text("Web Designing", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: HexColor('#E98D88'))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CircleAvatar(radius: 20, backgroundColor: Theme.of(context).primaryColor, child: Image.asset(ThemeStrings.s25, height: 15)),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Canava Graphic Design \nCourse - Beginner", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Image.asset(ThemeStrings.s26, height: 15),
                                              SizedBox(width: 5),
                                              Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Image.asset(ThemeStrings.s27, height: 120),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 10),
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(color: HexColor("#D7DFFF"), borderRadius: BorderRadius.all(Radius.circular(5))),
                                          child: Center(
                                            child: Text("Web Designing", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: HexColor('#5C71CC'))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CircleAvatar(radius: 20, backgroundColor: Theme.of(context).primaryColor, child: Image.asset(ThemeStrings.s25, height: 15)),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("The Complete Presentation \nand speech", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Image.asset(ThemeStrings.s26, height: 15),
                                              SizedBox(width: 5),
                                              Text("1h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                      SizedBox(height: 20),
                      Text("Popular Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseListingv2Screen()));
                        },
                        child: SizedBox(
                          height: 275,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: AppTheme.isLightTheme ? Colors.white : Theme.of(context).dividerColor,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color:
                                    //         const Color.fromARGB(255, 223, 222, 222),
                                    //     blurRadius: 15,
                                    //     offset: Offset(5.0, 5.0),
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Image.asset(ThemeStrings.s27),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10, left: 10),
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Photography Master - Class Course", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 10),
                                            Text("By Phil Ebiner, William", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : HexColor("A1A1A1"))),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text("\$150", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text("\$180", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : HexColor("A1A1A1"))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: AppTheme.isLightTheme ? Colors.white : Theme.of(context).dividerColor,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color:
                                    //         const Color.fromARGB(255, 223, 222, 222),
                                    //     blurRadius: 15,
                                    //     offset: Offset(5.0, 5.0),
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(ThemeStrings.s27),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10, left: 10),
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(ThemeStrings.v37, height: 10),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "4.2",
                                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("CSS - The Complete Guide 2021", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 10),
                                            Text("By Maximilian", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text("\$170", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text("\$10", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseListingv2Screen()));
                        },
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.asset(ThemeStrings.s21, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("HOW TO", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white)),
                                  SizedBox(height: 5),
                                  Text(
                                    "Make your brand more visible\nwith our checklist.",
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  SizedBox(height: 15),
                                  Text("By Scott Harris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                  SizedBox(height: 20),
                                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(ThemeStrings.s22, height: 100)]),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 32,
                                    width: 120,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
                                    child: Center(
                                      child: Text(
                                        "Start Learning",
                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
