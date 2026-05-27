// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class DistanceEarningv2Screen extends StatefulWidget {
  const DistanceEarningv2Screen({super.key});

  @override
  State<DistanceEarningv2Screen> createState() => _DistanceEarningv2ScreenState();
}

class _DistanceEarningv2ScreenState extends State<DistanceEarningv2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Image.asset(ThemeStrings.v27, height: 40), Image.asset(AppTheme.isLightTheme ? ThemeStrings.s19 : ThemeStrings.ds19, height: 20)]),
            SizedBox(height: 20),
            Text("Good Morning, \nSurinder", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  SizedBox(height: 20),
                  Text("Start your Journey", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(children: [SizedBox(height: 20), Image.asset(ThemeStrings.v23, height: 300)]),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(ThemeStrings.v24, height: 120),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 30),
                                child: Text(
                                  "Fundamental of \nBrand Design",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(ThemeStrings.v25, height: 120),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 30),
                                child: Text(
                                  "User Interface\nBasics",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(ThemeStrings.v26, height: 120),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 30),
                                child: Text(
                                  "User Interface\nBasics",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
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
          ],
        ),
      ),
    );
  }
}
