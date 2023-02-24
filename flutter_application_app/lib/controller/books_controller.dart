import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BooksController {
  listar() {
    return FirebaseFirestore.instance.collection('livros');
  }

  
}
