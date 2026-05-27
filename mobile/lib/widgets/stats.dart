import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class StatsBlock extends StatefulWidget {
  final List<StatsCard> stats;
  StatsBlock(this.stats);
  @override
  State<StatsBlock> createState() => _StatsBlockState();
}

class _StatsBlockState extends State<StatsBlock> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = (constraints.maxWidth - 12) / 2;
        if (constraints.maxWidth > 640) {
          cardWidth = (constraints.maxWidth - 24) / 3;
        }
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ...widget.stats.map<Widget>((stat) {
              return SizedBox(
                width: cardWidth,
                child: stat.build(context),
              );
            }),
          ],
        );
      },
    );
  }
}

class StatsCard {
  String label;
  String value;
  IconData icon;
  Widget? child;
  StatsCard({required this.label, required this.value, this.child, required this.icon});

  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget topRow = Row(
      children: [
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: secondaryColor.withAlpha(36),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: secondaryColor),
        ),
        SizedBox(width: 10),
        child == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: Color(0xff1f2a3d)),
                  ),
                  Text(label, style: theme.textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                ],
              )
            : Text(
                label,
                style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: Color(0xff1f2a3d)),
              ),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 16, offset: const Offset(0, 10))],
      ),
      child: child == null
          ? topRow
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [topRow, SizedBox(height: 10), child!],
            ),
    );
  }
}
