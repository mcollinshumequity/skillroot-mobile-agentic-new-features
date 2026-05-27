// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new, annotate_overrides, prefer_const_literals_to_create_immutables

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/theme_bits/search/course_listing_v1.dart';

class SearchScreen extends StatefulWidget {
  final AnimationController animationController;

  const SearchScreen({super.key, required this.animationController});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHieght = 0.0;
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 0.0);

    controller.addListener(() {
      // ignore: unnecessary_null_comparison
      if (context != null) {
        if (controller.offset < 0) {
          _animationController.animateTo(0.0);
        } else if (controller.offset > 0.0 && controller.offset < sliderImageHieght) {
          if (controller.offset < ((sliderImageHieght / 1.5))) {
            _animationController.animateTo((controller.offset / sliderImageHieght));
          } else {
            _animationController.animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
          }
        }
      }
    });
    loadingSliderDetail();
    super.initState();
  }

  loadingSliderDetail() async {
    setState(() {
      isLoadingSliderDetail = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      isLoadingSliderDetail = false;
    });
  }

  bool isdark = false;
  bool isdark1 = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    sliderImageHieght = MediaQuery.of(context).size.width * 1.3;
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: Transform(
            transform: new Matrix4.translationValues(0.0, 40 * (1.0 - widget.animationController.value), 0.0),
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20, bottom: MediaQuery.of(context).padding.bottom + 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    child: Text("Modeling", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: AppTheme.isLightTheme ? Theme.of(context).disabledColor : Colors.white)),
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
                          Row(children: [com(ThemeStrings.s28, "Web \nDesigning"), SizedBox(width: 15), com(ThemeStrings.s29, "3D \nModeling")]),
                          SizedBox(height: 10),
                          Row(children: [com(ThemeStrings.s30, "Mobile \nDesign"), SizedBox(width: 15), com(ThemeStrings.s41, "Illustrations")]),
                          SizedBox(height: 10),
                          Row(children: [com(ThemeStrings.s42, "Drawing"), SizedBox(width: 15), com(ThemeStrings.s43, "Animation")]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget com(String img, String tex) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseListingv1Screen()));
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
