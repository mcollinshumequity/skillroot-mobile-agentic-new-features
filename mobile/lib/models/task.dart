class Role {
  int id;
  int? commonId;
  String name;
  String description;
  String industry;

  Role({required this.id, required this.name, required this.description, required this.industry});

  Role.fromApi(Map<String, dynamic> api) : id = int.parse(api["Id"] ?? '0'), commonId = int.parse(api['CommonRoleId']), name = api["Name"], description = api["Description"], industry = api["Industry"];

  static List<Role> listFromApi(List<dynamic> api) {
    print(api);
    return api.map((r) => Role.fromApi(r as Map<String, dynamic>)).toList();
  }
}

class Task {
  int id;
  int? commonId;
  String name;
  String description;
  ProficiencyLevel? proficiency;

  bool get isEmpty {
    return name.isEmpty && description.isEmpty;
  }

  List<int> skillIds = [];
  bool selected = false;

  Task({required this.id, required this.name, required this.description});

  Task.empty({this.selected = false}) : id = 0, name = "", description = "";
  Task.fromApi(Map<String, dynamic> api) : id = int.parse(api["Id"] ?? "0"), commonId = api["CommonTaskId"] == null ? null : int.parse(api["CommonTaskId"]), name = api["Name"], description = api["Description"] {
    var prof = api["ProficiencyLevel"];
    if (prof != null) {
      var proficiencyValue = int.parse(prof);
      proficiency = switch (proficiencyValue) {
        <= 0 => ProficiencyLevel.none,
        1 => ProficiencyLevel.fundamentals,
        _ => ProficiencyLevel.proficient,
      };
    }
  }

  static List<Task> listFromApi(List<dynamic> api) {
    return api.map((t) => Task.fromApi(t as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> forApi() {
    return {
      "Id": id > 0 ? id : null,
      "CommonTaskId": commonId,
      "Name": name,
      "Description": description,
      "ProficiencyLevel": switch (proficiency) {
        ProficiencyLevel.none => 0,
        ProficiencyLevel.fundamentals => 1,
        ProficiencyLevel.proficient => 2,
        _ => null,
      },
    };
  }
}

class Skill {
  int id;
  String name;
  String category;
  int proficiencyLevel;
  String type;

  Skill({required this.id, required this.name, required this.category, required this.type, required this.proficiencyLevel});

  Skill.fromApi(Map<String, dynamic> api) : id = int.parse(api["skillroot_skill_id"]), name = api["skill_description"], category = api["skill_category"], type = api["skill_type"], proficiencyLevel = int.parse(api["skill_proficiency"]);

  static List<Skill> listFromApi(List<dynamic> api) {
    return api.map((s) => Skill.fromApi(s as Map<String, dynamic>)).toList();
  }
}

enum ProficiencyLevel {
  none,
  fundamentals,
  proficient;

  String label() {
    return switch (this) {
      none => "No Proficiency !",
      fundamentals => "Fundamental Understanding",
      proficient => "Proficient",
    };
  }
}
