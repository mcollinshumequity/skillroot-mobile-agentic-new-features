// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/theme_bits/course/become_a_member_v2.dart';

class CoursewithChaptersv3Screen extends StatefulWidget {
  const CoursewithChaptersv3Screen({super.key});

  @override
  State<CoursewithChaptersv3Screen> createState() => _CoursewithChaptersv3ScreenState();
}

class _CoursewithChaptersv3ScreenState extends State<CoursewithChaptersv3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset(ThemeStrings.v54, fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(radius: 20, backgroundColor: HexColor("#F6F5FB"), child: Image.asset(ThemeStrings.s6, height: 12)),
                            ),
                            SizedBox(height: 40),
                            Text("The Ultimate Ui/Ux \nCourse Beginner \nto Advanced", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30),
                            Text("\$75.00", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Text("33.5k Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                SizedBox(width: 10),
                                Image.asset(ThemeStrings.v55, height: 10),
                                SizedBox(width: 5),
                                Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                Text("Course Content", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 30),
                                com(ThemeStrings.t2, AppTheme.isLightTheme ? ThemeStrings.t5 : ThemeStrings.t7, "1. Introduction", "    1:37", "10 MB"),
                                SizedBox(height: 30),
                                com(ThemeStrings.t4, ThemeStrings.t5, "2. User Interface", "    1:15:00", "200 MB"),
                                SizedBox(height: 30),
                                com(ThemeStrings.t6, ThemeStrings.t7, "3. User Experience", "    1:27:00", "230 MB"),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.isLightTheme ? HexColor("#FFE0DE") : HexColor("#434343"),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(color: HexColor("#FFE0DE"), borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(ThemeStrings.v56, height: 20)]),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: RoundedFlatButton(
                      name: "Enroll Now",
                      click: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BecomeAMemberv2Screen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget com(String img1, String img2, String tex1, String tex2, String tex3) {
    return Row(
      children: [
        Image.asset(img1, height: 35),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
          ],
        ),
        Spacer(),
        Text(tex3, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
        SizedBox(width: 10),
        Image.asset(img2, height: 20),
      ],
    );
  }
}
