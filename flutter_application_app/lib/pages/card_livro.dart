// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';

import '../suporte/suporte.dart';

class CardLivros extends StatefulWidget {
  final livro;

  const CardLivros(this.livro, {Key? key}) : super(key: key);

  @override
  State<CardLivros> createState() => _CardLivrosState();
}

class _CardLivrosState extends State<CardLivros> {
    dynamic livroDados = widget.livro.data();
    String autor = livroDados['autor'];
    String titulo = livroDados['titulo'];
    String livroId = widget.livro.reference.id;

    Widget build(BuildContext context) {
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
                    // ignore: prefer_const_constructors
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
    }
}
