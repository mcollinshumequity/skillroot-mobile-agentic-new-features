// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class BecomeMemberv1Screen extends StatefulWidget {
  const BecomeMemberv1Screen({super.key});

  @override
  State<BecomeMemberv1Screen> createState() => _BecomeMemberv1ScreenState();
}

class _BecomeMemberv1ScreenState extends State<BecomeMemberv1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isLightTheme ? HexColor("#8CC6AB") : HexColor("#242526"),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
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
                    child: Image.asset(ThemeStrings.t26, color: AppTheme.isLightTheme ? Colors.black : Colors.white, height: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Image.asset(ThemeStrings.t27, height: 200),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "7-Day Free Trial",
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50% OFF",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 26, color: HexColor("#FBB344"), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Online Courses",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select a professional course online and get",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50% instant discount. ",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        " Hurry! offers are limited",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: HexColor("#FBB344")),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "to availabe seats. Get your course now!",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("(Limited-Time Offer)", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Colors.white))],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "7-Day Free Trial Available.",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Starts \$10/Month. Cancel Anytime.",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment(0.8, 1),
                      //   colors: <Color>[
                      //     HexColor("#1CE0DA"),
                      //     HexColor("#479DE4"),
                      //   ],
                      // ),
                      color: HexColor("#FBB344"),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "Start 7-Day Free Trial",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
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
