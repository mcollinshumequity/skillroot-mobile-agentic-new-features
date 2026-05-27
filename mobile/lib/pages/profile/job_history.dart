import 'package:flutter/material.dart';

import 'package:skillroot/widgets/animated_tab.dart';
import 'package:skillroot/widgets/job_history_pane.dart';
import 'package:skillroot/widgets/hero_banner.dart';
import 'package:skillroot/widgets/stats.dart';

import 'package:skillroot/tab_screen.dart';

import 'package:skillroot/services/provider.dart';

import 'package:skillroot/models/job.dart';

import 'package:skillroot/pages/job/view.dart';
import 'package:skillroot/pages/job/edit.dart';

class JobHistory extends StatefulWidget with AnimatedTab {
  @override
  final AnimationController animationController;
  final void Function(TabType) selectTab;

  const JobHistory({
    super.key,
    required this.animationController,
    required this.selectTab,
  });

  @override
  State<JobHistory> createState() => _JobHistoryState();

  static void contextClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditJob(), //AddJobInfoMockup()
      ),
    );
  }
}

class _JobHistoryState extends State<JobHistory>
    with TickerProviderStateMixin, AnimatedTabState {
  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  List<Job>? _jobs;
  Future<List<Job>> get jobs async {
    if (_jobs == null) {
      _jobs = await provider.jobs;
    }

    return _jobs!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: jobs,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Job> jobs = snapshot.data ?? [];
        final active = jobs.where((j) => j.endDate == null).length;
        final training = jobs
            .where((j) => j.verification == JobVerificationStatus.Pending)
            .length;
        final verified = jobs
            .where((j) => j.verification == JobVerificationStatus.Verified)
            .length;

        return buildAnimatedScaffold(
          context: context,
          header: buildHeader(
            context: context,
            title: "Job History",
            selectTab: widget.selectTab,
          ),
          body: [
            HeroBanner(
              title: "Job History",
              titleIcon: const Icon(
                Icons.work_outline,
                color: Colors.white,
                size: 18,
              ),
              headline: "Proof your work story.",
              tagline:
                  "Track jobs, verify outcomes, and keep your experiences portable.",
              chips: [
                "Active roles: $active",
                "Employer verified: $verified",
                "Total jobs: ${jobs.length}",
              ],
            ),
            const SizedBox(height: 16),
            StatsBlock([
              StatsCard(
                label: "Employer verified",
                value: "$verified",
                icon: Icons.verified_outlined,
              ),
              StatsCard(
                label: "Training validated",
                value: "$training",
                icon: Icons.school_outlined,
              ),
              StatsCard(
                label: "Active roles",
                value: "$active",
                icon: Icons.engineering_outlined,
              ),
            ]),
            const SizedBox(height: 16),
            if (snapshot.hasData && snapshot.data != null)
              ...jobs.map<Widget>(
                (job) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: JobHistoryPane(
                    job: job,
                    onTap: () async {
                      await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(builder: (_) => ViewJob(job: job)),
                      ).then((_) {
                        setState(() {
                          _jobs = null;
                        });
                      });
                    },
                  ),
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
          ],
        );
      },
    );
  }
}
