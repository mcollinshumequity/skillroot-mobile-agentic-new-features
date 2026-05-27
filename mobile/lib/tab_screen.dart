// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, avoid_unnecessary_containers, sized_box_for_whitespace, constant_identifier_names, prefer_const_constructors, avoid_single_cascade_in_expression_statements, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/pages/profile/profile.dart';
import 'package:skillroot/pages/profile/home.dart';
import 'package:skillroot/pages/profile/job_history.dart';
import 'package:skillroot/pages/profile/training_history.dart';
import 'package:skillroot/pages/profile/notification.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/services/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Widget indexView;
  TabType bottomBarType = TabType.Home;

  @override
  void initState() {
    selectedTab = tabItems[0];
    animationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = HomeScreen(animationController: animationController, selectTab: selectTabByType);
    animationController..forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().colorScheme.background,
        bottomNavigationBar: Container(height: 90 + MediaQuery.of(context).padding.bottom, child: getBottomBarUI(bottomBarType)),
        body: indexView,
        floatingActionButton: selectedTab.contextClick != null
            ? SizedBox(
                width: 50,
                child: RoundedFlatButton(
                  child: Icon(selectedTab.contextIcon ?? Icons.add, color: Colors.white),
                  click: () {
                    selectedTab.contextClick!(context);
                  },
                ),
              )
            : null,
      ),
    );
  }

  late TabItem selectedTab;

  void selectTabByType(TabType type) {
    for (var tab in tabItems) {
      if (tab.type == type) {
        selectTab(tab);
      }
    }
  }

  void selectTab(TabItem tab) {
    if (selectedTab != tab) {
      selectedTab = tab;
      animationController.reverse().then((f) {
        setState(() {
          indexView = switch (tab.type) {
            TabType.Home => HomeScreen(animationController: animationController, selectTab: selectTabByType),
            TabType.Profile => ProfileScreen(animationController: animationController, selectTab: selectTabByType),
            TabType.JobHistory => JobHistory(animationController: animationController, selectTab: selectTabByType),
            TabType.Training => TrainingHistoryScreen(animationController: animationController, selectTab: selectTabByType),
            TabType.Notifications => NotificationScreen(animationController: animationController, selectTab: selectTabByType),
          };
        });
      });
    }
  }

  Widget getBottomBarUI(TabType tabType) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(5), //(left: 20, right: 20, bottom: 20),
        /*child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        //borderRadius: BorderRadius.all(Radius.circular(20)),
      ),*/
        child: Row(
          children: tabItems
              .map<Widget>(
                (item) => Expanded(
                  child: InkWell(
                    onTap: () {
                      selectTab(item);
                    },
                    child: Container(
                      height: 72,
                      decoration: BoxDecoration(color: selectedTab.type == item.type ? Theme.of(context).primaryColor : Colors.black, borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Icon(item.icon, size: 22, color: Colors.white),
                              if (item.alert != null)
                                FutureBuilder<int>(
                                  future: item.alert,
                                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                    if (snapshot.hasData && snapshot.data != null) {
                                      return Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Icon(Icons.circle, color: Colors.red, size: 9),
                                      );
                                    }
                                    return Icon(Icons.circle, color: Colors.transparent);
                                  },
                                ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(item.text, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

enum TabType { Home, Profile, JobHistory, Training, Notifications }

class TabItem {
  TabItem({required this.text, required this.type, required this.icon, required this.panel, this.contextClick, this.contextIcon, this.alert});
  String text;
  String panel;
  IconData icon;
  TabType type;
  Future<int>? alert;
  Function(BuildContext)? contextClick;
  IconData? contextIcon;
}

List<TabItem> tabItems = [
  TabItem(text: "Home", icon: Icons.home, type: TabType.Home, panel: ThemeImages.panel_13_green),
  TabItem(text: "Profile", icon: Icons.person, type: TabType.Profile, panel: ThemeImages.panel_13_green, contextClick: ProfileScreen.contextClick, contextIcon: Icons.edit),
  TabItem(text: "Notifications", icon: Icons.notifications, type: TabType.Notifications, panel: ThemeImages.panel_13_blue0, alert: provider.notificationCount),
  TabItem(text: "Job History", icon: Icons.work, type: TabType.JobHistory, panel: ThemeImages.panel_13_pink, contextClick: JobHistory.contextClick),
  TabItem(text: "Training", icon: Icons.train, type: TabType.Training, panel: ThemeImages.panel_13_brown, contextClick: TrainingHistoryScreen.contextClick),
];
