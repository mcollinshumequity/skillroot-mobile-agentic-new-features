// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace

import 'package:skillroot/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text("FAQ’s", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Queries you may have.", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12, color: Theme.of(context).disabledColor)),
                  SizedBox(height: 20),
                  OutlinedTextField(hintText: "Search", click: () {}),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppTheme.isLightTheme ? HexColor("#EBF3EF") : HexColor("#434343"), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("How to get certification after completing the course?", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed commodo magna vel ultricies varius. Nullam augue felis, venenatis nec nisi sit amet, volutpat elementum nulla. Vestibulum in ultrices mauris, at porttitor augue.",
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  com("Lorem ipsum dolor sit amet?"),
                  SizedBox(height: 20),
                  com("Sed commodo magna ultricies varius? "),
                  SizedBox(height: 20),
                  com("Fusce vulputa tor placerat facilisis?"),
                  SizedBox(height: 20),
                  com("Ut vehicula massa a aliquam ultrices?"),
                  SizedBox(height: 20),
                  com("Morbi laoreet imperdiet ipsum?"),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget com(String tex) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : Theme.of(context).dividerColor),
        color: AppTheme.isLightTheme ? HexColor("#F6F5FB") : HexColor("#242526"),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(tex, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
