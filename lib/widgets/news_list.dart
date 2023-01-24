import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'news_item.dart';
import 'loading.dart';

class NewsList extends StatelessWidget {
  //referencia e controle da coleçao no firestore
  final Stream<QuerySnapshot> news =
      FirebaseFirestore.instance.collection('newsletters').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: news,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //lidando com erros
        if (snapshot.hasError) {
          return Center(
            child: Text('something whent wrong!'),
          );
        }
        //checando conexao
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        //retornar lista com os itens
        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot<Map<String, dynamic>> document) {
              return NewsItem(
                document.data()['nome'],
                document.data()['detalhes'],
                document.data()['imagem'],
                document.data()['url'],
              );
            },
          ).toList(),
        );
      },
    );
  }
}
