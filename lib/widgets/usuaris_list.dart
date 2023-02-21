import 'package:examen_practic/model/usuari_model.dart';
import 'package:examen_practic/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Clase que retonra un builder de la cuantitat de elements que tengem dins la llista del provider.
class UsuarisList extends StatelessWidget {
  const UsuarisList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarisProvider = Provider.of<UsuarisProvider>(context);
    final usuaris = usuarisProvider.usuaris;
    final usersService = Provider.of<UserService>(context);

    return ListView.builder(
      itemCount: usuaris.length,
      itemBuilder: ((_, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.delete_forever),
                ),
              ),
            ),
            onDismissed: (DismissDirection direccio) {
              Provider.of<UsuarisProvider>(context, listen: false)
                  .esborraPerId(usuaris[index].id!);
              Provider.of<UserService>(context, listen: false)
                  .deleteUser(usersService.users[index].id!);
            },
            child: GestureDetector(
              child: ListTile(
                title: Text(usuaris[index].name),
                trailing: Text(usuaris[index].email),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('Details', arguments: usuaris[index]);
              },
            ),
          )),
    );
  }
}
