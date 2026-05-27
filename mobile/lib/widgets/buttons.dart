// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RoundedFlatButton extends StatelessWidget {
  final String? name;
  final bool isErrorState;
  final bool isGoodState;
  final Color? customColor;
  final VoidCallback click;
  final Widget? child;
  final double? width;
  final bool isLoading;

  const RoundedFlatButton({super.key, this.name, this.child, required this.click, this.isErrorState = false, this.isGoodState = false, this.customColor, this.width, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : click,
      child: Container(
        height: 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: (isErrorState && !isLoading) ? Colors.red : (isGoodState ? Colors.green : (isLoading ? (customColor ?? Theme.of(context).primaryColor).withOpacity(0.7) : (customColor ?? Theme.of(context).primaryColor))),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : (child ??
                  (name != null
                      ? Text(
                          name!,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      : Icon(Icons.more))),
        ),
      ),
    );
  }
}
