import 'package:cloud_firestore/cloud_firestore.dart';

class ControladorDeLivros {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }
}
