import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BooksController {

  listar(status) {
    return FirebaseFirestore.instance
        .collection('livros')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: status);
  }

  void adicionar(autor, titulo) {
    FirebaseFirestore.instance.collection('livros').add(
      {
        'autor': autor,
        'titulo': titulo,
        'status': '0',
        'uid': FirebaseAuth.instance.currentUser!.uid,
      },
    );
  }

}
