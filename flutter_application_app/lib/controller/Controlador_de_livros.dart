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

    if (user == null) {
      return;
    }

    final userRef =
        FirebaseFirestore.instance.collection('usuarios').doc(user.uid);
    final userSnapshot = await userRef.get();

    if (!userSnapshot.exists) {
      // Se o documento de usuário não existir, retorna imediatamente
      return;
    }

    // Obtém a lista de favoritos do documento de usuário, ou uma lista vazia caso ela não exista.
    final favoritos = List<String>.from(userSnapshot.get('favoritos') ?? []);

    if (favoritos.contains(livroId)) {
      await userRef.update({
        'favoritos': FieldValue.arrayRemove([livroId])
      });
    } else {
      await userRef.update({
        'favoritos': FieldValue.arrayUnion([livroId])
      });
    }
  }
}
