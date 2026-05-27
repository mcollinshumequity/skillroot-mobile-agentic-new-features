import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class HeroBanner extends StatefulWidget {
  final String title;
  final String headline;
  final String? tagline;
  final Icon titleIcon;
  final Widget? icon;
  final List<String>? chips;
  HeroBanner({required this.title, required this.headline, this.tagline, required this.titleIcon, this.icon, this.chips});

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryColor, const Color(0xff0A4E96)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: primaryColor.withAlpha(64), blurRadius: 24, offset: const Offset(0, 14))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white.withAlpha(36), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.titleIcon,
                      const SizedBox(width: 6),
                      Text(widget.title, style: theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.headline,
                  style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800, letterSpacing: -0.2),
                ),
                const SizedBox(height: 8),
                if (widget.tagline != null)
                  Text(
                    widget.tagline!,
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white.withAlpha(230)),
                  ),
                if (widget.chips != null && widget.chips!.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...widget.chips!.map<Widget>((text) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(color: Colors.white.withAlpha(36), borderRadius: BorderRadius.circular(10)),
                          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
                        );
                      }),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (widget.icon != null)
            widget.icon!
          else
            Container(
              height: 82,
              width: 82,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(31), blurRadius: 20, offset: const Offset(0, 12)),
                ],
              ),
              child: Image.asset("assets/images/skillROOT.png"),
            ),
        ],
      ),
    );
  }
}
