// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var corPrincial = Color.fromARGB(255, 35, 2, 56);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      color: corPrincial,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'O propósito do software Biblioteca 31 de fevereiro',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              'O software Biblioteca 31 de fevereiro tem como função o compartilhamento da biblioteca virtual que o usuário tem em posse, sendo necessário somente o login do usuário, para que seja possivel ter controle do fluxo de usuário no Banco de dados.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            Text(
              'Seu objetivo é a democratização do acesso aos livros, como também estimular a leitura.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            TextButton(
              child: Text(
                "Retornar",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: corPrincial,
                ),
              ),
              onPressed: () => {Navigator.pop(context)},
            ),
          ],
        ),
      ),
    ));
  }
}
