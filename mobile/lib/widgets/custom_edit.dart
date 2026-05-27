import 'package:flutter/material.dart';

class CustomEditController {
  final TextEditingController controller = TextEditingController();
  String get text {
    return controller.text;
  }

  set text(String val) {
    controller.text = val;
  }

  bool allowError = false;
  bool isValid = true;

  final String label;
  final String errorText;
  final bool Function(String value)? customValidate;
  final bool isRequired;

  CustomEditController({required this.label, required this.errorText, this.customValidate, this.isRequired = false});

  bool validate() {
    if (customValidate != null) {
      isValid = customValidate!(text);
    } else {
      isValid = text.isNotEmpty;
    }

    return isValid;
  }

  bool allowCheck = false;

  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: isRequired 
          ? RichText(
              text: TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor),
                children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14))
                ]
              ),
            )
          : Text(label),
        errorText: (allowError && !isValid) ? errorText : null,
      ),
    );
  }
}
