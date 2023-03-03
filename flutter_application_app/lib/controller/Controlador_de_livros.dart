import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControladorDeLivros {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }

  Future<List> retornarLivrosFavoritos() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then(
      (q) {
        if (q.docs.isNotEmpty) {
          res = q.docs[0].data()['favoritos'];
        } else {
          res = [];
        }
      },
    );
    return res;
  }

  // Future<void> adicionarLivrosFavoritos(livroid) async {
  //   var uid = FirebaseAuth.instance.currentUser!.uid;
  //   await FirebaseFirestore.instance
  //       .collection('usuarios')
  //       .where('uid', isEqualTo: uid)
  //       .get()
  //       .docs[0].reference.
  //       update({'favoritos': livroid});
  // }
}
