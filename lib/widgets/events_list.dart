import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'event_item.dart';
import 'loading.dart';

class EventsList extends StatelessWidget {
  //referencia e controle da coleçao no firestore
  final Stream<QuerySnapshot> events =
      FirebaseFirestore.instance.collection('eventos').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: events,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //lidando com erros
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'something whent wrong!',
            ),
          );
        }
        //checando conexao
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot<Map<String, dynamic>> document) {
              return EventItem(
                title: document.data()['nome'],
                mainContent: document.data()['description'],
                date: document.data()['data'],
                location: document.data()['local'],
                setlist: document.data()['musicas'],
                team: document.data()['integrantes'],
                image1: document.data()['imagem'],
                image2: document.data()['equipe'],
                time: document.data()['horario'],
                buyTickets: document.data()['ingressos'],
              );
            },
          ).toList(),
        );
      },
    );
  }
}
