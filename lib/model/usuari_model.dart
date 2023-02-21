// Model de usuaris

import 'dart:convert';

class Usuari {
  Usuari({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo,
  });

  int? id;
  String name;
  String email;
  String address;
  String phone;
  String photo;

  factory Usuari.fromJson(String str) => Usuari.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuari.fromMap(Map<String, dynamic> json) => Usuari(
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "photo": photo,
      };
}
