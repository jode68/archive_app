import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive_app/controllers/main_controller.dart';
import 'package:archive_app/widgets/widgets.dart';

class EditPage extends GetView<MainController> {
  const EditPage(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Edit Data for Archive',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextFieldData(
                  controllerText: controller.controllerName,
                  labelText: 'Name',
                  errorText: 'Not empty field ...',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                TextFieldData(
                  controllerText: controller.controllerDescription,
                  labelText: 'Description',
                  errorText: 'Not empty field ...',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                TextFieldData(
                  controllerText: controller.controllerQuantity,
                  labelText: 'Quantity',
                  errorText: 'Not empty field ...',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                ),
                Obx(() {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Switch(
                          value: controller.dataStatus.value,
                          onChanged: (value) {
                            controller.onStatus(value);
                          },
                        ),
                        const Text(
                          'Article is Testing and Ok.',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.editDataModel(index);
                          Get.back();
                        }
                      },
                      child: const Text('UpDate'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
