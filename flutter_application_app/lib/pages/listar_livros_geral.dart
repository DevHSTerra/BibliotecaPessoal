// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../controller/controlador_de_livros.dart';
import '../suporte/suporte.dart';
import 'widget_mostrar_livro.dart';

class ListarLivros extends StatefulWidget {
  const ListarLivros({Key? key}) : super(key: key);

  @override
  State<ListarLivros> createState() => _ListarLivrosState();
}

class _ListarLivrosState extends State<ListarLivros> {
  var livros;

  @override
  void initState() {
    super.initState();
    livros = ControladorDeLivros().listar();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetMostrarLivroGeral(
          livros,
          Auxiliar.corDoCard,
          Icons.download_sharp,
        ),
      ],
    );
  }
}
