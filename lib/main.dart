import 'package:examen_practic/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'preferences/preferences.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuarisProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Practic',
      home: const LoginScreen(),
      routes: {
        'Login': (context) => const LoginScreen(),
        'Home': (context) => const HomeScreen(),
        'Details': (context) => const DetailScreen(),
        'Insert': (context) => const InsertScreen(),
        'Mapa': (context) => const MapaScreen()
      },
    );
  }
}
