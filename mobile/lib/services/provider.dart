import 'package:skillroot/services/api.dart';

import 'package:skillroot/models/user.dart';
import 'package:skillroot/models/job.dart';
import 'package:skillroot/models/task.dart';
import 'package:skillroot/models/training.dart';

class Provider {
  User? _user;
  Future<User> get user async {
    if (_user == null) {
      var response = await Api.call("user/profile");
      if (response['success'] == true) {
        _user = User.fromMap(response['data']);
      } else {
        throw Exception(response['message'] ?? "Failed to load profile data from server.");
      }
    }
    return _user!;
  }

  Future<Map<String, dynamic>?> saveUser(User user) async {
    var response = await Api.call("user/profile/edit.action", parameters: user.forApi());
    if (response['success'] == true) {
      _user = user;
      return null;
    }
    return response;
  }

  List<Job>? _jobs;
  Future<List<Job>> get jobs async {
    if (_jobs == null) {
      // Demo jobs
      var response = await Api.call("job/history");
      if (response['success'] == true) {
        _jobs = Job.listFromApi(response["data"]);
      } else {
        _jobs = [];
      }
    }

    return _jobs!;
  }

  Future<Job> getJob(Job job) async {
    var response = await Api.call("job/${job.id}");
    return Job.fromApi(response['data']);
  }

  Future<void> editJob(Job job) async {
    if (job.id > 0) {
      await Api.call("job/${job.id}/edit.action", parameters: job.forApi());
    } else {
      await Api.call("job/add.action", parameters: job.forApi());
    }
    _jobs = null;
  }

  Future<void> deleteJob(Job job) async {
    await Api.call("job/${job.id}/delete.action", delete: true);
    _jobs = null;
  }

  Future<bool> verifyJob(Job job, {String? name, String? email, String? phone}) async {
    print({
      "Name": name,
      "Email": email,
      "Phone": phone,
    });
    var response = await Api.call(
      "job/${job.id}/request.action",
      parameters: {
        "Name": name,
        "Email": email,
        "Phone": phone,
      },
    );
    print(response);
    if (response['success'] == true) {
      job.externalId = -1;
      for (var jorb in _jobs ?? <Job>[]) {
        if (jorb.id == job.id) {
          jorb.externalId = -1;
        }
      }
      return true;
    }
    return false;
  }

  List<Training>? _training;
  Future<List<Training>> get training async {
    if (_training == null) {
      final response = await Api.call("training/history");
      if (response['success'] == true) {
        _training = Training.listFromApi(response['data']);
      } else {
        _training = []; // Fallback to empty list or you could throw an Exception
      }
    }

    return _training!;
  }

  Future<Training> getTraining(Training training) async {
    var response = await Api.call("training/${training.id}");
    return Training.fromApi(response["data"]);
  }

  Future<void> editTraining(Training training) async {
    if (training.id > 0) {
      await Api.call("training/${training.id}/edit.action", parameters: training.forApi());
    } else {
      await Api.call("training/add.action", parameters: training.forApi());
    }
    _training = null;
  }

  Future<void> deleteTraining(Training training) async {
    await Api.call("training/${training.id}/delete.action", delete: true);
    _training = null;
  }

  List<Role>? _roles;
  Future<List<Role>> get commonRoles async {
    if (_roles == null) {
      var response = await Api.call("common/roles");
      if (response["success"] == true) {
        _roles = Role.listFromApi(response["data"] as List<dynamic>);
      }
    }
    return _roles!;
  }

  List<String>? _industries;
  Future<List<String>> get commonIndustries async {
    if (_industries == null) {
      var response = await Api.call("common/industries");
      if (response['success'] == true) {
        _industries = [];
        for (var datum in response['data']) {
          _industries!.add(datum);
        }
      }
    }
    return _industries!;
  }

  Map<int, List<Skill>> _roleSkills = {};
  Future<List<Skill>?> getRoleSkills(Role? role) async {
    if (role == null) {
      return null;
    }
    if (_roleSkills.containsKey(role.id)) {
      return _roleSkills[role.id];
    }
    var response = await Api.call("common/roles/${role.id}/skills");
    if (response['success'] == true) {
      _roleSkills[role.id] = Skill.listFromApi(response['data']);
      return _roleSkills[role.id];
    }
    return null;
  }

  Map<int, List<Task>> _roleTasks = {};
  Future<List<Task>?> getRoleTasks(Role? role) async {
    if (role == null) {
      return null;
    }
    if (_roleTasks.containsKey(role.commonId)) {
      return _roleTasks[role.commonId];
    }
    var response = await Api.call("common/roles/${role.commonId}/tasks");
    if (response['success'] == true) {
      _roleTasks[role.commonId!] = Task.listFromApi(response['data']);
      return _roleTasks[role.commonId];
    }
    return null;
  }

  List<int>? _notifications;
  Future<List<int>> get notifications async {
    if (_notifications == null) {
      _notifications = [3, 2];
    }
    return _notifications!;
  }

  Future<int> get notificationCount async {
    if (_notifications == null) {
      await notifications;
    }
    return _notifications!.length;
  }

  void reset() {
    _user = null;
    _jobs = null;
    _training = null;
    _roles = null;
    _industries = null;
    _roleSkills = {};
    _roleTasks = {};
    _notifications = null;
  }
}

Provider provider = Provider();
