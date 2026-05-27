// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/search/course_with_chapters_v1.dart';

class CourseListingv1Screen extends StatefulWidget {
  const CourseListingv1Screen({super.key});

  @override
  State<CourseListingv1Screen> createState() => _CourseListingv1ScreenState();
}

class _CourseListingv1ScreenState extends State<CourseListingv1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset(
                ThemeStrings.s44,
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
                      CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Image.asset(ThemeStrings.s6, height: 10)),
                      SizedBox(height: 30),
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ListView(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 30),
                                            Text("Filter", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Text("Class Type", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(ThemeStrings.s13, height: 30),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "All",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                                                  boxShadow: [BoxShadow(color: AppTheme.isLightTheme ? Color.fromARGB(255, 223, 222, 222) : Colors.black, blurRadius: 7, offset: Offset(5.0, 5.0))],
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(AppTheme.isLightTheme ? ThemeStrings.t22 : ThemeStrings.dt22, height: 30),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "Staff pick",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                                                  boxShadow: [BoxShadow(color: AppTheme.isLightTheme ? Color.fromARGB(255, 223, 222, 222) : Colors.black, blurRadius: 7, offset: Offset(5.0, 5.0))],
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(AppTheme.isLightTheme ? ThemeStrings.t21 : ThemeStrings.dt21, height: 30),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "Original",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Text("Class Level", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Bigenners", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                            Image.asset(AppTheme.isLightTheme ? ThemeStrings.t23 : ThemeStrings.dt23, height: 20),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Intermediate", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                            Image.asset(AppTheme.isLightTheme ? ThemeStrings.t24 : ThemeStrings.dt24, height: 20),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Advanced", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                            Image.asset(AppTheme.isLightTheme ? ThemeStrings.t23 : ThemeStrings.dt23, height: 20),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Text("Created Within", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 90,
                                              decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                              child: Center(
                                                child: Text(
                                                  "All Time",
                                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: AppTheme.isLightTheme ? Colors.white : HexColor("#4C4C4C"),
                                                border: Border.all(color: Theme.of(context).dividerColor),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text("This Month", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor)),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: AppTheme.isLightTheme ? Colors.white : HexColor("#4C4C4C"),
                                                border: Border.all(color: Theme.of(context).dividerColor),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text("This Week", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: AppTheme.isLightTheme ? Colors.white : HexColor("#4C4C4C"),
                                                border: Border.all(color: Theme.of(context).dividerColor),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text("This Day", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor)),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              height: 40,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: AppTheme.isLightTheme ? Colors.white : HexColor("#4C4C4C"),
                                                border: Border.all(color: Theme.of(context).dividerColor),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text("2 Months", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor)),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              height: 40,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: AppTheme.isLightTheme ? Colors.white : HexColor("#4C4C4C"),
                                                border: Border.all(color: Theme.of(context).dividerColor),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text("4 Months", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).disabledColor)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Text("Created Within", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20),
                                        Image.asset(ThemeStrings.t25, fit: BoxFit.fill),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("15 min", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                            Text("35 min", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                                                  border: Border.all(color: AppTheme.isLightTheme ? Colors.black : Theme.of(context).dividerColor),
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child: Center(
                                                  child: Text("Reset", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 45,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    // gradient: LinearGradient(
                                                    //   begin: Alignment.topLeft,
                                                    //   end: Alignment(0.8, 1),
                                                    //   colors: <Color>[
                                                    //     HexColor("#1CE0DA"),
                                                    //     HexColor("#479DE4"),
                                                    //   ],
                                                    // ),
                                                    color: Theme.of(context).primaryColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Apply",
                                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.isLightTheme ? Colors.white : Colors.black,
                                    // border: Border.all(
                                    //     color: HexColor("#EBEBF0")),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(ThemeStrings.s45, height: 15)]),
                      ),
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
                Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                SizedBox(height: 10),
                com(ThemeStrings.s36, ThemeStrings.s31),
                SizedBox(height: 10),
                Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                SizedBox(height: 10),
                com(ThemeStrings.s37, ThemeStrings.s31),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget com(String img1, String img2) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CourseWithChaptersv1Screen()));
      },
      child: Row(
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
      ),
    );
  }
}
