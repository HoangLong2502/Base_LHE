part of base_lhe;

class SelectModel {
  String label;
  dynamic value;

  SelectModel({required this.label, required this.value});

  factory SelectModel.fromJson(Map<String, dynamic> json) => SelectModel(
        label: json['label'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};

    data['label'] = label;
    data['value'] = value;

    return data;
  }
}
