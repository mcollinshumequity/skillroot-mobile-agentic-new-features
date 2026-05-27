import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:skillroot/models/training.dart';

import 'package:skillroot/widgets/page_scaffold.dart';
import 'package:skillroot/widgets/element_group.dart';
import 'package:skillroot/widgets/buttons.dart';

import 'package:skillroot/services/provider.dart';

import 'package:skillroot/pages/training/edit.dart';

class ViewTraining extends StatefulWidget {
  final Training training;
  const ViewTraining({super.key, required this.training});

  @override
  State<ViewTraining> createState() => _ViewTrainingState();
}

class _ViewTrainingState extends State<ViewTraining> {
  late Future<Training> _trainingFuture;

  @override
  void initState() {
    super.initState();
    _trainingFuture = provider.getTraining(widget.training);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _trainingFuture,
      builder: (BuildContext context, AsyncSnapshot<Training> snapshot) {
        Training? fullTraining;
        if (snapshot.hasData) {
          fullTraining = snapshot.data;
        }

        if (snapshot.hasError) {
          return PageScaffold(
            title: "Error",
            hasBackTrigger: true,
            body: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 60),
                    SizedBox(height: 16),
                    Text("Failed to load training details"),
                    Text(snapshot.error.toString(), style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              )
            ],
          );
        }

        final trainingExpired = (fullTraining?.expirationDate ?? widget.training.expirationDate) != null && (fullTraining?.expirationDate ?? widget.training.expirationDate)!.isBefore(DateTime.now());

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
                        Text("Training Profile — ${widget.training.name}", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  if (fullTraining != null)
                    SizedBox(
                      width: 50,
                      child: RoundedFlatButton(
                        click: () async {
                          var deleted = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Really delete?"),
                                content: Text("Are you sure you want to delete this Training History?\n${fullTraining!.name}"),
                                actionsAlignment: MainAxisAlignment.spaceBetween,
                                actions: <Widget>[
                                  RoundedFlatButton(
                                    name: "Yes",
                                    isErrorState: true,
                                    width: 120,
                                    click: () {
                                      provider.deleteTraining(fullTraining!);
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
                    ),
                ],
              ),
            ),
          ],
          hasBackTrigger: true,
          action: fullTraining != null
              ? SizedBox(
                  width: 50,
                  child: RoundedFlatButton(
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditTraining(training: fullTraining),
                        ),
                      );
                    },
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                )
              : null,
          body: [
            ElementGroup([
              GroupedElement(widget.training.name, header: "Name", noTrailer: true),
              GroupedElement(widget.training.description, header: "Description", noTrailer: true),
              GroupedElement(widget.training.trainer, header: "Trainer", noTrailer: true),
              GroupedElement("${DateFormat.yMd().format(widget.training.completionDate)}", header: "Completion", noTrailer: true),
              if (widget.training.expirationDate != null)
                GroupedElement("${DateFormat.yMd().format(widget.training.expirationDate!)}", header: "${trainingExpired ? "Expired" : "Expires"}", noTrailer: true)
              else
                GroupedElement(
                  "No Expiration",
                  header: "Expires",
                  noTrailer: true,
                ),
              if ((widget.training.hours ?? 0) > 0) GroupedElement("${widget.training.hours} hours", header: "Hours", noTrailer: true),
            ]),
            if (!snapshot.hasData)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(child: CircularProgressIndicator()),
              ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
