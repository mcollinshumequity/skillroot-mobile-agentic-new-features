import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/main.dart';
import 'package:skillroot/routes.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/animated_tab.dart';
import 'package:skillroot/widgets/stats.dart';

import 'package:skillroot/pages/profile/edit.dart';
import 'package:skillroot/tab_screen.dart';
import 'package:skillroot/services/provider.dart';
import 'package:skillroot/services/api.dart';
import 'package:skillroot/models/user.dart';

class ProfileScreen extends StatefulWidget with AnimatedTab {
  @override
  final AnimationController animationController;
  final void Function(TabType) selectTab;

  const ProfileScreen({super.key, required this.animationController, required this.selectTab});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  static void contextClick(BuildContext context) async {
    var user = await provider.user;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfile(user: user),
      ),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin, AnimatedTabState {
  @override
  void initState() {
    initAnimation();

    isDark = !AppTheme.isLightTheme;

    super.initState();
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return buildAnimatedScaffold(
      context: context,
      title: "Profile",
      header: [
        Row(
          children: [
            Container(
              height: 42,
              width: 42,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 12, offset: const Offset(0, 8)),
                ],
              ),
              child: Image.asset("assets/images/skillROOT.png"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Your portable proof of work", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).disabledColor)),
              ],
            ),
          ],
        ),
        Spacer(),
        CupertinoSwitch(
          value: isDark,
          activeTrackColor: Theme.of(context).primaryColor,
          onChanged: (bool? value) {
            setState(() {
              isDark = value!;
            });
            if (isDark) {
              MyApp.setCustomeTheme(context, 7);
            } else {
              MyApp.setCustomeTheme(context, 6);
            }
          },
        ),
        SizedBox(width: 10),
        Image.asset(AppTheme.isLightTheme ? ThemeStrings.v1 : ThemeStrings.dv1, height: 25),
      ],
      body: [
        FutureBuilder<User>(
          future: provider.user,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 48),
                      SizedBox(height: 10),
                      Text("Failed to load profile", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(snapshot.error.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(color: primaryColor),
                  )
                ],
              );
            }

            User user = snapshot.data!;
            var theme = Theme.of(context);
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [primaryColor, Color(0xff0A4E96)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: primaryColor.withAlpha(64), blurRadius: 24, offset: const Offset(0, 14))],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 36, color: primaryColor),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.firstName} ${user.lastName}",
                              style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 4),
                            Text(user.email ?? "N/A", style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white.withAlpha(230))),
                            SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: user.completion,
                              backgroundColor: Colors.white.withAlpha(51),
                              valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Profile completeness", style: theme.textTheme.bodySmall!.copyWith(color: Colors.white.withAlpha(230))),
                                Text("${(user.completion * 100).toStringAsFixed(0)}%", style: theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _chip("Verified identity"),
                                _chip("Work history"),
                                _chip("Learning log"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                StatsBlock([
                  StatsCard(label: "Training logged", value: "128h", icon: Icons.playlist_add_check),
                  StatsCard(label: "Jobs verified", value: "24", icon: Icons.verified_outlined),
                  StatsCard(label: "Credentials", value: "8", icon: Icons.badge_outlined),
                ]),
                SizedBox(height: 16),
                StatsCard(label: "Phone", value: user.phone ?? "N/A", icon: Icons.phone).build(context),
                SizedBox(height: 8),
                StatsCard(label: "Email", value: user.email ?? "N/A", icon: Icons.email_outlined).build(context),
                SizedBox(height: 16),
                StatsCard(
                  label: "Interests",
                  value: "",
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: user.interests
                        .map<Widget>(
                          (interest) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
                            child: Text(interest, style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                        )
                        .toList(),
                  ),
                  icon: Icons.favorite_outlined,
                ).build(context),
                SizedBox(height: 24),
                RoundedFlatButton(
                  name: "LOGOUT",
                  customColor: Colors.grey[800],
                  click: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          title: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
                          content: const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: const Text("CANCEL", style: TextStyle(color: Colors.grey)),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(dialogContext); // Close dialog
                                await FirebaseAuth.instance.signOut();
                                Api.signOut();
                                provider.reset();
                                Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
                              },
                              child: const Text("LOGOUT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 40),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withAlpha(36), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}
