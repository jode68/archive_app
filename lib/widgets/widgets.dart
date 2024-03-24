import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive_app/controllers/main_controller.dart';
import 'package:archive_app/models/archive_model.dart';
import 'package:archive_app/views/detail_page.dart';
import 'package:archive_app/views/edit_page.dart';

class ListTileData extends GetView<MainController> {
  final ArchiveModel data;
  final int index;

  const ListTileData(this.data, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: ListTile(
        leading: Checkbox(
            value: data.selected,
            onChanged: (value) {
              controller.onSelected(value, data, index);
            }),
        title: Text(data.name),
        subtitle: Text(data.date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                controller.fillTextField(data);
                Get.to(() => EditPage(index));
              },
              icon: Icon(Icons.edit, color: Colors.green.shade800),
            ),
            IconButton(
              onPressed: () {
                controller.deleteDataModel(index);
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
        onTap: () {
          Get.to(() => DetailPage(data));
        },
      ),
    );
  }
}

class TextFieldData extends StatelessWidget {
  const TextFieldData({
    super.key,
    required this.controllerText,
    required this.labelText,
    required this.errorText,
    required this.keyboardType,
    required this.textInputAction,
  });
  final TextEditingController controllerText;
  final String labelText;
  final String errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controllerText,
            validator: (value) {
              if (value == '') {
                return errorText;
              }
              return null;
            },
            autocorrect: true,
            autofocus: true,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: InputBorder.none,
              // labelText: labelText,
            ),
          ),
        ),
      ],
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
