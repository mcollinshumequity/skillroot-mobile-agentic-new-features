// ignore_for_file: prefer_const_constructors

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/course/course_listing_v2.dart';

class Searchv2Screen extends StatefulWidget {
  const Searchv2Screen({super.key});

  @override
  State<Searchv2Screen> createState() => _Searchv2ScreenState();
}

class _Searchv2ScreenState extends State<Searchv2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(AppTheme.isLightTheme ? ThemeStrings.v57 : ThemeStrings.dv57, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
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
                      child: Image.asset(ThemeStrings.s39, color: AppTheme.isLightTheme ? Colors.black : Colors.white, height: 20),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RaisedTextField(
                        hintText: "Search for Topics, Courses & Educators",
                        prefixIcon: IconButton(icon: Image.asset(ThemeStrings.s40, height: 20), onPressed: () {}),
                        click: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text("Top Searches ", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(color: HexColor("#33354E"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Sketch",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Modeling",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "UI/UX",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#A1A1A1"), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Camera",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text("Browse Categories ", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Row(children: [com(ThemeStrings.v38, "Mobile \nDesign"), SizedBox(width: 15), com(ThemeStrings.v39, "3D \nModeling")]),
                      SizedBox(height: 10),
                      Row(children: [com(ThemeStrings.v40, "Web \nDesigning"), SizedBox(width: 15), com(ThemeStrings.v41, "Illustrations")]),
                      SizedBox(height: 10),
                      Row(children: [com(ThemeStrings.v42, "Drawing"), SizedBox(width: 15), com(ThemeStrings.v43, "Animation")]),
                      SizedBox(height: 10),
                      Row(children: [com(ThemeStrings.v44, "Graphic \nDesigning"), SizedBox(width: 15), com(ThemeStrings.v45, "Film")]),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget com(String img, String tex) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseListingv2Screen()));
        },
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
      ),
    );
  }
}
