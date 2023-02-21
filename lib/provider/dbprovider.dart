import 'dart:io';

import 'package:examen_practic/model/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  // Classe que empleam per crear la base de dades i realitzar diferents operacions.
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    // Metode singletone per generar la base de dades.
    if (_database == null) _database = await initDB();

    return _database!;
  }

  // Metode amb el cual cream i inicialitzam la nostra base de dades.
  Future<Database> initDB() async {
    // Obtenir el path per avon cream la nostra base de dades
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Usuaris.db');

    // Creació de la nostra base de dades.
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Usuaris(
          id INTEGER PRIMARY KEY , 
          name TEXT, 
          email TEXT,
          address TEXT,
          phone TEXT,
          photo TEXT
        )
      ''');
      },
    );
  }

  // Metodoe a partir de tres variables asignam al valor amb un insertRaw.
  Future<int> insertRawScan(Usuari usuari) async {
    final id = usuari.id;
    final nom = usuari.name;
    final email = usuari.email;
    final phone = usuari.phone;
    final img = usuari.photo;

    final db = await database;

    final res = await db.rawInsert('''
        INSERT INTO Usuaris(id,name,email,address, phone,photo)
        VALUES ($id,$nom,$email,$phone,$img)
      ''');
    return res;
  }

  // Metode que gracis a la clase model que hem fet anteriorment amb al toMap li pasam directe els valors que tenim.
  Future<int> insertScan(Usuari usuari) async {
    final db = await database;
    final res = await db.insert('Usuaris', usuari.toMap());
    return res;
  }

  Future<List<Usuari>> getAllScans() async {
    final db = await database;
    final res = await db.query('Usuaris');
    return res.isNotEmpty ? res.map((e) => Usuari.fromMap(e)).toList() : [];
  }

// Metode amb el qual borram de la base de dades un valor a partir del seu id.
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Usuaris', where: 'id = ?', whereArgs: [id]);
    return res;
  }

// Metode amb el qual borram de la base de dades tots els valors.
  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete('''DELETE FROM Usuaris''');

    return res;
  }
}
