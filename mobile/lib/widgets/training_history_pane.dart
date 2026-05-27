import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillroot/models/training.dart';

class TrainingHistoryPane extends StatelessWidget {
  final Training training;
  final VoidCallback onTap;

  TrainingHistoryPane({required this.training, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
                gradient: LinearGradient(colors: [Theme.of(context).primaryColor, training.verification.verification.color], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(Icons.school_outlined, color: Colors.white),
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
                          training.name,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xff1f2a3d)),
                        ),
                      ),
                      Icon(Icons.circle, color: training.verification.verification.color, size: 10),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    training.trainer,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, color: Color(0xff3f4a5f)),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(DateFormat.yMd().format(training.completionDate), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                      const SizedBox(width: 6),
                      if (training.expirationDate != null) ...[
                        Text("•", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                        const SizedBox(width: 6),
                        Text("Expires ${DateFormat.yMd().format(training.expirationDate!)}", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
                      ] else
                        Text("(No expiration)", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff5c667a))),
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
