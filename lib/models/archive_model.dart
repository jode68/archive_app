class ArchiveModel {
  final String name;
  final String description;
  final int quantity;
  final String date;
  bool status = false;
  bool selected = false;

  ArchiveModel({
    required this.name,
    required this.description,
    required this.quantity,
    required this.date,
    required this.status,
    required this.selected,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'date': date,
      'status': status,
      'selected': selected,
    };
  }

  factory ArchiveModel.fromJson(Map<String, dynamic> map) {
    return ArchiveModel(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      date: map['date'] as String,
      status: map['status'] as bool,
      selected: map['selected'] as bool,
    );
  }
}
