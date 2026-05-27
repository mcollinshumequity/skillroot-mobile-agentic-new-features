import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillroot/models/training.dart';
import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/widgets/element_group.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/custom_edit.dart';

import 'package:skillroot/services/provider.dart';

class EditTraining extends StatefulWidget {
  final Training? training;

  EditTraining({super.key, this.training});

  @override
  State<EditTraining> createState() => _EditTrainingState();
}

class _EditTrainingState extends State<EditTraining> {
  CustomEditController trainerController = CustomEditController(label: "Provider", errorText: "Training provider is required.");
  CustomEditController nameController = CustomEditController(label: "Name", errorText: "Training name is required.");
  CustomEditController descriptionController = CustomEditController(label: "Description", errorText: "Description is required.");
  CustomEditController hoursController = CustomEditController(
    label: "Hours",
    errorText: "Hours is not required.",
    customValidate: (v) {
      return !(v.isNotEmpty && int.tryParse(v) == null);
    },
  );

  DateTime? completionDate;
  DateTime? expirationDate;
  String? completionDateError;
  String? expirationDateError;

  @override
  void initState() {
    if (widget.training != null) {
      var job = widget.training!;
      nameController.text = job.name;
      trainerController.text = job.trainer;
      descriptionController.text = job.description;
      hoursController.text = "${job.hours ?? ''}";
      completionDate = job.completionDate;
      expirationDate = job.expirationDate;
    }
    super.initState();
  }

  bool validate() {
    bool isValid = true;
    for (var controller in [trainerController, nameController, descriptionController, hoursController]) {
      controller.allowError = true;
      bool controllerValid = controller.validate();
      isValid = isValid && controllerValid;
    }

    completionDateError = null;
    expirationDateError = null;
    if (completionDate == null) {
      completionDateError = "Completion Date is required.";
      isValid = false;
    } else if (expirationDate != null && expirationDate!.compareTo(completionDate!) < 0) {
      expirationDateError = "Expiration Date must be after Completion Date.";
      isValid = false;
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "",
      hasBackTrigger: true,
      body: [
        ElementGroup([
          GroupedElement(trainerController.text, header: "Provider", editCustom: trainerController, noTrailer: true),
          GroupedElement(nameController.text, header: "Name", editCustom: nameController, noTrailer: true),
          GroupedElement(descriptionController.text, header: "Description", editCustom: descriptionController, noTrailer: true),
          GroupedElement(hoursController.text, header: "Training Hours", editCustom: hoursController, noTrailer: true),
          GroupedElement(
            completionDate == null ? '' : DateFormat.yMd().format(completionDate!),
            header: "Completion Date",
            errorText: completionDateError,
            trailerIcon: Icons.calendar_month,
            trailerAction: () async {
              var selectedDate = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(DateTime.now().year + 1));
              if (selectedDate != null) {
                setState(() {
                  completionDate = selectedDate;
                });
              }
            },
          ),
          GroupedElement(
            expirationDate == null ? '' : DateFormat.yMd().format(expirationDate!),
            header: "Expiration Date",
            errorText: expirationDateError,
            trailerIcon: Icons.calendar_month,
            trailerAction: () async {
              var selectedDate = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(DateTime.now().year + 1));
              if (selectedDate != null) {
                setState(() {
                  expirationDate = selectedDate;
                });
              }
            },
            leader: expirationDate != null ? Icon(Icons.delete, size: 16, color: Colors.red) : null,
            leaderAction: () {
              setState(() {
                expirationDate = null;
              });
            },
          ),
        ]),
        SizedBox(height: 5),
        RoundedFlatButton(
          name: "Save",
          click: () async {
            if (!validate()) {
              setState(() {});
              return;
            }

            Training training;
            if (widget.training != null) {
              training = widget.training!;
            } else {
              training = Training.empty();
            }
            training.name = nameController.text;
            training.trainer = trainerController.text;
            training.description = descriptionController.text;
            training.hours = int.tryParse(hoursController.text);
            training.completionDate = completionDate!;
            training.expirationDate = expirationDate;

            await provider.editTraining(training);
            setState(() {});

            Navigator.pop<bool>(context, true);
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
