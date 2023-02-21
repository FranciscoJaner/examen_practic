import 'package:examen_practic/model/models.dart';
import 'package:examen_practic/provider/provider.dart';
import 'package:examen_practic/widgets/usuaris_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarisProvider = Provider.of<UsuarisProvider>(context);
    final usuariService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inici'),
      ),
      body: const UsuarisList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Insert');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
