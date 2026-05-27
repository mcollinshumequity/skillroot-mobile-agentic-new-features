// lib/pages/mockup/job_history_list.dart

import 'package:flutter/material.dart';
import 'package:skillroot/models/job.dart';
import 'job_history_detail.dart';
import 'skillroot_design_system.dart';

class JobHistoryListPage extends StatelessWidget {
  const JobHistoryListPage({Key? key}) : super(key: key);

  // Demo mock data using existing Job model
  List<Job> _mockJobs() {
    return [
      Job(
        id: 1,
        name: 'Software Engineer I',
        employerName: 'Acme Corp',
        startDate: DateTime(2020, 6, 1),
        supervisor: 'John Doe',
        email: 'john.doe@acme.com',
        lastWage: '\$80k',
        location: 'San Francisco',
      ),
      Job(
        id: 2,
        name: 'Senior Software Engineer',
        employerName: 'Beta Ltd.',
        startDate: DateTime(2022, 3, 15),
        supervisor: 'Jane Smith',
        email: 'jane.smith@beta.com',
        lastWage: '\$120k',
        location: 'New York',
      ),
      Job(
        id: 3,
        name: 'Lead Engineer',
        employerName: 'Gamma Solutions',
        startDate: DateTime(2023, 9, 1),
        supervisor: 'Mike Johnson',
        email: 'mike.johnson@gamma.com',
        lastWage: '\$150k',
        location: 'Austin',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final jobs = _mockJobs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job History'),
        backgroundColor: SkillrootColors.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: ListTile(
              title: Text(job.name, style: SkillrootTypography.subtitle1),
              subtitle: Text(job.employerName, style: SkillrootTypography.body2),
              trailing: Text(
                '${job.startDate.year}',
                style: SkillrootTypography.caption,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => JobHistoryDetailPage(job: job),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
