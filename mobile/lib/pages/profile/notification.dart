// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/animated_tab.dart';
import 'package:skillroot/tab_screen.dart';
import 'package:skillroot/widgets/hero_banner.dart';

class NotificationScreen extends StatefulWidget with AnimatedTab {
  @override
  final AnimationController animationController;
  final void Function(TabType) selectTab;

  const NotificationScreen({super.key, required this.animationController, required this.selectTab});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();

  static void contextClick(BuildContext context) {}
}

class _NotificationScreenState extends State<NotificationScreen> with TickerProviderStateMixin, AnimatedTabState {
  @override
  void initState() {
    initAnimation();

    super.initState();
  }

  final List<_NotificationItem> notifications = [
    _NotificationItem(title: "Admin", time: "2h 47m ago", message: "Asked to join online courses regarding professional web designing.", avatar: ThemeStrings.v13, tag: "System"),
    _NotificationItem(title: "Customer Care", time: "3h 02m ago", message: "Your 50% discount code is: ON50DIS. Apply on checkout.", avatar: ThemeStrings.v14, tag: "Offer"),
    _NotificationItem(title: "Lillian Ellis", time: "4h 32m ago", message: "Assigned you to watch professional videography course.", avatar: ThemeStrings.v14, tag: "Training"),
    _NotificationItem(title: "Admin", time: "Yesterday", message: "You just signed in from another device. Check inbox for more details.", avatar: ThemeStrings.v16, tag: "Security"),
    _NotificationItem(title: "Customer Care", time: "Yesterday", message: "Your 50% discount code is: ON50DIS. Apply on checkout.", avatar: ThemeStrings.v17, tag: "Offer"),
  ];

  @override
  Widget build(BuildContext context) {
    return buildAnimatedScaffold(
      context: context,
      header: buildHeader(
        context: context,
        title: "Notifications",
        selectTab: widget.selectTab,
      ),
      body: [
        HeroBanner(
          title: "Notifications",
          titleIcon: const Icon(Icons.notifications_active_outlined, color: Colors.white, size: 18),
          headline: "Stay on top of your skill passport.",
          tagline: "Alerts for training, approvals, and security—all in one feed.",
          icon: Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 18, offset: const Offset(0, 12))],
            ),
            child: Icon(Icons.notifications_none_outlined, color: primaryColor, size: 32),
          ),
        ),
        const SizedBox(height: 16),
        ...notifications.map(
          (n) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _notificationCard(context, n),
          ),
        ),
      ],
    );
  }

  Widget _notificationCard(BuildContext context, _NotificationItem n) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 16, offset: const Offset(0, 10))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primaryColor, secondaryColor], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(n.avatar, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        n.title,
                        style: theme.textTheme.headlineSmall!.copyWith(fontSize: 15, fontWeight: FontWeight.w800, color: const Color(0xff1f2a3d)),
                      ),
                    ),
                    Text(n.time, style: theme.textTheme.bodySmall!.copyWith(color: const Color(0xff5c667a))),
                  ],
                ),
                const SizedBox(height: 6),
                if (n.tag != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: secondaryColor.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      n.tag!,
                      style: theme.textTheme.bodySmall!.copyWith(color: secondaryColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                if (n.tag != null) const SizedBox(height: 6),
                Text(n.message, style: theme.textTheme.bodyMedium!.copyWith(color: const Color(0xff3f4a5f))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem {
  final String title;
  final String time;
  final String message;
  final String avatar;
  final String? tag;

  _NotificationItem({required this.title, required this.time, required this.message, required this.avatar, this.tag});
}
