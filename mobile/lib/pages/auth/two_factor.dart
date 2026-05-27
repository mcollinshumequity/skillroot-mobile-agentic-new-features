// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/tab_screen.dart';
import 'package:skillroot/widgets/text_fields.dart';
import 'package:skillroot/routes.dart';

class TwoFactorScreen extends StatefulWidget {
  const TwoFactorScreen({super.key});

  @override
  State<TwoFactorScreen> createState() => _TwoFactorScreenState();
}

class _TwoFactorScreenState extends State<TwoFactorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(AppTheme.isLightTheme ? ThemeStrings.v57 : ThemeStrings.dv57, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: MediaQuery.of(context).padding.top + 40, bottom: MediaQuery.of(context).padding.bottom),
            child: Column(
              children: [
                Text(
                  "Two-Factor",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text("Enter the Two-Factor Code sent to your primary contact"),
                      UnderlinedTextField(hintText: "2FA Code", click: () {}),
                      SizedBox(height: 20),
                      RoundedFlatButton(
                        name: "CONFIRM",
                        click: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => TabScreen()));
                        },
                      ),
                      SizedBox(height: 10),
                      RoundedFlatButton(name: "RESEND", click: () {}),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Changed Your Mind?", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.LOGIN);
                            },
                            child: Text(
                              "Cancel Login",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
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
}
