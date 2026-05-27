import 'package:intl/intl.dart';
import 'package:skillroot/models/achievement.dart';

class Training {
  int id;
  String name;
  String description;
  String trainer;
  DateTime completionDate;
  DateTime? expirationDate;
  int? hours;
  Achievement verification;

  Training({
    required this.id,
    required this.name,
    required this.description,
    required this.trainer,
    required this.completionDate,
    required this.verification,
    this.expirationDate,
    this.hours,
  });

  Training.empty() : id = 0, name = "", description = "", trainer = "", completionDate = DateTime(2000, 1, 1), verification = Achievement(VerificationLevel.self);

  Training.fromApi(Map<String, dynamic> api) : id = int.parse(api["Id"]), name = api["Name"], description = api["Description"], trainer = api["Trainer"], completionDate = DateTime.tryParse(api["CompletionDate"]) ?? DateTime.now(), verification = Achievement(VerificationLevel.self) {
    final expiration = api["ExpirationDate"];
    if (expiration != null) {
      expirationDate = DateTime.parse(expiration);
    }

    final hrs = api["Hours"];
    if (hrs != null) {
      hours = int.parse(hrs);
    }
  }
  static List<Training> listFromApi(List<dynamic> api) {
    return api.map((t) => Training.fromApi(t)).toList();
  }

  Map<String, dynamic> forApi() {
    return {
      "Id": id > 0 ? id : null,
      "Name": name,
      "Description": description,
      "Trainer": trainer,
      "CompletionDate": DateFormat("yyyy-MM-dd").format(completionDate),
      "ExpirationDate": expirationDate == null ? null : DateFormat("yyyy-MM-dd").format(expirationDate!),
      "Hours": hours,
    };
  }
}
