// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class InstructorProfileScreen extends StatefulWidget {
  const InstructorProfileScreen({super.key});

  @override
  State<InstructorProfileScreen> createState() => _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#8CC6AB"),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(ThemeStrings.t28, height: 20),
                    ),
                    Image.asset(ThemeStrings.t29, height: 20),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppTheme.isLightTheme ? Colors.white : HexColor("##242526"),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 30, bottom: MediaQuery.of(context).padding.bottom + 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Dr. Joff Yu",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text("UI/UX Designer and Lead Instructor", textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(ThemeStrings.t31, height: 12),
                                      SizedBox(width: 10),
                                      Text(
                                        "Follow",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(color: HexColor("#F4E9C8"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "21.2k",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Followers",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(color: HexColor("#F9D2D1"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "4.1k",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Reviews",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(color: HexColor("#D3D8FC"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "90k",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Total Students",
                                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [Text("About me", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold))],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "I’m Joff, I’m a ui/ux designer with a passion for teaching. I’m the lead instructor at the london app brewery, london’s leading leading designcamp. I’ve helped hundreds of thousands of students learn design system and change their lives by becoming…",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  "Show more",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("My Courses (34)", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                                Container(
                                  height: 25,
                                  width: 60,
                                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "See All",
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
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
                            Text(
                              "Student Rating",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 345,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme ? Colors.white : HexColor("#33354E"),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 161, 158, 158),
                                      blurRadius: 6,
                                      // spreadRadius: 2,
                                      // offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: HexColor("#434343"),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset(ThemeStrings.t32, height: 40),
                                            SizedBox(width: 10),
                                            Text(
                                              "Students satisfied with courses",
                                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Image.asset(ThemeStrings.t33, fit: BoxFit.fill),
                                          SizedBox(height: 15),
                                          com2(ThemeStrings.t34, "Very satisfied", "587"),
                                          com2(ThemeStrings.t35, "satisfied", "321"),
                                          com2(ThemeStrings.t36, "Neutral", "200"),
                                          com2(ThemeStrings.t37, "Poor", "44"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Student Reviews", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                                Container(
                                  height: 25,
                                  width: 60,
                                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "See All",
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 250,
                                    decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#33354E") : HexColor("#4C4C4C"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(radius: 20, backgroundColor: HexColor("#D8D8D8")),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "John Wick",
                                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text("This is so amazing! I really \nenjoyed this film, I hope the \nnext chapters will be \nreleased…", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "2 days ago",
                                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 250,
                                    decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#33354E") : HexColor("#4C4C4C"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(radius: 20, backgroundColor: HexColor("#D8D8D8")),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Sania Ray",
                                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text("A good class to acheive \nmy objective. A lot of \nthings to learn just need \nto improve …", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "4 days ago",
                                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                            SizedBox(height: 20),
                            Text(
                              "Connect Here",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            com3(ThemeStrings.t38, "Twitter"),
                            SizedBox(height: 10),
                            com3(ThemeStrings.t40, "Website"),
                            SizedBox(height: 10),
                            com3(ThemeStrings.t41, "Linkedin"),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 5), child: Image.asset(ThemeStrings.v59, height: 100)),
                Image.asset(ThemeStrings.v60, height: 20),
              ],
            ),
          ),
        ],
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

  Widget com2(String img, String tex1, String tex2) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(img, height: 20),
            SizedBox(width: 10),
            Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
            Spacer(),
            Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
        SizedBox(height: 10),
      ],
    );
  }

  Widget com3(String img, String tex) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.isLightTheme ? HexColor("#E9F6FF") : Theme.of(context).dividerColor),
        color: AppTheme.isLightTheme ? HexColor("#E9F6FF") : HexColor("#242526"),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(img, height: 30),
            SizedBox(width: 10),
            Text(tex, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
            Spacer(),
            Image.asset(ThemeStrings.t39, height: 15),
          ],
        ),
      ),
    );
  }
}
