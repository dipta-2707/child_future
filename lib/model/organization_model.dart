import 'dart:convert';

class OrganizationModel {
  final int freeSeat;
  final String image;
  final int totalSeat;
  final String phone;
  final String name;
  final String nid;
  final String location;
  final String email;

  OrganizationModel({
    required this.freeSeat,
    required this.image,
    required this.totalSeat,
    required this.phone,
    required this.name,
    required this.nid,
    required this.location,
    required this.email,
  });

  factory OrganizationModel.fromRawJson(String str) =>
      OrganizationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
        freeSeat: json["free_seat"] ?? 0,
        image: json["image"] ?? "",
        totalSeat: json["total_seat"] ?? 0,
        phone: json["phone"] ?? "unknown",
        name: json["name"] ?? "unknown",
        nid: json["nid"] ?? "",
        location: json["location"] ?? "unknown",
        email: json["email"] ?? "unknown",
      );

  Map<String, dynamic> toJson() => {
        "free_seat": freeSeat,
        "image": image,
        "total_seat": totalSeat,
        "phone": phone,
        "name": name,
        "nid": nid,
        "location": location,
        "email": email,
      };
}
