// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({super.key});

  @override
  State<LiveClassScreen> createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(ThemeStrings.v54, fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(radius: 20, backgroundColor: HexColor("#F6F5FB"), child: Image.asset(ThemeStrings.s6, height: 12)),
                            ),
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(color: HexColor("#FC2626"), borderRadius: BorderRadius.all(Radius.circular(30))),
                              child: Center(
                                child: Text(
                                  "Live Now",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 120),
                        Text("The Ultimate Ui/Ux \nCourse Beginner to Advanced", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Image.asset(ThemeStrings.v61, height: 40),
                            SizedBox(width: 10),
                            Text("By James Morris", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.isLightTheme ? Colors.white : HexColor("#242526"),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      com2(ThemeStrings.v62, "Christine Joff", "I love this class. It’s clearing up many \nquestions script."),
                      SizedBox(height: 30),
                      com2(ThemeStrings.v63, "Anna Stills", "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit."),
                      SizedBox(height: 30),
                      com2(ThemeStrings.v64, "Lillian Ellis", "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit."),
                      SizedBox(height: 30),
                      RaisedTextField(
                        hintText: "Add Comment",
                        suffixIcon: IconButton(icon: Image.asset(ThemeStrings.t19, height: 25), onPressed: () {}),
                        click: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget com(String img1, String img2, String tex1, String tex2, String tex3) {
    return Row(
      children: [
        Image.asset(img1, height: 35),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
          ],
        ),
        Spacer(),
        Text(tex3, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
        SizedBox(width: 10),
        Image.asset(img2, height: 20),
      ],
    );
  }

  Widget com2(String img, String tex1, String tex2) {
    return Row(
      children: [
        Image.asset(img, height: 50),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tex1, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(tex2, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
