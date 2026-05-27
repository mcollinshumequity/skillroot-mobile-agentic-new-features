// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#8CC6AB"),
      body: Column(
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
                Text(
                  "Feedback",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 650,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
                    child: Column(
                      children: [
                        Text(
                          "How was Your Experience \nin this Session?",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "We'd love to hear from you.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(AppTheme.isLightTheme ? ThemeStrings.t42 : ThemeStrings.dt42, height: 25),
                                SizedBox(height: 5),
                                Text(
                                  "Unsatisfied",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(height: 2, width: 30, color: Theme.of(context).disabledColor),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(ThemeStrings.t43, height: 70),
                                SizedBox(height: 5),
                                Text(
                                  "Neutral",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(height: 2, width: 30, color: Theme.of(context).disabledColor),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(AppTheme.isLightTheme ? ThemeStrings.t44 : ThemeStrings.dt44, height: 25),
                                SizedBox(height: 5),
                                Text(
                                  "Satisfied",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(height: 2, color: Theme.of(context).disabledColor),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(AppTheme.isLightTheme ? ThemeStrings.t45 : ThemeStrings.dt45, height: 25),
                                SizedBox(height: 5),
                                Text(
                                  "Very Satisfied",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Text(
                              "Leave a Review",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F3F3F3") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("Type here…", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 70),
                        RoundedFlatButton(
                          name: "Submit Feedback",
                          click: () {
                            Navigator.pop(context);
                          },
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
    );
  }
}
