import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:skillroot/models/job.dart';
import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/widgets/accordion.dart';
import 'package:skillroot/widgets/element_group.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/custom_edit.dart';
import 'package:skillroot/services/provider.dart';
import 'package:skillroot/pages/job/edit.dart';

class ViewJob extends StatefulWidget {
  final Job job;
  const ViewJob({super.key, required this.job});

  @override
  State<ViewJob> createState() => _ViewJobState();
}

class _ViewJobState extends State<ViewJob> {
  late CustomEditController verifyNameController = CustomEditController(label: "Contact Name", errorText: "Contact Name is required.");
  late CustomEditController verifyEmailController = CustomEditController(label: "Contact Email", errorText: "One of Email or Phone is required.", customValidate: emailPhoneValid);
  late CustomEditController verifyPhoneController = CustomEditController(label: "Contact Phone", errorText: "One of Email or Phone is required.", customValidate: emailPhoneValid);

  bool emailPhoneValid(String _) {
    return !(verifyEmailController.text.isEmpty && verifyPhoneController.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: provider.getJob(widget.job),
      builder: (BuildContext context, AsyncSnapshot<Job> snapshot) {
        Job? fullJob;
        JobVerificationStatus jobStatus = JobVerificationStatus.Unknown;
        if (snapshot.hasData) {
          fullJob = snapshot.data;
          jobStatus = fullJob!.verificationStatus;
        }
        return PageScaffold(
          header: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chevron_left),
                        Text("Job Profile — ${widget.job.name}", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  if (jobStatus == JobVerificationStatus.Unverified)
                    SizedBox(
                      width: 50,
                      child: RoundedFlatButton(
                        click: () async {
                          var deleted = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Really delete?"),
                                content: Text("Are you sure you want to delete this Job History?\n${fullJob!.name} @${fullJob.employerName}"),
                                actionsAlignment: MainAxisAlignment.spaceBetween,
                                actions: <Widget>[
                                  RoundedFlatButton(
                                    name: "Yes",
                                    isErrorState: true,
                                    width: 120,
                                    click: () {
                                      provider.deleteJob(fullJob!);
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                  RoundedFlatButton(
                                    name: "No",
                                    width: 120,
                                    click: () {
                                      Navigator.pop(context, false);
                                    },
                                  ),
                                ],
                              );
                            },
                          );

                          if (deleted ?? false) {
                            Navigator.pop(context);
                          }
                        },
                        isErrorState: true,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    )
                  else if (jobStatus == JobVerificationStatus.Pending)
                    Text("Verification Pending", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold))
                  else if (jobStatus == JobVerificationStatus.Verified)
                    Text("Employer Verified!", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
          hasBackTrigger: true,
          action: jobStatus == JobVerificationStatus.Unverified
              ? SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: RoundedFlatButton(
                          isGoodState: true,
                          click: () {
                            verifyNameController.text = fullJob!.supervisor;
                            verifyEmailController.text = '';
                            verifyPhoneController.text = '';
                            for (var controller in [verifyNameController, verifyEmailController, verifyPhoneController]) {
                              controller.allowError = false;
                            }
                            showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      constraints: BoxConstraints(maxWidth: 560, minHeight: 280),
                                      title: const Text("Verification Request"),
                                      content: SizedBox(
                                        height: 325,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            ElementGroup([
                                              GroupedElement(verifyNameController.text, header: "Employer", editCustom: verifyNameController, noTrailer: true),
                                              GroupedElement(verifyEmailController.text, header: "Job Title", editCustom: verifyEmailController, noTrailer: true),
                                              GroupedElement(verifyPhoneController.text, header: "Supervisor", editCustom: verifyPhoneController, noTrailer: true),
                                            ]),
                                            SizedBox(height: 7),
                                            Text("Once submitted you will be unable to edit this job!", textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ),
                                      actionsAlignment: MainAxisAlignment.spaceBetween,
                                      actions: <Widget>[
                                        RoundedFlatButton(
                                          name: "Submit",
                                          isErrorState: true,
                                          width: 120,
                                          click: () async {
                                            bool isValid = true;
                                            for (var controller in [verifyNameController, verifyEmailController, verifyPhoneController]) {
                                              controller.allowError = true;
                                              bool controllerValid = controller.validate();
                                              isValid = isValid && controllerValid;
                                            }

                                            if (isValid) {
                                              bool result = await provider.verifyJob(
                                                fullJob!,
                                                name: verifyNameController.text,
                                                email: verifyEmailController.text,
                                                phone: verifyPhoneController.text,
                                              );
                                              print(result);

                                              Navigator.pop(context, true);
                                            } else {
                                              setState(() {});
                                            }
                                          },
                                        ),
                                        RoundedFlatButton(
                                          name: "Cancel",
                                          width: 120,
                                          click: () {
                                            Navigator.pop(context, false);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Icon(Icons.verified, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: RoundedFlatButton(
                          click: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditJob(job: fullJob),
                              ),
                            ).then((_) {
                              setState(() {});
                            });
                          },
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              : jobStatus == JobVerificationStatus.Pending
              ? Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Icon(Icons.verified, color: Colors.white),
                      ),
                      Text("Pending", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              : null,
          body: [
            ElementGroup([
              GroupedElement(widget.job.employerName, header: "Employer", noTrailer: true),
              GroupedElement(widget.job.name, header: "Job Title", noTrailer: true),
              GroupedElement("${DateFormat.yMd().format(widget.job.startDate)} — ${widget.job.endDate == null ? 'present' : DateFormat.yMd().format(widget.job.endDate!)}", header: "Employment Dates", noTrailer: true),
              GroupedElement(fullJob?.commonRole?.industry ?? 'N/A', header: "Industry", noTrailer: true),
              GroupedElement(fullJob?.commonRole?.name ?? 'N/A', header: "Role", noTrailer: true),
            ]),
            SizedBox(height: 5),
            Accordion(
              header: "Tasks",
              body: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var allowedWidth = constraints.hasBoundedWidth ? constraints.maxWidth : 200;
                  List<Widget> widgets = [];
                  if (snapshot.hasData && snapshot.data != null && snapshot.data!.tasks.isNotEmpty) {
                    for (var task in snapshot.data!.tasks) {
                      widgets.addAll([
                        Container(
                          width: allowedWidth - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${task.name} - ${task.proficiency!.label()}", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)),
                              Text(task.description, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13)),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                      ]);
                    }
                  } else {
                    widgets.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]));
                  }
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
                },
              ),
            ),
            SizedBox(height: 5),
            ElementGroup([
              GroupedElement(widget.job.supervisor, header: "Reports To / Supervisor", noTrailer: true),
              GroupedElement(widget.job.email, header: "Job Email", noTrailer: true),
              GroupedElement(widget.job.lastWage, header: "Last Wage", noTrailer: true),
              GroupedElement(widget.job.location, header: "Location", noTrailer: true),
            ]),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
