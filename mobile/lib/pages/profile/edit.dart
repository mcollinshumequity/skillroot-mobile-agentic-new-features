import 'package:flutter/material.dart';
import 'package:skillroot/models/user.dart';

import 'package:skillroot/services/provider.dart';

import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/custom_edit.dart';
import 'package:skillroot/widgets/element_group.dart';

class EditProfile extends StatefulWidget {
  final User user;

  EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  CustomEditController firstNameController = CustomEditController(label: "First Name", errorText: "First Name is required.", isRequired: true);
  CustomEditController lastNameController = CustomEditController(label: "Last Name", errorText: "Last Name is required.", isRequired: true);
  late CustomEditController emailController = CustomEditController(label: "Email", errorText: "Either email or phone number is required.", customValidate: validateCommunicationMethod, isRequired: true);
  late CustomEditController phoneController = CustomEditController(label: "Phone Number", errorText: "Either email or phone number is required.", customValidate: validateCommunicationMethod, isRequired: true);

  TextEditingController interestController = TextEditingController();

  String? errorMessage;

  late List<String> interests;
  int? editingInterest;

  @override
  void initState() {
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    emailController.text = widget.user.email ?? '';
    phoneController.text = widget.user.phone ?? '';

    interests = [...widget.user.interests];

    super.initState();
  }

  bool validate() {
    bool isValid = true;
    for (var controller in [firstNameController, lastNameController, emailController, phoneController]) {
      controller.allowError = true;
      bool controllerValid = controller.validate();
      isValid = isValid && controllerValid;
    }

    return isValid;
  }

  bool validateCommunicationMethod(String _) {
    return emailController.text.isNotEmpty || phoneController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PageScaffold(
      title: "Edit Profile",
      hasBackTrigger: true,
      body: [
        ElementGroup([
          GroupedElement(firstNameController.text, editCustom: firstNameController, noTrailer: true),
          GroupedElement(lastNameController.text, editCustom: lastNameController, noTrailer: true),
          GroupedElement(emailController.text, editCustom: emailController, noTrailer: true),
          GroupedElement(phoneController.text, editCustom: phoneController, noTrailer: true),
        ]),
        SizedBox(height: 5),
        Text(
          "Interests",
          style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: Color(0xff1f2a3d)),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var allowedWidth = constraints.hasBoundedWidth ? constraints.maxWidth : 200;
            List<Widget> widgets = [];
            for (var interest in interests) {
              bool isEditing = editingInterest != null && interest == interests[editingInterest!];
              widgets.add(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isEditing) {
                            if (interestController.text != "") {
                              interests[editingInterest!] = interestController.text;
                            }
                            editingInterest = null;
                          } else {
                            interestController.text = interest;
                            editingInterest = interests.indexOf(interest);
                          }
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: isEditing ? Colors.green : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Icon(isEditing ? Icons.check : Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: allowedWidth - 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isEditing) ...[
                            TextField(controller: interestController),
                          ] else ...[
                            Text(interest, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isEditing) {
                            if (interests[editingInterest!] == "") {
                              interests.remove("");
                            }
                          } else {
                            interests.remove(interest);
                          }
                          editingInterest = null;
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Icon(isEditing ? Icons.cancel : Icons.delete, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
              widgets.add(SizedBox(height: 5));
            }
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
          },
        ),
        RoundedFlatButton(
          name: "Add Interest",
          click: () async {
            if (editingInterest != null) {
              return;
            }
            setState(() {
              interestController.text = "";
              editingInterest = interests.length;
              interests.add("");
            });
          },
        ),
        SizedBox(height: 32),
        RoundedFlatButton(
          name: errorMessage ?? "Save Profile",
          isErrorState: errorMessage != null,
          click: () async {
            if (!validate()) {
              setState(() {});
              return;
            }

            widget.user.firstName = firstNameController.text;
            widget.user.lastName = lastNameController.text;
            widget.user.email = emailController.text.isNotEmpty ? emailController.text : null;
            widget.user.phone = phoneController.text.isNotEmpty ? phoneController.text : null;
            widget.user.interests = [...interests];

            var saveResult = await provider.saveUser(widget.user);
            setState(() {
              if (saveResult == null) {
                errorMessage = null;
                Navigator.pop(context);
              } else {
                errorMessage = saveResult["message"];
              }
            });
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
