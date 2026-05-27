// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/walkthrough/distance_learning_v5.dart';

class DistanceLearningv4Screen extends StatefulWidget {
  const DistanceLearningv4Screen({super.key});

  @override
  State<DistanceLearningv4Screen> createState() => _DistanceLearningv4ScreenState();
}

class _DistanceLearningv4ScreenState extends State<DistanceLearningv4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(ThemeStrings.v27, height: 40),
                SizedBox(width: 10),
                Text("Hi, Surinder", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                Spacer(),
                Image.asset(AppTheme.isLightTheme ? ThemeStrings.s19 : ThemeStrings.ds19, height: 20),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text("Find a best \ncourse for you!", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  RaisedTextField(
                    hintText: "Search for Topics, Courses & Educators",
                    prefixIcon: IconButton(icon: Image.asset(ThemeStrings.s40, height: 20), onPressed: () {}),
                    suffixIcon: IconButton(icon: Image.asset(ThemeStrings.v29, height: 20), onPressed: () {}),
                    click: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Distancelearningv5Screen()));
                    },
                  ),
                  SizedBox(height: 20),
                  Stack(
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
                                child: Text("Start Learning", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Today. 3 September", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 5, backgroundColor: AppTheme.isLightTheme ? Colors.black : Theme.of(context).dividerColor),
                          SizedBox(height: 5),
                          Text("4/9", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Theme.of(context).disabledColor)),
                        ],
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.isLightTheme ? Colors.white : HexColor("#434343"),
                              boxShadow: [BoxShadow(color: AppTheme.isLightTheme ? const Color.fromARGB(255, 223, 222, 222) : Colors.black, blurRadius: 15, offset: Offset(5.0, 5.0))],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUSINESS", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                  SizedBox(height: 10),
                                  Text("Basics of Financials", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Image.asset(ThemeStrings.v30, height: 30),
                                      Image.asset(ThemeStrings.v31, height: 30),
                                      Image.asset(ThemeStrings.v32, height: 30),
                                      SizedBox(width: 10),
                                      Text("+1.3k Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 5, backgroundColor: AppTheme.isLightTheme ? Colors.black : Theme.of(context).dividerColor),
                          SizedBox(height: 5),
                          Text("3/9", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Theme.of(context).disabledColor)),
                        ],
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.isLightTheme ? Colors.white : HexColor("#434343"),
                              boxShadow: [BoxShadow(color: AppTheme.isLightTheme ? const Color.fromARGB(255, 223, 222, 222) : Colors.black, blurRadius: 15, offset: Offset(5.0, 5.0))],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("DESIGN", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                  SizedBox(height: 10),
                                  Text("Fundamental of Brand Design", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Image.asset(ThemeStrings.v30, height: 30),
                                      Image.asset(ThemeStrings.v31, height: 30),
                                      Image.asset(ThemeStrings.v32, height: 30),
                                      SizedBox(width: 10),
                                      Text("+21 Students", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
