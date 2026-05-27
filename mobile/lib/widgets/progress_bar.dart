import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final double progress;
  ProgressBar({super.key, required this.progress});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = 30;
        if (constraints.hasBoundedWidth) {
          width = constraints.maxWidth;
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          height: 8,
          width: width,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(4))),
                height: 8,
                width: widget.progress * width,
              ),
            ],
          ),
        );
      },
    );
  }
}
