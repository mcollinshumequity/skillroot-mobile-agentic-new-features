// lib/models/job.dart



/// Represents a job entry in the user's profile.
class Job {
  var id;
  var title;
  var company;
  var startDate;
  var endDate; // Optional end date; null indicates "present"
  var summary;
  var details;
  // New fields required by UI and logic
  var name;
  var employerName;
  var supervisor;
  var email;
  var lastWage;
  var location;
  var commonRole;
  var tasks; // could be List<String>
  JobVerificationStatus? verification; // Job verification status
  var externalId; // int?


  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.startDate,
    this.endDate,
    required this.summary,
    required this.details,
    this.name,
    this.employerName,
    this.supervisor,
    this.email,
    this.lastWage,
    this.location,
    this.commonRole,
    this.tasks,
    this.verification,
    this.externalId,
  });

  /// Generates mock job data for UI preview and testing.
  static List<Job> mockJobs() {
    return List.generate(5, (index) {
      return Job(
        id: 'job_$index',
        title: 'Software Engineer ${index + 1}',
        company: 'Company ${index + 1}',
        startDate: DateTime.now().subtract(Duration(days: index * 365)),
        endDate: index == 0 ? null : DateTime.now().subtract(Duration(days: index * 365 - 180)),
        summary: 'Worked on various projects focusing on mobile development.',
        details: 'Full description of job responsibilities, achievements, and technologies used for job ${index + 1}.',
      );
    });
  }

  /// Parses a list of job objects received from the API.
  static List<Job> listFromApi(List<dynamic> data) {
    return data.map((e) => Job.fromApi(e as Map<String, dynamic>)).toList();
  }

  /// Creates an empty Job instance for creation flow.
  static Job empty() {
    return Job(
      id: '0',
      title: '',
      company: '',
      startDate: DateTime.now(),
      endDate: null,
      summary: '',
      details: '',
      name: '',
      employerName: '',
      supervisor: '',
      email: '',
      lastWage: '',
      location: '',
      commonRole: null,
      tasks: [],
      verification: null,
      externalId: null,
    );
  }

  /// Creates a [Job] instance from a JSON map returned by the backend.
  factory Job.fromApi(Map<String, dynamic> json) {
    return Job(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      startDate: DateTime.parse(json['start_date'] ?? json['date'] ?? DateTime.now().toIso8601String()),
      endDate: json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      summary: json['summary'] ?? '',
      details: json['details'] ?? '',
      name: json['name'] ?? '',
      employerName: json['employer_name'] ?? '',
      supervisor: json['supervisor'] ?? '',
      email: json['email'] ?? '',
      lastWage: json['last_wage'] ?? '',
      location: json['location'] ?? '',
      commonRole: json['common_role'],
      tasks: json['tasks'] ?? [],
      verification: json['verification'] != null ? JobVerificationStatus.values[json['verification']] : JobVerificationStatus.Unknown,
      externalId: json['external_id'],
    );
  }

  /// Serialises the job into a map suitable for sending to the API.
  Map<String, dynamic> forApi() {
    final map = {
      'id': id,
      'title': title,
      'company': company,
      'start_date': startDate.toIso8601String(),
      'summary': summary,
      'details': details,
      'name': name,
      'employer_name': employerName,
      'supervisor': supervisor,
      'email': email,
      'last_wage': lastWage,
      'location': location,
      'common_role': commonRole,
      'tasks': tasks,
      'verification': verification != null ? verification!.index : null,
      'external_id': externalId,
    };
    if (endDate != null) {
      map['end_date'] = endDate!.toIso8601String();
    }
    return map;
  }

  // Convenience getter for UI code
  JobVerificationStatus get verificationStatus => verification ?? JobVerificationStatus.Unknown;
}

enum JobVerificationStatus { Unknown, Unverified, Pending, Verified }
