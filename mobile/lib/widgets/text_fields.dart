import 'package:flutter/material.dart';

import '../services/theme.dart';

abstract class DecoratedTextField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardtype;
  final bool isPasswordField;
  final VoidCallback? click;
  final TextEditingController? controller;
  final bool isRequired;

  const DecoratedTextField({super.key, required this.hintText, this.controller, this.prefixIcon, this.suffixIcon, this.keyboardtype = TextInputType.text, this.isPasswordField = false, this.click, this.isRequired = false});
}

class UnderlinedTextField extends DecoratedTextField {
  const UnderlinedTextField({super.key, required super.hintText, super.controller, super.prefixIcon, super.suffixIcon, super.keyboardtype = TextInputType.text, super.isPasswordField = false, super.click, super.isRequired = false});

  @override
  State<UnderlinedTextField> createState() => _UnderlinedTextFieldState();
}

class RaisedTextField extends DecoratedTextField {
  const RaisedTextField({super.key, required super.hintText, super.controller, super.prefixIcon, super.suffixIcon, super.keyboardtype = TextInputType.text, super.isPasswordField = false, super.click, super.isRequired = false});

  @override
  State<RaisedTextField> createState() => _RaisedTextFieldState();
}

class OutlinedTextField extends DecoratedTextField {
  const OutlinedTextField({super.key, required super.hintText, super.controller, super.prefixIcon, super.suffixIcon, super.keyboardtype = TextInputType.text, super.isPasswordField = false, super.click, super.isRequired = false});

  @override
  State<OutlinedTextField> createState() => _OutlinedTextFieldState();
}

class _UnderlinedTextFieldState extends State<UnderlinedTextField> {
  late bool isHidden;
  @override
  void initState() {
    super.initState();
    isHidden = widget.isPasswordField;
    print(widget.hintText);
    print(isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color:
        //     AppTheme.isLightTheme ? HexColor("#EFF0F3") : HexColor("#292828"),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        onTap: widget.click,
        controller: widget.controller,
        obscureText: isHidden,
        obscuringCharacter: '*',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          label: widget.isRequired 
            ? RichText(
                text: TextSpan(
                  text: widget.hintText,
                  style: TextStyle(color: Color(0xffA1A1A1), fontWeight: FontWeight.bold, fontSize: 12),
                  children: [
                    TextSpan(text: ' *', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14))
                  ]
                ),
              )
            : null,
          hintStyle: TextStyle(color: Color(0xffA1A1A1), fontWeight: FontWeight.bold, fontSize: 12),
          contentPadding: const EdgeInsets.only(top: 10),
          hintText: widget.isRequired ? null : widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? (IconButton(
                  icon: widget.suffixIcon!,
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ))
              : widget.suffixIcon,
        ),
      ),
    );
  }
}

class _RaisedTextFieldState extends State<RaisedTextField> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.isLightTheme ? const Color.fromARGB(255, 223, 222, 222) : Colors.black,
            blurRadius: 7,
            // spreadRadius: 2,
            offset: Offset(5.0, 5.0),
          ),
        ],
        color: AppTheme.isLightTheme ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        onTap: widget.click,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xffA1A1A1), fontWeight: FontWeight.bold, fontSize: 12),
          contentPadding: const EdgeInsets.only(top: 10, left: 10),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? (IconButton(
                  icon: widget.suffixIcon!,
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ))
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: AppTheme.isLightTheme ? Colors.white : Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: AppTheme.isLightTheme ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        onTap: widget.click,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xffA1A1A1), fontWeight: FontWeight.bold, fontSize: 12),
          contentPadding: const EdgeInsets.only(top: 10, left: 10),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? (IconButton(
                  icon: widget.suffixIcon!,
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ))
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).dividerColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
