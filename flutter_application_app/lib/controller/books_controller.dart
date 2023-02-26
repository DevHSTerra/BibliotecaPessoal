import 'package:cloud_firestore/cloud_firestore.dart';

class BooksController {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }
}
