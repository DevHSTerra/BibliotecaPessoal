import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControladorDeLivros {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }

  Future<List> iconeFavorito() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(uid) // adicionar o UID do usuário autenticado aqui
        .get()
        .then((doc) {
      if (doc.exists) {
        res = doc.data()?['favoritos'] ?? [];
      } else {
        res = [];
      }
    });
    return res;
  }

  Future<void> livroFavorito(String livroId) async {
    final user = FirebaseAuth.instance.currentUser;

    final userRef =
        FirebaseFirestore.instance.collection('usuarios').doc(user?.uid);

    if (await userRef.get().get('favoritos')!.contains(livroId)) {
      await userRef.update({
        'favoritos': ("livros/${FieldValue.arrayRemove([livroId])}")
      });
    } else {
      await userRef.update({
        'favoritos': ("livros/${FieldValue.arrayUnion([livroId])}")
      });
    }
  }
}
