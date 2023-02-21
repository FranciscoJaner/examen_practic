import 'package:examen_practic/model/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Clase que ens mostra en detall un Usuari hem el format que te aquesta pagina.
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Usuari usuari = ModalRoute.of(context)?.settings.arguments as Usuari;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              usuari.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: Image.network(usuari.photo),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'email: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  usuari.email,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Telefon: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  usuari.phone,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Adreça: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  usuari.address,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
