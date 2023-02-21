// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/create_account.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca 31 de fevereiro',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'create_account': (context) => CreateAccountPage(),
        //'main': (context) => MainPage(),
      },
    ),
  );
}
