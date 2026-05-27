import 'package:flutter/material.dart';

import 'package:skillroot/widgets/animated_tab.dart';
import 'package:skillroot/widgets/training_history_pane.dart';
import 'package:skillroot/widgets/hero_banner.dart';
import 'package:skillroot/widgets/stats.dart';

import 'package:skillroot/models/training.dart';
import 'package:skillroot/models/achievement.dart';

import 'package:skillroot/tab_screen.dart';

import 'package:skillroot/services/provider.dart';

import 'package:skillroot/pages/training/edit.dart';
import 'package:skillroot/pages/training/view.dart';

class TrainingHistoryScreen extends StatefulWidget with AnimatedTab {
  @override
  final AnimationController animationController;
  final void Function(TabType) selectTab;

  const TrainingHistoryScreen({super.key, required this.animationController, required this.selectTab});

  @override
  State<TrainingHistoryScreen> createState() => _TrainingHistoryScreenState();

  static void contextClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditTraining(),
      ),
    );
  }
}

class _TrainingHistoryScreenState extends State<TrainingHistoryScreen> with TickerProviderStateMixin, AnimatedTabState {
  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  List<Training>? _training;
  Future<List<Training>> get training async {
    if (_training == null) {
      _training = await provider.training;
    }

    return _training!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Training>>(
      future: training,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Training> training = snapshot.data ?? [];
        final threshold = DateTime.now().add(const Duration(days: 180));

        final soon = training.where((j) => j.expirationDate != null && j.expirationDate!.isBefore(threshold)).length;
        final employer = training.where((j) => j.verification.verification == VerificationLevel.employer).length;
        final noExpiry = training.where((j) => j.expirationDate == null).length;

        return buildAnimatedScaffold(
          context: context,
          header: buildHeader(
            context: context,
            title: "Training",
            selectTab: widget.selectTab,
          ),
          body: [
            HeroBanner(
              title: "Training Record",
              titleIcon: const Icon(Icons.school_outlined, color: Colors.white, size: 18),
              headline: "Log every lesson. Carry it everywhere.",
              tagline: "Courses, safety, certifications—all part of your skillROOT passport.",
              chips: [
                "Courses logged: ${training.length}",
                "Expiring soon: $soon",
                "Employer verified: $employer",
              ],
            ),
            const SizedBox(height: 16),
            StatsBlock([
              StatsCard(label: "Employer verified", value: "$employer", icon: Icons.verified_outlined),
              StatsCard(label: "Expiring soon", value: "$soon", icon: Icons.timer_outlined),
              StatsCard(label: "No expiration", value: "$noExpiry", icon: Icons.all_inclusive),
            ]),
            const SizedBox(height: 16),
            if (snapshot.hasData && snapshot.data != null)
              ...training.map(
                (training) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TrainingHistoryPane(
                    training: training,
                    onTap: () async {
                      await Navigator.push<bool>(context, MaterialPageRoute(builder: (_) => ViewTraining(training: training))).then((_) {
                        setState(() {
                          _training = null;
                        });
                      });
                    },
                  ),
                ),
              )
            else
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]),
          ],
        );
      },
    );
  }
}
