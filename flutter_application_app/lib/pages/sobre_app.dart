// ignore: prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_app/controller/controlador_de_login.dart';

import '../suporte/suporte.dart';

class SobreApp extends StatefulWidget {
  const SobreApp({Key? key}) : super(key: key);

  @override
  State<SobreApp> createState() => _SobreAppState();
}

class _SobreAppState extends State<SobreApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Auxiliar.corPrincipal,
          centerTitle: true,
          title: Text(
            Auxiliar.nomeAplicativo,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                iconSize: 24,
                icon: const Icon(Icons.logout),
                onPressed: () {
                  ControladorDeLogin().logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      Auxiliar.tituloSobreApp,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Auxiliar.corDaFonteSimples),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      Auxiliar.primeiroParagrafo,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Auxiliar.corDaFonteSimples),
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      Auxiliar.segundoParagrafo,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Auxiliar.corDaFonteSimples),
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
