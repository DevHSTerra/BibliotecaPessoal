import 'package:cloud_firestore/cloud_firestore.dart';

class ControladorDeLivros {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }

  retornarBusca(pesquisa) {
    return FirebaseFirestore.instance
        .collection('livros')
        .where('arquivo', isEqualTo: pesquisa)
        .orderBy('arquivo', descending: false);
  }
}
