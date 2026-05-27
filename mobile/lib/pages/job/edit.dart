import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillroot/models/job.dart';
import 'package:skillroot/models/task.dart';
import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/widgets/accordion.dart';
import 'package:skillroot/widgets/element_group.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/custom_edit.dart';
import 'package:skillroot/widgets/text_fields.dart';

import 'package:skillroot/services/provider.dart';

class EditJob extends StatefulWidget {
  final Job? job;

  EditJob({super.key, this.job});

  @override
  State<EditJob> createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {
  CustomEditController employerController = CustomEditController(label: "Employer", errorText: "Employer name is required.");
  CustomEditController reportToController = CustomEditController(label: "Supervisor", errorText: "Supervisor is required.");
  CustomEditController jobEmailController = CustomEditController(label: "Job Email", errorText: "Job Email is required.");
  CustomEditController lastWageController = CustomEditController(label: "Last Wage", errorText: "Last Wage is required.");
  CustomEditController locationController = CustomEditController(label: "Location", errorText: "Location is required.");
  CustomEditController nameController = CustomEditController(label: "Job Title", errorText: "Job Title is required.");

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();

  TextEditingController roleController = TextEditingController();

  int tabIndex = 0;

  String? industry;
  Role? role;
  DateTime? startDate;
  DateTime? endDate;
  String? startDateError;
  String? endDateError;

  //List<ProficiencyLevel?> _taskSelectors = [];
  Set<Task> _selectedTasks = {};
  List<Task>? _tasks = null;
  Future<List<Task>> get tasks async {
    if (_tasks == null) {
      _tasks = await provider.getRoleTasks(role);
      _tasks!.sort((a, b) => a.name.compareTo(b.name));
      _tasks!.forEach((t) {
        t.proficiency = null;
      });
      //_taskSelectors = List<ProficiencyLevel?>.filled(_tasks!.length, null);
      _selectedTasks = {};
    }
    return _tasks!;
  }

  void resetTaskEdit({Task? load, bool skipSave = false}) {
    Set<Task> removals = {};
    _selectedTasks.where((t) => (t.commonId == null || widget.job != null)).forEach((t) {
      if (t.selected) {
        bool wasEmpty = t.isEmpty;
        if (!skipSave) {
          t.name = taskNameController.text;
          t.description = taskDescController.text;
        }
        if (wasEmpty && t.isEmpty) {
          removals.add(t);
        }
        t.selected = false;
      }
    });

    _selectedTasks.removeAll(removals);

    if (!skipSave) {
      taskNameController.text = load?.name ?? "";
      taskDescController.text = load?.description ?? "";
    }
    load?.selected = true;
  }

  late List<NewJobTab> newJobTabs;

  @override
  void initState() {
    if (widget.job != null) {
      var job = widget.job!;
      nameController.text = job.name;
      employerController.text = job.employerName;
      reportToController.text = job.supervisor;
      jobEmailController.text = job.email;
      lastWageController.text = job.lastWage;
      locationController.text = job.location;
      startDate = job.startDate;
      endDate = job.endDate;

      role = job.commonRole;
      industry = role!.industry;
      _selectedTasks = job.tasks.toSet();

      newJobTabs = [
        NewJobTab(label: "Edit Job", nextButton: "Edit Tasks", build: buildDetails, validate: validateDetails),
        NewJobTab(label: "Edit Tasks", nextButton: "Review Job", build: buildTaskSelect, validate: validateTasks),
        NewJobTab(label: "Review Job", nextButton: "Save Job", build: buildReview, terminal: true),
      ];
    } else {
      newJobTabs = [
        NewJobTab(label: "Add Job", nextButton: "Add Tasks", build: buildDetails, validate: validateDetails),
        NewJobTab(label: "Add Tasks", nextButton: "Review Job", build: buildTaskSelect, validate: validateAddTasks),
        NewJobTab(label: "Review Job", nextButton: "Save Job", build: buildReview, terminal: true),
      ];
    }
    super.initState();
  }

  List<Widget> buildDetails(BuildContext context) {
    return [
      ElementGroup([
        GroupedElement(employerController.text, header: "Employer", editCustom: employerController, noTrailer: true),
        GroupedElement(nameController.text, header: "Job Title", editCustom: nameController, noTrailer: true),
        GroupedElement(reportToController.text, header: "Supervisor", editCustom: reportToController, noTrailer: true),
        GroupedElement(jobEmailController.text, header: "Job Email", editCustom: jobEmailController, noTrailer: true),
        GroupedElement(lastWageController.text, header: "Last Wage", editCustom: lastWageController, noTrailer: true),
        GroupedElement(locationController.text, header: "Location", editCustom: locationController, noTrailer: true),
        GroupedElement(
          startDate == null ? '' : DateFormat.yMd().format(startDate!),
          header: "Start Date",
          errorText: startDateError,
          trailerIcon: Icons.calendar_month,
          trailerAction: () async {
            var selectedDate = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(DateTime.now().year + 1));
            if (selectedDate != null) {
              setState(() {
                startDate = selectedDate;
              });
            }
          },
        ),
        GroupedElement(
          endDate == null ? '' : DateFormat.yMd().format(endDate!),
          header: "End Date",
          errorText: endDateError,
          trailerIcon: Icons.calendar_month,
          trailerAction: () async {
            var selectedDate = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(DateTime.now().year + 1));
            if (selectedDate != null) {
              setState(() {
                endDate = selectedDate;
              });
            }
          },
          leader: endDate != null ? Icon(Icons.delete, size: 16, color: Colors.red) : null,
          leaderAction: () {
            setState(() {
              endDate = null;
            });
          },
        ),
      ]),
    ];
  }

  bool validateDetails() {
    bool isValid = true;
    for (var controller in [employerController, nameController, reportToController, jobEmailController, lastWageController, locationController]) {
      controller.allowError = true;
      bool controllerValid = controller.validate();
      isValid = isValid && controllerValid;
    }

    startDateError = null;
    endDateError = null;
    if (startDate == null) {
      startDateError = "Start Date is required.";
      isValid = false;
    } else if (endDate != null && endDate!.compareTo(startDate!) < 0) {
      endDateError = "End Date must be after Start Date.";
      isValid = false;
    }
    return isValid;
  }

  bool validateAddTasks() {
    if (industry == null || role == null || _selectedTasks.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateTasks() {
    if (industry == null || role == null || _selectedTasks.isEmpty) {
      return false;
    }
    return true;
  }

  List<Widget> buildReview(BuildContext context) {
    var tasks = _selectedTasks.toList();
    tasks.sort((a, b) => a.name.compareTo(b.name));

    List<Widget> widgets = [];

    for (var task in tasks) {
      widgets.addAll(
        [
          if (widgets.isNotEmpty) SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(task.name, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(task.description, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13)),
          ),
        ],
      );
    }

    return [
      ElementGroup([
        GroupedElement(employerController.text, header: "Employer", noTrailer: true),
        GroupedElement(nameController.text, header: "Job Title", noTrailer: true),
        GroupedElement(industry!, header: "Industry", noTrailer: true),
        GroupedElement(role!.name, header: "Role", noTrailer: true),
      ]),
      SizedBox(height: 10),
      Accordion(
        header: "Tasks",
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widgets,
        ),
      ),
      SizedBox(height: 10),
      ElementGroup([
        GroupedElement(reportToController.text, header: "Supervisor", noTrailer: true),
        GroupedElement(jobEmailController.text, header: "Job Email", noTrailer: true),
        GroupedElement(lastWageController.text, header: "Last Wage", noTrailer: true),
        GroupedElement(locationController.text, header: "Location", noTrailer: true),
        GroupedElement(startDate == null ? '' : DateFormat.yMd().format(startDate!), header: "Start Date", noTrailer: true),
        GroupedElement(endDate == null ? 'present' : DateFormat.yMd().format(endDate!), header: "End Date", noTrailer: true),
      ]),
      SizedBox(height: 10),
    ];
  }

  List<Widget> buildTaskSelect(BuildContext c) {
    var job = widget.job;
    return [
      if (job != null)
        ElementGroup([
          GroupedElement(industry!, header: "Industry", noTrailer: true),
          GroupedElement(role!.name, header: "Role", noTrailer: true),
        ])
      else ...[
        Text("Select Industry"),
        FutureBuilder<List<String>>(
          future: provider.commonIndustries,
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var industries = snapshot.data!;
              industries.sort();
              return DropdownMenu<String>(
                initialSelection: industry,
                enableFilter: true,
                requestFocusOnTap: true,
                menuHeight: 300,
                dropdownMenuEntries: industries.map<DropdownMenuEntry<String>>((a) {
                  return DropdownMenuEntry<String>(value: a, label: a);
                }).toList(),
                onSelected: (a) {
                  setState(() {
                    industry = a;
                    role = null;
                  });
                },
              );
            }
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]);
          },
        ),
        if (industry != null) ...[
          SizedBox(height: 5),
          Text("Select Role"),
          FutureBuilder<List<Role>>(
            future: provider.commonRoles,
            builder: (BuildContext context, AsyncSnapshot<List<Role>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                if (role == null) {
                  role = snapshot.data!.first;
                }

                var roles = snapshot.data!;
                roles.sort((a, b) => a.name.compareTo(b.name));

                return DropdownMenu<Role>(
                  initialSelection: role,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  menuHeight: 500,
                  dropdownMenuEntries: roles.map<DropdownMenuEntry<Role>>((a) {
                    return DropdownMenuEntry<Role>(value: a, label: a.name);
                  }).toList(),
                  onSelected: (a) {
                    setState(() {
                      role = a;
                      _tasks = null;
                    });
                  },
                );
              }
              return Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]);
            },
          ),
          if (role != null) ...[
            SizedBox(height: 5),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var allowedWidth = constraints.hasBoundedWidth ? constraints.maxWidth : 200;
                return Row(
                  children: [
                    Container(
                      width: allowedWidth - 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Suggested Tasks"),
                          Text("Proficiency:"),
                        ],
                      ),
                    ),
                    Container(width: 40, child: Center(child: Text("N/A"))),
                    Container(width: 35, child: Center(child: Text("0"))),
                    Container(width: 40, child: Center(child: Text("1"))),
                    Container(width: 35, child: Center(child: Text("2"))),
                  ],
                );
              },
            ),
            FutureBuilder<List<Task>>(
              future: tasks,
              builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var allowedWidth = constraints.hasBoundedWidth ? constraints.maxWidth : 200;
                      List<Widget> widgets = [];
                      for (var task in snapshot.data!) {
                        widgets.add(
                          RadioGroup<ProficiencyLevel?>(
                            groupValue: task.proficiency,
                            onChanged: (level) {
                              setState(() {
                                task.proficiency = level;
                                if (level == null) {
                                  _selectedTasks.remove(task);
                                } else {
                                  _selectedTasks.add(task);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: allowedWidth - 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(task.name, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)),
                                      Text(task.description, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13)),
                                    ],
                                  ),
                                ),
                                //Container(width: 30, child: Radio<ProficiencyLevel?>(value: null)),
                                //Container(width: 30, child: Radio<ProficiencyLevel?>(value: ProficiencyLevel.none)),
                                //Container(width: 30, child: Radio<ProficiencyLevel?>(value: ProficiencyLevel.fundamentals)),
                                //Container(width: 30, child: Radio<ProficiencyLevel?>(value: ProficiencyLevel.proficient)),
                                Radio<ProficiencyLevel?>(value: null),
                                Radio<ProficiencyLevel?>(value: ProficiencyLevel.none),
                                Radio<ProficiencyLevel?>(value: ProficiencyLevel.fundamentals),
                                Radio<ProficiencyLevel?>(value: ProficiencyLevel.proficient),
                              ],
                            ),
                          ),
                        );
                        widgets.add(SizedBox(height: 5));
                      }
                      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
                    },
                  );
                }
                return Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]);
              },
            ),
          ],
        ],
      ],
      SizedBox(height: 5),
      LayoutBuilder(
        builder: (context, constraints) {
          var allowedWidth = constraints.hasBoundedWidth ? constraints.maxWidth : 200;
          List<Widget> widgets = [];
          var tasks = _selectedTasks.where((t) => (t.commonId == null || job != null));
          if (tasks.isNotEmpty) {
            widgets.add(Text("${job == null ? 'Custom ' : ''}Tasks"));
            for (var task in tasks) {
              widgets.add(
                RadioGroup<ProficiencyLevel?>(
                  groupValue: task.proficiency,
                  onChanged: (p) {
                    setState(() {
                      task.proficiency = p;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (task.selected) {
                              resetTaskEdit();
                            } else {
                              resetTaskEdit(load: task);
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: task.selected ? Colors.green : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Icon(task.selected ? Icons.check : Icons.edit, size: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: allowedWidth - (task.selected ? 190 : 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (task.selected) ...[
                              UnderlinedTextField(controller: taskNameController, hintText: "Task Name"),
                              UnderlinedTextField(controller: taskDescController, hintText: "Task Description"),
                            ] else ...[
                              Text("${task.name} - ${task.proficiency!.label()}", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)),
                              Text(task.description, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13)),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (task.selected) {
                              resetTaskEdit(skipSave: true);
                            } else {
                              _selectedTasks.remove(task);
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Icon(task.selected ? Icons.cancel : Icons.delete, size: 16, color: Colors.white),
                        ),
                      ),
                      if (task.selected) ...[
                        Radio<ProficiencyLevel?>(value: ProficiencyLevel.none),
                        Radio<ProficiencyLevel?>(value: ProficiencyLevel.fundamentals),
                        Radio<ProficiencyLevel?>(value: ProficiencyLevel.proficient),
                      ],
                    ],
                  ),
                ),
              );
              widgets.add(SizedBox(height: 5));
            }
          }
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
        },
      ),
      RoundedFlatButton(
        name: "Add Custom Task",
        click: () async {
          var newTask = Task.empty();
          resetTaskEdit(load: newTask);
          setState(() {
            _selectedTasks.add(newTask);
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var currentTab = newJobTabs[tabIndex];
    return PageScaffold(
      title: currentTab.label,
      hasBackTrigger: true,
      backAction: () {
        if (tabIndex == 0) {
          return true;
        }
        setState(() {
          tabIndex--;
        });
        return false;
      },
      body: [
        ...currentTab.build(context),
        SizedBox(height: 5),
        RoundedFlatButton(
          name: currentTab.nextButton,
          click: () async {
            bool isValid = true;
            if (currentTab.validate != null) {
              isValid = currentTab.validate!();
            }
            if (!isValid) {
              setState(() {});
              return;
            }
            if (currentTab.terminal ?? false) {
              if (_selectedTasks.isEmpty) {
                // alert("Surely, you did something at this job, no? At least one task is required. If none of the suggested tasks fit, add a custom task.")
                return;
              }
              Job job;
              if (widget.job != null) {
                job = widget.job!;
              } else {
                job = Job.empty();
                job.commonRole = role;
              }
              job.name = nameController.text;
              job.employerName = employerController.text;
              job.supervisor = reportToController.text;
              job.email = jobEmailController.text;
              job.lastWage = lastWageController.text;
              job.location = locationController.text;
              job.startDate = startDate!;
              job.endDate = endDate;
              job.tasks = _selectedTasks.toList();

              await provider.editJob(job);
              setState(() {});

              Navigator.pop<bool>(context, true);
            } else {
              setState(() {
                tabIndex++;
              });
            }
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class NewJobTab {
  String label;
  String nextButton;
  List<Widget> Function(BuildContext context) build;
  bool Function()? validate;
  bool? terminal;

  NewJobTab({required this.label, required this.nextButton, required this.build, this.validate, this.terminal});
}
