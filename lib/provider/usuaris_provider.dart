import 'package:examen_practic/model/models.dart';
import 'package:flutter/cupertino.dart';

import 'dbprovider.dart';

class UsuarisProvider extends ChangeNotifier {
  // Classe provider amb la cual agafare els valors de la base de dades i els introduirem dintre de una llista per poder visualitzarlos, es una clase provider perque quan alguna cosa canvii o poguem visualitzar.
  List<Usuari> usuaris = []; // Cream la llista.

  Future<Usuari> nouScan(String nom, String email, String address, String phone,
      String photo) async {
    // Metode el cual insertara un nou element a la base de dades y a la llista.
    final nouScan = Usuari(
        name: nom, email: email, address: address, phone: phone, photo: photo);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;

    this.usuaris.add(nouScan);
    notifyListeners();

    return nouScan;
  }

  // Carregam tots els valors de la base de dades i els introduim dintre de la llista.
  carregarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.usuaris = [...scans];
    notifyListeners();
  }

  // Metode que esborra tots els valors de la llista.
  esborraTots() async {
    final scans = await DBProvider.db.deleteAllScans();
    this.usuaris = [];
    notifyListeners();
  }

  // Metode que borra de la llista el valor a partir del seu id.
  esborraPerId(int id) async {
    final scans = await DBProvider.db.deleteScan(id);
    this.usuaris.removeAt(scans);
    notifyListeners();
  }
}
