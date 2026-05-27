import 'package:flutter/material.dart';
import 'package:skillroot/models/achievement.dart';

class BadgePane extends StatefulWidget {
  final Achievement badge;
  final Widget body;
  BadgePane({required this.badge, required this.body});

  @override
  State<BadgePane> createState() => _BadgePaneState();
}

class _BadgePaneState extends State<BadgePane> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var availableWidth = constraints.maxWidth - 80;
        return Row(
          children: [
            Container(width: availableWidth, child: widget.body),
            BadgeIndicator(widget.badge),
          ],
        );
      },
    );
  }
}

class BadgeIndicator extends StatelessWidget {
  final Achievement badge;
  BadgeIndicator(this.badge);

  @override
  Widget build(BuildContext context) {
    double iconSize = badge.verification.level * 10 + 40;
    return Container(
      width: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.star_rounded, size: iconSize, color: badge.verification.color),
          //if (!AppTheme.isLightTheme) Icon(Icons.star_outline_rounded, size: iconSize, color: Colors.white),
          Text(
            badge.verification.level.toString(),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: badge.verification.contrast),
          ),
        ],
      ),
    );
  }
}
