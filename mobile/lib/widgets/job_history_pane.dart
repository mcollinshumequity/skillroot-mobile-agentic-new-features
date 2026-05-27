import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillroot/models/job.dart';
import 'package:skillroot/models/achievement.dart';

class JobHistoryPane extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;

  JobHistoryPane({required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Since Job model does not provide a verification getter, use a default level
    VerificationLevel verification = VerificationLevel.self;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 16, offset: const Offset(0, 10))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Theme.of(context).primaryColor, verification.color], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(14),
              ),
                child: Icon(Icons.work_outline, color: Colors.white),
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
                          job.title,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xff1f2a3d)),
                        ),
                      ),
                      Icon(Icons.circle, color: verification.color, size: 10),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    job.company,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, color: Color(0xff3f4a5f)),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(DateFormat.yMd().format(job.startDate), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                      const SizedBox(width: 6),
                      Text("—", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                      const SizedBox(width: 6),
                      if (job.endDate != null) Text(DateFormat.yMd().format(job.endDate!), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                      if (job.endDate == null) Text("present", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
