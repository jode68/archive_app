import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive_app/controllers/main_controller.dart';
import 'package:archive_app/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}
