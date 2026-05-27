// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/tab_screen.dart';

class ChooseCategoryv1Screen extends StatefulWidget {
  const ChooseCategoryv1Screen({super.key});

  @override
  State<ChooseCategoryv1Screen> createState() => _ChooseCategoryv1ScreenState();
}

class _ChooseCategoryv1ScreenState extends State<ChooseCategoryv1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(radius: 20, backgroundColor: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#666666"), child: Image.asset(ThemeStrings.s6, height: 12)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text("Choose Categories", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(children: [com(ThemeStrings.s7, "Mobile \nDesign"), SizedBox(width: 10), com2(ThemeStrings.s8, "3D\nModeling"), SizedBox(width: 10), com2(ThemeStrings.s9, "Web\nDesigning")]),
                  SizedBox(height: 20),
                  Row(children: [com2(ThemeStrings.s10, "Illustrations\n        "), SizedBox(width: 10), com2(ThemeStrings.s11, "Drawing\n        "), SizedBox(width: 10), com(ThemeStrings.s12, "Animation\n        ")]),
                  SizedBox(height: 20),
                  Row(children: [com(ThemeStrings.s13, "Education\n        "), SizedBox(width: 10), com2(ThemeStrings.s14, "Networking\n        "), SizedBox(width: 10), com2(ThemeStrings.s15, "Coding\n        ")]),
                  SizedBox(height: 30),
                ],
              ),
            ),
            RoundedFlatButton(
              name: "Continue",
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TabScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String img, String tex) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#33354E") : Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
          child: Column(
            children: [
              Image.asset(img, height: 30),
              SizedBox(height: 10),
              Text(
                tex,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget com2(String img, String tex) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#242526"),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
          child: Column(
            children: [
              Image.asset(img, height: 30),
              SizedBox(height: 10),
              Text(
                tex,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
