// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/theme_bits/course/become_a_member_v3.dart';

class BecomeAMemberv2Screen extends StatefulWidget {
  const BecomeAMemberv2Screen({super.key});

  @override
  State<BecomeAMemberv2Screen> createState() => _BecomeAMemberv2ScreenState();
}

class _BecomeAMemberv2ScreenState extends State<BecomeAMemberv2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
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
                          "Membership",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Text(
                          "Unlimited Study\nAnytime, Anywhere",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 140),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choose a plan", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15, left: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(ThemeStrings.s1, height: 25),
                                          Container(
                                            height: 25,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: HexColor("#FBB344"),
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                                            ),
                                            child: Center(child: Text("Best Offer", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "\$99",
                                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                              Text("/Month", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Colors.white)),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text("Get 7 days free trial", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#242526"),
                                  border: Border.all(color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : Theme.of(context).dividerColor),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppTheme.isLightTheme ? ThemeStrings.s2 : ThemeStrings.ds2, height: 20),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("\$99", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                                          Text("/3months", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text("\$13/month Billed \nquaterly", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#242526"),
                                  border: Border.all(color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : Theme.of(context).dividerColor),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppTheme.isLightTheme ? ThemeStrings.s2 : ThemeStrings.ds2, height: 20),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("\$68", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                                          Text("/6months", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text("\$11.33/month Billed \nhalf-yearly", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#242526"),
                                  border: Border.all(color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : Theme.of(context).dividerColor),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppTheme.isLightTheme ? ThemeStrings.s2 : ThemeStrings.ds2, height: 20),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("\$115", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                                          Text("/Year", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text("Pay once and don’t \nworry for a year", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RoundedFlatButton(
              name: "Start Free Trial",
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BecomeAMemberV3Screen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
