import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/routes.dart';
import 'package:skillroot/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _logoScale = Tween<double>(begin: 0.9, end: 1.05).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    Timer(const Duration(milliseconds: 2600), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacementNamed(context, Routes.HOME);
      } else {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, const Color(0xff0A4E96)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            ..._buildBubbles(),
            Center(
              child: AnimatedBuilder(
                animation: _logoScale,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _logoScale.value,
                    child: child,
                  );
                },
                child: Container(
                  height: 140,
                  width: 140,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(46), blurRadius: 30, offset: const Offset(0, 16)),
                    ],
                  ),
                  child: Image.asset("assets/images/skillROOT.png"),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 40,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    appName,
                    style: theme.textTheme.displaySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800, letterSpacing: 0.3),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Your skills. Your proof. Wherever you go.",
                    style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white.withAlpha(218)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBubbles() {
    final bubbleConfigs = [
      _BubbleConfig(size: 120, top: 90, left: -30, opacity: 31),
      _BubbleConfig(size: 80, top: 200, right: 40, opacity: 26),
      _BubbleConfig(size: 160, bottom: 100, left: 10, opacity: 20),
      _BubbleConfig(size: 100, bottom: 180, right: -20, opacity: 36),
    ];

    return bubbleConfigs
        .map(
          (c) => AnimatedBuilder(
            animation: _pulseController,
            builder: (context, _) {
              final wobble = 4 * (_pulseController.value - 0.5);
              return Positioned(
                top: c.top != null ? c.top! + wobble : null,
                bottom: c.bottom != null ? c.bottom! - wobble : null,
                left: c.left != null ? c.left! - wobble : null,
                right: c.right != null ? c.right! + wobble : null,
                child: Container(
                  height: c.size,
                  width: c.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(c.opacity),
                  ),
                ),
              );
            },
          ),
        )
        .toList();
  }
}

class _BubbleConfig {
  final double size;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final int opacity;

  _BubbleConfig({required this.size, this.top, this.bottom, this.left, this.right, required this.opacity});
}
