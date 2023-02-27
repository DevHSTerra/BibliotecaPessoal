// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../controller/Controlador_de_livros.dart';
import 'suporte.dart';
import 'widget_mostrar_livro_geral.dart';

class ListarLivrosGeral extends StatefulWidget {
  const ListarLivrosGeral({Key? key}) : super(key: key);

  @override
  State<ListarLivrosGeral> createState() => _ListarLivrosGeralState();
}

class _ListarLivrosGeralState extends State<ListarLivrosGeral> {
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
