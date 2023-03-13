// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_app/pages/card_livro.dart';
import '../suporte/suporte.dart';

class WidgetMostrarLivro extends StatefulWidget {
  final livros;
  final List favoritos;

  const WidgetMostrarLivro(this.livros, this.favoritos, {Key? key})
      : super(key: key);

  @override
  State<WidgetMostrarLivro> createState() => _WidgetMostrarLivroState();
}

class _WidgetMostrarLivroState extends State<WidgetMostrarLivro> {
  List<String> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _favoritos = widget.favoritos.toList().cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Auxiliar.corDeFundo,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: widget.livros.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Não foi possível conectar.'),
              );
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              final dados = snapshot.requireData;
              if (dados.size > 0) {
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) => CardLivros(dados.docs[index]),
                );
              } else {
                return Center(
                  child: Text('Nenhuma livro encontrado.'),
                );
              }
          }
        },
      ),
    );
  }
}
