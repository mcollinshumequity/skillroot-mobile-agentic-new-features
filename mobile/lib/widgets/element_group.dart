import 'package:flutter/material.dart';
import 'package:skillroot/widgets/custom_edit.dart';
import 'package:skillroot/services/theme.dart';

class ElementGroup extends StatelessWidget {
  final List<ElementGroupElement> elements;
  final IconData? leader;

  ElementGroup(this.elements) : leader = null;
  ElementGroup.single(ElementGroupElement element, {this.leader}) : elements = [element];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    bool showDivider = true;
    for (var element in elements) {
      if (children.isNotEmpty) {
        children.addAll([
          SizedBox(height: 10),
          if (showDivider) ...[
            Divider(color: AppTheme.isLightTheme ? Color(0xffCCCCCC) : Color(0xff4C4C4C)),
            SizedBox(height: 10),
          ],
        ]);
      }
      showDivider = !element.includesDivider;
      children.add(element.build(context));
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        var availableWidth = leader == null ? constraints.maxWidth : constraints.maxWidth - 60;
        Container group = Container(
          width: availableWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: children),
          ),
        );
        if (leader == null) {
          return group;
        }

        return Row(
          children: [
            Icon(leader, size: 40),
            SizedBox(width: 20),
            group,
          ],
        );
      },
    );
  }
}

abstract class ElementGroupElement {
  bool includesDivider = false;
  Widget build(BuildContext context);
}

class GroupedElement extends ElementGroupElement {
  final String? value;
  final String? header;
  final String? errorText;
  final String? leaderAsset;
  final Widget? leader;
  final IconData? leaderIcon;
  final String? trailerAsset;
  final IconData? trailerIcon;
  final bool noTrailer;
  final void Function()? trailerAction;
  final void Function()? leaderAction;
  TextEditingController? editController;
  CustomEditController? editCustom;

  GroupedElement(String _value, {this.leader, this.leaderAsset, this.leaderIcon, this.header, this.errorText, this.trailerAsset, this.trailerIcon, this.trailerAction, this.leaderAction, this.noTrailer = false, this.editController, this.editCustom}) : value = _value {
    includesDivider = editController != null || editCustom != null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = (constraints.hasBoundedWidth ? constraints.maxWidth : 100);
        if (leaderAsset != null || leaderIcon != null) {
          width -= 50;
        }
        if (!noTrailer) {
          width -= 30;
        }

        bool hasLeader = leader != null || leaderAsset != null || leaderIcon != null;
        return Row(
          children: [
            if (hasLeader) ...[
              GestureDetector(
                onTap: leaderAction,
                child: leader ?? (leaderAsset != null ? Image.asset(leaderAsset!, height: 40) : Icon(leaderIcon, size: 40)),
              ),
              SizedBox(width: 10),
            ],
            if (leaderAsset != null || leaderIcon != null) SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (editController == null && editCustom == null) ...[
                  if (header != null && editController == null) ...[
                    Text(header!, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 10, color: errorText == null ? Theme.of(context).disabledColor : Colors.red)),
                    SizedBox(height: 2),
                  ],
                  Text(
                    value!,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: errorText == null ? null : Colors.red),
                  ),
                  if (errorText != null) Text(errorText!, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 12, color: Colors.red)) else SizedBox(height: 14),
                ] else
                  SizedBox(
                    width: width,
                    height: 70,
                    child: editCustom == null
                        ? TextField(
                            controller: editController,
                            decoration: InputDecoration(
                              label: header != null ? Text(header!) : null,
                            ),
                            onChanged: (_) {},
                          )
                        : editCustom!.build(context),
                  ),
              ],
            ),
            if (!noTrailer) ...[
              Spacer(),
              GestureDetector(
                onTap: trailerAction,
                onLongPress: leaderAction,
                child: Column(
                  children: [
                    if (trailerAsset != null) Image.asset(trailerAsset!, height: 15),
                    if (trailerIcon != null) Icon(trailerIcon!, size: 15),
                    if (trailerAsset == null && trailerIcon == null) Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class CustomGroupedElement extends ElementGroupElement {
  final Widget content;
  CustomGroupedElement(this.content);

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
