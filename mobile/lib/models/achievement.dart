import 'package:flutter/material.dart';

class Achievement {
  VerificationLevel verification;

  Achievement(this.verification);
}

enum VerificationLevel {
  self(1, "Self", const Color(0xff5c667a), Colors.white),
  training(2, "Training", const Color(0xfff6a548), Colors.white),
  employer(3, "Employer", const Color(0xff0b72c7), Colors.black);

  const VerificationLevel(this.level, this.label, this.color, this.contrast);
  final int level;
  final String label;
  final Color color;
  final Color contrast;
}
