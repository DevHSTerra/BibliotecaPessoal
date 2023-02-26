// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_app/pages/about_us.dart';

import 'firebase_options.dart';
import 'pages/create_account.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';

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
      title: 'Biblioteca 31 de fevereiro',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'create_account': (context) => CreateAccountPage(),
        'main': (context) => MainPage(),
        'about_us': (context) => AboutUs(),
      },
    ),
  );
}

