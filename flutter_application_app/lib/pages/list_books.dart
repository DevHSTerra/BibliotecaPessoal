// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/books_controller.dart';
import 'book_show_widget.dart';
import 'support.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  var livros;

  @override
  void initState() {
    super.initState();
    livros = BooksController().listar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,
      child: Column(
        children: [
          BookShowWidget(
            livros,
            Colors.yellowAccent.shade100,
            Icons.download_sharp,
          ),
        ],
      ),
    );
  }
}
