// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_field, prefer_const_literals_to_create_immutables

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/course/course_with_chapters_v3.dart';

class CourseWithChaptersv2Screen extends StatefulWidget {
  const CourseWithChaptersv2Screen({super.key});

  @override
  State<CourseWithChaptersv2Screen> createState() => _CourseWithChaptersv2ScreenState();
}

class _CourseWithChaptersv2ScreenState extends State<CourseWithChaptersv2Screen> {
  int pageNumber = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(ThemeStrings.s23, fit: BoxFit.fill, height: 250),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Image.asset(ThemeStrings.s6, height: 10)),
                        ),
                        Spacer(),
                        Image.asset(ThemeStrings.s48, height: 20),
                        SizedBox(width: 10),
                        Image.asset(ThemeStrings.s49, height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              CircleAvatar(radius: 20, backgroundColor: Theme.of(context).primaryColor, child: Image.asset(ThemeStrings.s25, height: 15)),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.jumpToPage(0);
                    });
                  },
                  child: Text("Chapters", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.jumpToPage(1);
                    });
                  },
                  child: Text("Files", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.jumpToPage(2);
                    });
                  },
                  child: Text("Discussions", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(height: 3, width: double.infinity, color: Theme.of(context).dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageNumber == 0
                      ? Container(
                          height: 3,
                          width: 120,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        )
                      : Container(height: 3, width: 80, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)))),
                  pageNumber == 1
                      ? Container(
                          height: 3,
                          width: 120,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        )
                      : Container(height: 3, width: 80, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)))),
                  pageNumber == 2
                      ? Container(
                          height: 3,
                          width: 120,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                        )
                      : Container(height: 3, width: 80, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)))),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              children: [
                // *******************
                ListView(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).padding.bottom + 20),
                  children: [
                    Text("The Ultimate Ui/Ux Course \nBeginner to Advanced", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("33.5k Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                        SizedBox(width: 10),
                        Image.asset(ThemeStrings.s26, height: 15),
                        SizedBox(width: 10),
                        Text("2h 30m", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(radius: 22, backgroundColor: HexColor("#D8D8D8")),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Surinder Thakur", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("Digital Product Designer", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 35,
                          width: 85,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ThemeStrings.t31, height: 10),
                              SizedBox(width: 10),
                              Text(
                                "Follow",
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                    SizedBox(height: 10),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(ThemeStrings.v47, height: 25),
                            Container(height: 40, width: 1, color: Theme.of(context).primaryColor),
                            SizedBox(height: 10),
                            Image.asset(ThemeStrings.v48, height: 25),
                            SizedBox(height: 10),
                            Container(height: 40, width: 1, color: Theme.of(context).disabledColor),
                            SizedBox(height: 10),
                            Image.asset(ThemeStrings.v49, height: 25),
                            SizedBox(height: 40),
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              com(AppTheme.isLightTheme ? ThemeStrings.t3 : ThemeStrings.t7, "1. Introduction", "    1:37", "10 MB"),
                              SizedBox(height: 30),
                              com(ThemeStrings.t5, "2. User Interface", "    1:15:00", "200 MB"),
                              SizedBox(height: 30),
                              com(ThemeStrings.t7, "3. User Experience", "    1:27:00", "230 MB"),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Related Courses", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold))],
                    ),
                    SizedBox(height: 20),
                    com3(ThemeStrings.s34, ThemeStrings.s31, "Canava Graphic Design \nCourse - Beginner"),
                    SizedBox(height: 10),
                    Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C")),
                    SizedBox(height: 10),
                    com3(ThemeStrings.s35, ThemeStrings.s32, "The Complete Presentation\nand speech"),
                    SizedBox(height: 10),
                  ],
                ),
                // *******************
                ListView(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).padding.bottom + 20),
                  children: [
                    Text("4 Project Files", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14)),
                    SizedBox(height: 30),
                    com4(ThemeStrings.v50, AppTheme.isLightTheme ? ThemeStrings.t3 : ThemeStrings.t7, "Web Design", "Pages: 25", "10 MB"),
                    SizedBox(height: 10),
                    com4(ThemeStrings.v51, ThemeStrings.v47, "Basic of UI", "Pages: 17", "8 MB"),
                    SizedBox(height: 10),
                    com4(ThemeStrings.v52, AppTheme.isLightTheme ? ThemeStrings.t3 : ThemeStrings.t7, "Software for UX", "Pages: 14", "5 MB"),
                    SizedBox(height: 10),
                    com4(ThemeStrings.v53, AppTheme.isLightTheme ? ThemeStrings.t3 : ThemeStrings.t7, "Principal of Design", "Pages: 21", "17 MB"),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10, right: 40),
                //   child: CircleAvatar(
                //     radius: 30,
                //     backgroundColor: Theme.of(context).primaryColor,
                //     child: Center(
                //       child: Image.asset(
                //         ConstanceData.t1,
                //         height: 20,
                //       ),
                //     ),
                //   ),
                // ),
                // *******************
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).padding.bottom + 20),
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(radius: 20, backgroundColor: HexColor("#D8D8D8")),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Surinder Thakur", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text("Does sigma wide angle lense work on \ncanon M50 mark ll? Does it \nmatter if the camera is mirrorless \nusing the lenses you recommended? \nI really like my fairly new M50 markll", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 45),
                              Expanded(child: Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C"))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 45),
                              Image.asset(ThemeStrings.t15, height: 20),
                              SizedBox(width: 5),
                              Text("21 Comments", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                              Spacer(),
                              Image.asset(ThemeStrings.t16, height: 20),
                              SizedBox(width: 5),
                              Text("372 Likes", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text("14 days ago", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 45),
                              Expanded(child: Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C"))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 45),
                              CircleAvatar(radius: 20, backgroundColor: HexColor("#D8D8D8")),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Christine Joff", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text("I love this class. It’s clearing up many \nquestions script.", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 100),
                              Expanded(child: Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C"))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 100),
                              Image.asset(ThemeStrings.t17, height: 12),
                              SizedBox(width: 5),
                              Text("Reply", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                              Spacer(),
                              Image.asset(ThemeStrings.t18, height: 15),
                              SizedBox(width: 5),
                              Text("Like", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text("5 days ago", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 100),
                              Expanded(child: Divider(color: AppTheme.isLightTheme ? HexColor("#CCCCCC") : HexColor("#4C4C4C"))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 45),
                              CircleAvatar(radius: 20, backgroundColor: HexColor("#D8D8D8")),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lillian Ellis", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text("I love this class. It’s clearing up \nmany questions script.", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: UnderlinedTextField(
                        hintText: "Type Something",
                        suffixIcon: IconButton(icon: Image.asset(ThemeStrings.t19, height: 25), onPressed: () {}),
                        click: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget com(String img2, String tex1, String tex2, String tex3) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CoursewithChaptersv3Screen()));
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Theme.of(context).disabledColor)),
            ],
          ),
          Spacer(),
          Text(tex3, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Theme.of(context).disabledColor)),
          SizedBox(width: 10),
          Image.asset(img2, height: 25),
        ],
      ),
    );
  }

  Widget com2(String img1, String img2) {
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

  Widget com3(String img1, String img2, String tex1) {
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

  Widget com4(String img1, String img2, String tex1, String tex2, String tex3) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(img1, height: 60),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
              ],
            ),
            Spacer(),
            Text(tex3, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
            SizedBox(width: 10),
            Image.asset(img2, height: 20),
          ],
        ),
      ),
    );
  }
}
