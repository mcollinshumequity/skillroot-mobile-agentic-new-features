import 'package:flutter/material.dart';

class PageScaffold extends StatefulWidget {
  final List<Widget>? header;
  final String? title;
  final List<Widget> body;
  final bool hasBackTrigger;
  final bool useGrid;
  final int gridSize;
  final bool Function()? backAction;
  final Widget? action;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  PageScaffold({
    super.key,
    this.header,
    this.title,
    required this.body,
    this.hasBackTrigger = false,
    this.backAction,
    this.action,
    this.useGrid = false,
    this.gridSize = 2,
    this.drawer,
    this.scaffoldKey,
  });

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget header;
    if (widget.header != null) {
      header = Row(children: widget.header!);
    } else {
      Widget headerText = Text(widget.title ?? "N/A", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold));
      if (widget.hasBackTrigger) {
        header = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.backAction == null || widget.backAction!()) {
              Navigator.pop(context);
            }
          },
          child: Row(children: [Icon(Icons.chevron_left), headerText]),
        );
      } else {
        header = headerText;
      }
    }

    return Scaffold(
      key: widget.scaffoldKey,
      drawer: widget.drawer,
      floatingActionButton: widget.action,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            header,
            SizedBox(height: 20),
            Expanded(
              child: widget.useGrid
                  ? GridView.count(
                      crossAxisCount: widget.gridSize,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      //padding: EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      childAspectRatio: 1.33,
                      children: widget.body,
                    )
                  : ListView(
                      shrinkWrap: true,
                      //padding: EdgeInsets.zero,
                      children: [
                        ...widget.body,
                        SizedBox(height: 75),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
