// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_app/controller/controlador_de_livros.dart';
import 'package:flutter_application_app/pages/widget_mostrar_livro.dart';

class PaginaLivroGeral extends StatefulWidget {
  const PaginaLivroGeral({Key? key}) : super(key: key);

  @override
  State<PaginaLivroGeral> createState() => _PaginaLivroGeralState();
}

class _PaginaLivroGeralState extends State<PaginaLivroGeral> {
  var livros;
  var favoritos;

  @override
  void initState() {
    super.initState();
    livros = ControladorDeLivros().listar();
    favoritos = ControladorDeLivros().iconeFavorito();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,
      child: FutureBuilder<List>(
        future: favoritos,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return CircularProgressIndicator();

            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return WidgetMostrarLivro(
                livros,
                snapshot.requireData,
              );
            case ConnectionState.none:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
