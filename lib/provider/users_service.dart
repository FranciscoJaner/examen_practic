import 'dart:convert';

import 'package:examen_practic/model/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class UserService extends ChangeNotifier {
  final String _baseUrl =
      "examenpmm2223-default-rtdb.europe-west1.firebasedatabase.app";
  List<Usuari> users = [];

  UserService() {
    loadUsers();
  }

  loadUsers() async {
    users.clear();
    final url = Uri.https(_baseUrl, 'users.json'); // Obtenemos la url
    final response = await https
        .get(url); // Obtenemos los datos en este caso sera un get de la url.
    final Map<String, dynamic> usersMap = json.decode(response
        .body); // Creamos un mapa y hacemos un decode del json que nos devuelve la resonse.

    usersMap.forEach((key, value) {
      final auxUser = Usuari.fromMap(value);
      auxUser.id = key as int?;
      users.add(auxUser);
    });

    notifyListeners();
  }

// Funcion que crea un usuario pasandole los parametros
  createUser(String nom, String email, String telefon, String adreca,
      String imatge) async {
    Usuari nou = Usuari(
        name: nom,
        email: email,
        address: adreca,
        phone: telefon,
        photo: imatge);
    final url = Uri.https(_baseUrl, 'users.json');
    final response = await https.post(url, body: nou.toJson());
    final decodedData = response.body;
    print(response);
  }

//Funcion que borra un usuario, le pasamos por parametro el id del usuario que queremos borrar.
  deleteUser(int id) async {
    final url = Uri.https(_baseUrl, 'users/${id}.json');
    final response = await https.delete(url);
    loadUsers();
  }
}
