import 'package:archive_app/models/archive_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class DetailDataRow extends StatelessWidget {
  const DetailDataRow(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: context.height / 12,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(data, style: textStyle),
      ),
    );
  }
}
