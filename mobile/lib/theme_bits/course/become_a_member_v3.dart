// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/tab_screen.dart';

class BecomeAMemberV3Screen extends StatefulWidget {
  const BecomeAMemberV3Screen({super.key});

  @override
  State<BecomeAMemberV3Screen> createState() => _BecomeAMemberV3ScreenState();
}

class _BecomeAMemberV3ScreenState extends State<BecomeAMemberV3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#33354E"),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(children: [Image.asset(ThemeStrings.t28, height: 20)]),
            ),
            Expanded(child: SizedBox()),
            Text(
              "Unlimited Courses, \nAnytime, Anywhere",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text("Choose a plan", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppTheme.isLightTheme ? Colors.white : Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image.asset(ThemeStrings.v47, height: 30),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\$99/Month", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("Get 7 days free trial", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor("#45745E")),
                color: AppTheme.isLightTheme ? Colors.black : HexColor("#242526"),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image.asset(ThemeStrings.s2, height: 30),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$89.99/Year",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text("\$7.99/month. Billed annualy", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor("#45745E")),
                color: AppTheme.isLightTheme ? Colors.black : HexColor("#242526"),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image.asset(ThemeStrings.s2, height: 30),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$200/Lifetime Access",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text("Pay once and don’t worry ever", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            RoundedFlatButton(
              name: "Start Free Trial",
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TabScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
