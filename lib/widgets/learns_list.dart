import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'learn_item.dart';
import 'loading.dart';

class LearnsList extends StatelessWidget {
  //referencia e controle da coleçao no firestore
  final Stream<QuerySnapshot> learns =
      FirebaseFirestore.instance.collection('exercicios-musicais').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: learns,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('something whent wrong!');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot<Map<String, dynamic>> document) {
              return LearnItem(
                document.data()['name'],
                document.data()['detalhes'],
                document.data()['url'],
              );
            },
          ).toList(),
        );
      },
    );
  }
}
