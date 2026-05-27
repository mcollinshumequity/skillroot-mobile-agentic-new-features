// ignore_for_file: prefer_const_constructors

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/walkthrough/distance_learning_v6.dart';

class Distancelearningv5Screen extends StatefulWidget {
  const Distancelearningv5Screen({super.key});

  @override
  State<Distancelearningv5Screen> createState() => _Distancelearningv5ScreenState();
}

class _Distancelearningv5ScreenState extends State<Distancelearningv5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, Surinder", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("Find a best course for you.", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14)),
                  ],
                ),
                Spacer(),
                Image.asset(AppTheme.isLightTheme ? ThemeStrings.s19 : ThemeStrings.ds19, height: 20),
              ],
            ),
            SizedBox(height: 30),
            RaisedTextField(
              hintText: "Search Course",
              prefixIcon: IconButton(icon: Image.asset(ThemeStrings.s40, height: 20), onPressed: () {}),
              suffixIcon: IconButton(icon: Image.asset(ThemeStrings.v29, height: 20), onPressed: () {}),
              click: () {},
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "Sketch",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "Modeling",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "UI/UX",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "Camera",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  com(ThemeStrings.s37, "4.9", "The Ultimate Ui/Ux Course"),
                  SizedBox(height: 30),
                  com(ThemeStrings.s35, "5.0", "The Complete Presentation"),
                  SizedBox(height: 30),
                  com(ThemeStrings.s37, "4.9", "The Ultimate Ui/Ux Course"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String img1, String tex1, String tex2) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DistanceLearningv6Screen()));
      },
      child: Row(
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
      ),
    );
  }
}
