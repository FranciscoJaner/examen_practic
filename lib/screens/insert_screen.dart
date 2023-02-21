import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class InsertScreen extends StatelessWidget {
  const InsertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nom = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController photo = TextEditingController();

    final usuarisProvider = Provider.of<UsuarisProvider>(context);
    final usuarisService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: nom,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: email,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: address,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Adreça',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: phone,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Telefon',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              width: 350,
              child: GestureDetector(
                child: TextFormField(
                  controller: photo,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'Imatge',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('Mapa', arguments: address.text);
                },
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                usuarisProvider.nouScan(
                    nom.text, email.text, address.text, phone.text, photo.text);
                usuarisService.createUser(
                    nom.text, email.text, address.text, phone.text, photo.text);
                Navigator.pop(context);
              },
              child: const Text('Insertar'),
            )
          ],
        ),
      ),
    );
  }
}
