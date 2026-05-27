import 'package:flutter/material.dart';

import 'package:skillroot/services/theme.dart';
import 'package:skillroot/config.dart';

class AuthElements {
  static Widget headerBackdrop(Size size) {
    return Container(
      height: size.height * 0.42,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, Color(0xff0A4E96)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -20,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withAlpha(20)),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -30,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withAlpha(13)),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor.withAlpha(38),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget brandHeader(ThemeData theme) {
    return Row(
      children: [
        Container(
          height: 84,
          width: 84,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white.withAlpha(230), Colors.white.withAlpha(154)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(31), blurRadius: 20, offset: const Offset(0, 10)),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/skillROOT.png"),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appName,
              style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800, letterSpacing: 0.3, fontSize: 24),
            ),
            Text("Upskill • Track • Grow", style: theme.textTheme.titleSmall!.copyWith(color: Colors.white.withAlpha(205))),
          ],
        ),
      ],
    );
  }
}
