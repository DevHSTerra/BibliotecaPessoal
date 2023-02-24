// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/books_controller.dart';
import 'support.dart';

class BookShowWidget extends StatefulWidget {
  final livros;
  final cor;
  final icone;

  const BookShowWidget(this.livros, this.cor, this.icone, {Key? key})
      : super(key: key);

  @override
  State<BookShowWidget> createState() => _BookShowWidgetState();
}

class _BookShowWidgetState extends State<BookShowWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      dynamic item = dados.docs[index].data();
                      String autor = item['autor'];
                      String titulo = item['titulo'];

                      return Card(
                        color: widget.cor,
                        child: ListTile(
                          title: Text(
                            autor,
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                          subtitle: Text(
                            titulo,
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                          trailing: Visibility(
                            // Efetuar o Download
                            // Download executado ao clicar no Icone
                            child: IconButton(
                              icon: Icon(widget.icone),
                              onPressed: () async {
                                //final String path = await getApplicationDocumentsDirectory().path;
                                final taskId = await FlutterDownloader.enqueue(
                                  url: item['LinkDownload'],
                                  savedDir: '/storage/emulated/0/Download',
                                  showNotification:
                                      true, // show download progress in status bar (for Android)
                                  openFileFromNotification:
                                      true, // click on notification to open downloaded file (for Android)
                                );
                              },
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
