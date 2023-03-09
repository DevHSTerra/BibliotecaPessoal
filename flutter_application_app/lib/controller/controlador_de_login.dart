// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../suporte/suporte.dart';

class ControladorDeLogin {
  void login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 'principal');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  Future<void> esqueceuSenha(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
  }

  void criarConta(BuildContext context, String nome, String email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(res.user!.uid.toString())
          .set(
        {
          "nome": nome,
          "favoritos": [],
          "lidos": [],
        },
      );

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email é inválido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  Future<String> retornarUsuarioLogado() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return "";
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(currentUser.uid)
        .get();

    if (userDoc.exists) {
      return userDoc.data()?['nome'] ?? "";
    } else {
      return "";
    }
  }
}
