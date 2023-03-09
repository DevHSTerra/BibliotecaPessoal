// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controlador_de_livros.dart';
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
                  itemBuilder: (context, index) {
                    dynamic livroDados = dados.docs[index].data();
                    String autor = livroDados['autor'];
                    String titulo = livroDados['titulo'];
                    String livroId = dados.docs[index].reference.id;

                    return Card(
                      color: Auxiliar.corDoCard,
                      child: ListTile(
                          title: Text(autor,
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            titulo,
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Auxiliar.corDaFonteSimples),
                          ),
                          trailing:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            //Favoritos
                            IconButton(
                                icon: Icon(
                                  widget.favoritos.contains(livroId)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 20,
                                  color: Auxiliar.corDoIcone,
                                ),
                                onPressed: () async {
                                  if (snapshot.hasData) {
                                    ControladorDeLivros()
                                        .livroFavorito(livroId);
                                    setState(() {
                                      if (widget.favoritos.contains(livroId)) {
                                        widget.favoritos.remove(livroId);
                                      } else {
                                        widget.favoritos.add(livroId);
                                      }
                                    });
                                  }
                                }),
                            // Livros Lidos
                            IconButton(
                                icon: Icon(
                                  widget.favoritos.contains(livroId)
                                      ? Icons.menu_book
                                      : Icons.book,
                                  size: 20,
                                  color: Auxiliar.corDoIcone,
                                ),
                                onPressed: () async {}),
                            IconButton(
                              icon: Icon(
                                Icons.download,
                                size: 20,
                                color: Auxiliar.corDoIcone,
                              ),
                              onPressed: () async {
                                //final String path = await getApplicationDocumentsDirectory().path;
                                final taskId = await FlutterDownloader.enqueue(
                                  url: livroDados['LinkDownload'],
                                  savedDir: '/storage/emulated/0/Download',
                                  showNotification:
                                      true, // show download progress in status bar (for Android)
                                  openFileFromNotification:
                                      true, // click on notification to open downloaded file (for Android)
                                );
                              },
                            ),
                          ])),
                    );
                  },
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
