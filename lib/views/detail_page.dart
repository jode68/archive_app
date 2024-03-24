import 'package:flutter/material.dart';
import 'package:archive_app/models/archive_model.dart';
import 'package:archive_app/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.data, {super.key});

  final ArchiveModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailDataRow(data.name),
            DetailDataRow(data.description),
            DetailDataRow(data.quantity.toString()),
            DetailDataRow(data.status ? 'Status OK' : 'Status ERROR'),
            DetailDataRow(data.selected ? 'Selected' : 'None'),
          ],
        ),
      ),
    );
  }
}
