// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text("Categories", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("All Categories", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                  SizedBox(height: 30),
                  Row(children: [com(ThemeStrings.s28, "Web \nDesigning"), SizedBox(width: 15), com(ThemeStrings.s29, "3D \nModeling")]),
                  SizedBox(height: 10),
                  Row(children: [com(ThemeStrings.s30, "Mobile \nDesign"), SizedBox(width: 15), com(ThemeStrings.s41, "Illustrations")]),
                  SizedBox(height: 10),
                  Row(children: [com(ThemeStrings.s42, "Drawing"), SizedBox(width: 15), com(ThemeStrings.s43, "Animation")]),
                  SizedBox(height: 10),
                  Row(children: [com(ThemeStrings.v18, "Web\nDevlopment"), SizedBox(width: 15), com(ThemeStrings.v19, "Photo & \nVideo")]),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String img, String tex) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(img),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              tex,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
