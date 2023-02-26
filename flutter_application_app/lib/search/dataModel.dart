// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? autor;
  final String? titulo;

  DataModel({this.autor, this.titulo});


  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
          autor: dataMap['autor'],
          titulo: dataMap['titulo'],
          );
    }).toList();
  }
}

