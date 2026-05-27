class User {
  int id;
  String firstName;
  String lastName;
  String? email;
  String? phone;
  int jobCount;
  int verifiedJobCount;
  int trainingCount;

  List<String> interests = [];

  double get completion {
    int percent = 0;
    if (interests.isNotEmpty) {
      percent += 25;
    }
    if (jobCount > 0) {
      percent += 25;
      if (verifiedJobCount > 0) {
        percent += 25;
      }
    }
    if (trainingCount > 0) {
      percent += 25;
    }

    if (percent >= 100) {
      percent = 99;
    }

    return percent / 100;
  }

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.phone,
    this.jobCount = 0,
    this.verifiedJobCount = 0,
    this.trainingCount = 0,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = int.parse("${map["Id"]}"),
        firstName = map["FirstName"],
        lastName = map["LastName"],
        email = map["EmailAddress"],
        phone = map["PhoneNumber"],
        jobCount = map["Stats"]["Jobs"],
        verifiedJobCount = map["Stats"]["VerifiedJobs"],
        trainingCount = map["Stats"]["Training"] {
    if (map["Meta"] != null && (map["Meta"] as Map).containsKey("Interests")) {
      var _interests = map["Meta"]["Interests"] as List<dynamic>;
      for (var interest in _interests) {
        interests.add(interest as String);
      }
    }
  }

  Map<String, dynamic> forApi() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phone,
      "Interests": interests,
    };
  }
}
