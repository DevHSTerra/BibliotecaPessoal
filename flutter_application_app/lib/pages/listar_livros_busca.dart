// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../controller/Controlador_de_livros.dart';
import 'suporte.dart';
import 'widget_mostrar_livro_geral.dart';

class ListarLivrosBusca extends StatefulWidget {
  const ListarLivrosBusca({Key? key}) : super(key: key);

  @override
  State<ListarLivrosBusca> createState() => _ListarLivrosBuscaState();
}

class _ListarLivrosBuscaState extends State<ListarLivrosBusca> {
  var livros;

  @override
  void initState() {
    super.initState();
    //livros = ControladorDeLivros().retornarBusca();
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
