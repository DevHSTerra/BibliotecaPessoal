import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.redAccent.withOpacity(0.4),
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
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 4),
    ),
  );
}

/*
void cores() {
  var corPrincipal = const Color.fromARGB(255, 35, 2, 56);
  var corDeFundo = const Color.fromARGB(255, 228, 228, 228);
  var corDoCard = const Color.fromARGB(255, 227, 206, 240);
  var corDaFonte = const Color.fromARGB(255, 0, 0, 0);
}
*/
