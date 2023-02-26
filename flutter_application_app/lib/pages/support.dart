import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

campoTexto(rotulo, icone, variavel, {senha}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
    child: TextField(
      controller: variavel,
      obscureText: (senha != null) ? true : false,
      style: GoogleFonts.roboto(fontSize: 16),
      decoration: InputDecoration(
        labelText: rotulo,
        prefixIcon: Icon(icone),
        labelStyle: GoogleFonts.roboto(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

void erro(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 170, 0, 0).withOpacity(1),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 4),
    ),
  );
}

void sucesso(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 0, 114, 59).withOpacity(1),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 4),
    ),
  );
}

// Search Bar

abstract class Cores {
  static const Color corPrincipal = Color.fromARGB(255, 3, 37, 59);

  static const Color corDeFundo = Color.fromRGBO(246, 246, 246, 1);

  static const Color corDoCard = Color.fromARGB(255, 159, 181, 207);

  static const Color corDaFonteSimples = Color.fromARGB(255, 0, 0, 0);

  static const Color corDaFonteDoTitulo = Color.fromARGB(255, 255, 255, 255);

  static const Color corDoIcone = Color.fromARGB(255, 0, 0, 0);
}
