// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/theme_bits/walkthrough/distance_earning_v2.dart';

class Walkthough3Screen extends StatefulWidget {
  const Walkthough3Screen({super.key});

  @override
  State<Walkthough3Screen> createState() => _Walkthough3ScreenState();
}

class _Walkthough3ScreenState extends State<Walkthough3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#242526"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#666666"),
                        child: Image.asset(ThemeStrings.s6, color: AppTheme.isLightTheme ? Colors.black : Colors.white, height: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [Text("Select Interests", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold))],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [Image.asset(AppTheme.isLightTheme ? ThemeStrings.v21 : ThemeStrings.dv21, width: MediaQuery.of(context).size.width, fit: BoxFit.fill)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 70,
                  decoration: BoxDecoration(color: HexColor("#C7E7DF"), borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Text(
                      "3+",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RoundedFlatButton(
                    name: "Continue",
                    click: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DistanceEarningv2Screen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
