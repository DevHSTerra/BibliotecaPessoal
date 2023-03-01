// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_app/pages/sobre_app.dart';
import 'package:flutter_application_app/autentificar/pagina_login.dart';
import 'package:flutter_application_app/pages/pagina_principal.dart';

import 'firebase_options.dart';
import 'autentificar/criar_conta.dart';


Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
*/
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Compartilhada',
      initialRoute: 'login',
      routes: {
        'login': (context) => PaginaLogin(),
        'criar_conta': (context) => CriarConta(),
        'principal': (context) => PaginaPrincipal(),
        'sobre_app': (context) => SobreApp(),
      },
    ),
  );
}

