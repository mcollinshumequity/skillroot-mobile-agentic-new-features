import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';

class Accordion extends StatefulWidget {
  final String header;
  final Widget body;
  final bool startExpanded;
  Accordion({super.key, required this.header, required this.body, this.startExpanded = false});

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> with TickerProviderStateMixin {
  late bool expanded;

  late final AnimationController _sizeController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _sizeAnimation = CurvedAnimation(
    parent: _sizeController,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController _spinController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
    value: 0,
    lowerBound: 0,
    upperBound: 1.5,
  );
  late final Animation<double> _spinAnimation = Tween<double>(begin: 0, end: 0.5).animate(
    CurvedAnimation(
      parent: _sizeController,
      curve: Curves.fastOutSlowIn,
    ),
  );

  @override
  void initState() {
    expanded = widget.startExpanded;
    super.initState();

    if (expanded) {
      _sizeController.forward();
      _spinController.forward();
    }
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
                if (expanded) {
                  _sizeController.forward();
                  _spinController.forward();
                } else {
                  _sizeController.reverse();
                  _spinController.reverse();
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      firstCurve: Curves.linear,
                      secondCurve: Curves.linear,
                      alignment: AlignmentGeometry.topLeft,
                      firstChild: Text(widget.header, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                      secondChild: Text(
                        widget.header,
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).disabledColor),
                      ),
                    ),
                    RotationTransition(
                      turns: _spinAnimation,
                      child: Icon(Icons.expand_more),
                    ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _sizeAnimation,
              axis: Axis.vertical,
              axisAlignment: -1,
              child: Divider(color: AppTheme.isLightTheme ? Color(0xffCCCCCC) : Color(0xff4C4C4C)),
            ),
            SizeTransition(
              sizeFactor: _sizeAnimation,
              axis: Axis.vertical,
              axisAlignment: -1,
              child: Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10), child: widget.body),
            ),
          ],
        ),
      ),
    );
  }
}
