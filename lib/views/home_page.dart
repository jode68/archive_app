import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive_app/controllers/main_controller.dart';
import 'package:archive_app/widgets/widgets.dart';
import 'package:archive_app/views/add_page.dart';

class HomePage extends GetView<MainController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddPage());
            controller.clearTextField();
          },
          child: const Icon(Icons.add_rounded, size: 40),
        ),
        body: ListView.builder(
          itemCount: controller.listArchive.length,
          itemBuilder: (context, index) {
            final data = controller.listArchive[index];
            return ListTileData(data, index);
          },
        ),
      );
    });
  }
}
