import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:archive_app/models/archive_model.dart';

class DataController extends GetxController {
  // Set private listArchive
  final _listArchive = <ArchiveModel>[].obs;

  // Get public listArchive
  List<ArchiveModel> get listArchive => _listArchive;

  // Set Date Today
  final dateToday = DateFormat('dd-MM-yyyy').format(DateTime.now());
}

class SelectedController extends DataController {
  // Function for check selected
  void onSelected(bool? value, ArchiveModel data, int index) {
    if (value!) {
      data.selected = value;
      listArchive[index] = data;
    } else {
      data.selected = value;
      listArchive[index] = data;
    }
  }

  // Set data status
  var dataStatus = false.obs;

  // Function for Status
  void onStatus(bool? value) {
    if (value!) {
      dataStatus.value = value;
    } else {
      dataStatus.value = value;
    }
  }
}

class TextFieldController extends SelectedController {
  // Controller for TextField input
  final controllerName = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerQuantity = TextEditingController();

  // Function for clear TextField Add Data
  void clearTextField() {
    controllerName.clear();
    controllerDescription.clear();
    controllerQuantity.clear();
    dataStatus.value = false;
  }

  // Function for fill TextField Edit Data
  void fillTextField(ArchiveModel data) {
    controllerName.text = data.name;
    controllerDescription.text = data.description;
    controllerQuantity.text = data.quantity.toString();
    dataStatus.value = data.status;
  }
}

class DataBaseModel extends TextFieldController {
  // Set SetStorage and defaul Name DB
  final storageNote = GetStorage();
  final storageName = 'listArchive';

  void initStorageModel() async {
    await GetStorage.init();
    loadStorageModel();
  }

  void saveStorageModel() async {
    await storageNote.write(storageName, _listArchive.toJson());
  }

  void loadStorageModel() async {
    if (storageNote.hasData(storageName)) {
      var data = storageNote.read(storageName) as List;
      _listArchive.value = data.map((e) => ArchiveModel.fromJson(e)).toList();
    } else {
      _listArchive.clear();
    }
  }

  void clearStorageNote() async {
    await storageNote.remove(storageName);
    await storageNote.erase();
  }
}

class ModelController extends DataBaseModel {
  // Add data to listArchive
  void addDataModel() {
    final data = ArchiveModel(
      name: controllerName.text.trim(),
      description: controllerDescription.text.trim(),
      quantity: int.parse(controllerQuantity.text.isNumericOnly ? controllerQuantity.text.trim() : '0'),
      date: dateToday,
      status: dataStatus.value,
      selected: false,
    );
    listArchive.add(data);
    saveStorageModel();
  }

  // Edit data in listArchive
  void editDataModel(int index) {
    final data = ArchiveModel(
      name: controllerName.text.trim(),
      description: controllerDescription.text.trim(),
      quantity: int.parse(controllerQuantity.text.isNumericOnly ? controllerQuantity.text.trim() : '0'),
      date: dateToday,
      status: dataStatus.value,
      selected: false,
    );
    listArchive[index] = data;
    saveStorageModel();
  }

  // Delete data in ListArchive
  void deleteDataModel(int index) {
    Get.defaultDialog(
      title: 'Delete Article',
      middleText: 'Confirm delete this article ?',
      confirm: ElevatedButton(
        onPressed: () {
          listArchive.removeAt(index);
          saveStorageModel();
          Get.back();
        },
        child: const Text('Ok'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
    );
  }
}

class MainController extends ModelController {
  // Main init setting controller
  @override
  void onInit() {
    initStorageModel();
    super.onInit();
  }
}
