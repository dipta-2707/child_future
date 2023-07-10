import 'dart:convert';

class VictimModel {
  final String image;
  final bool isReceive;
  final String address;
  final String name;
  final String submittedBy;

  VictimModel(
      {required this.image,
      required this.isReceive,
      required this.address,
      required this.name,
      required this.submittedBy});

  factory VictimModel.fromRawJson(String str) =>
      VictimModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VictimModel.fromJson(Map<String, dynamic> json) => VictimModel(
        image: json["image"] ?? "",
        isReceive: json["is_receive"] ?? false,
        address: json["address"] ?? "unknown",
        name: json["name"] ?? "unknown",
        submittedBy: json["submitted_by"] ?? "unknown",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "is_receive": isReceive,
        "address": address,
        "name": name,
        "submitted_by": submittedBy
      };
}
