import 'package:flutter/material.dart';
import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/services/provider.dart';
import 'package:skillroot/tab_screen.dart';
import 'package:skillroot/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillroot/services/api.dart';
import 'package:skillroot/routes.dart';

mixin AnimatedTab on StatefulWidget {
  abstract final AnimationController animationController;
}

mixin AnimatedTabState<T extends AnimatedTab> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController _animationController;
  late ScrollController _scrollController;
  var sliderImageHeight = 0.0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void initAnimation() {
    _animationController = AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    widget.animationController.forward();
    _scrollController = ScrollController(initialScrollOffset: 0.0);

    _scrollController.addListener(() {
      //if (context != null) {
      if (_scrollController.offset < 0) {
        _animationController.animateTo(0.0);
      } else if (_scrollController.offset > 0.0 && _scrollController.offset < sliderImageHeight) {
        if (_scrollController.offset < ((sliderImageHeight / 1.5))) {
          _animationController.animateTo((_scrollController.offset / sliderImageHeight));
        } else {
          _animationController.animateTo((sliderImageHeight / 1.5) / sliderImageHeight);
        }
      }
      //}
    });
  }

  List<Widget> buildHeader({required BuildContext context, required String title, required void Function(TabType) selectTab}) {
    return [
      InkWell(
        onTap: () {
          if (useDrawerMenu) {
            scaffoldKey.currentState?.openDrawer();
          }
        },
        child: Container(
          height: 52,
          width: 52,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 14, offset: const Offset(0, 8))],
          ),
          child: useDrawerMenu ? const Icon(Icons.menu, color: Colors.black, size: 28) : Image.asset("assets/images/skillROOT.png"),
        ),
      ),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skill passport", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).disabledColor)),
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const Spacer(),
      InkWell(
        onTap: () {
          selectTab(TabType.Notifications);
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            const Icon(Icons.notifications_outlined, size: 30),
            FutureBuilder<int>(
              future: provider.notificationCount,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                bool hasAlerts = snapshot.hasData && snapshot.data != null && snapshot.data! > 0;
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: Icon(Icons.circle, color: hasAlerts ? Colors.red : Colors.transparent, size: 10),
                );
              },
            ),
          ],
        ),
      ),
    ];
  }

  AnimatedBuilder buildAnimatedScaffold({required BuildContext context, List<Widget>? header, String? title, required List<Widget> body, bool useGrid = false, int gridSize = 2}) {
    sliderImageHeight = MediaQuery.of(context).size.width * 1.3;

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: Transform(
            transform: new Matrix4.translationValues(0.0, 40 * (1.0 - widget.animationController.value), 0.0),
            child: child,
          ),
        );
      },
      child: PageScaffold(
        scaffoldKey: scaffoldKey,
        drawer: useDrawerMenu ? _buildMockDrawer(context) : null,
        body: body,
        header: header,
        title: title,
        useGrid: useGrid,
        gridSize: gridSize,
      ),
    );
  }

  Widget _buildMockDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: Image.asset("assets/images/skillROOT.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text("SkillROOT Menu", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help & Support"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () => Navigator.pop(context),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () async {
              Navigator.pop(context); // Close drawer
              await FirebaseAuth.instance.signOut();
              Api.signOut();
              provider.reset();
              Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


