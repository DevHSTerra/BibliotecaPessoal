import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/support.dart';


class LoginController {

  void login(context, email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      success(context, 'Usuário autenticado com success.');
      Navigator.pushReplacementNamed(context, 'main');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          error(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          error(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          error(context, 'password incorreta.');
          break;
        default:
          error(context, e.code.toString());
      }
    });
  }

  Future<void> forgotPassword(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
  }
  
  void createAccount(context, name, email, password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      //Armazenar o name no Firestore
      FirebaseFirestore.instance.collection('usuarios').add(
        {
          "uid": res.user!.uid.toString(),
          "name": name,
        },
      );

      success(context, 'Usuário criado com success.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          error(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          error(context, 'O email é inválido.');
          break;
        default:
          error(context, e.code.toString());
      }
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  //
  // RETORNAR USUÁRIO LOGADO
  //
  Future<String> returnUser() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then(
      (q) {
        if (q.docs.isNotEmpty) {
          res = q.docs[0].data()['name'];
        } else {
          res = "";
        }
      },
    );
    return res;
  }
}
