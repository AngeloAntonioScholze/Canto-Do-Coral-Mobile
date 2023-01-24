import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'video_item.dart';
import 'loading.dart';

class VideosList extends StatelessWidget {
  //referencia e controle da coleçao no firestore
  final Stream<QuerySnapshot> videos =
      FirebaseFirestore.instance.collection('videos').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: videos,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Algo deu errado!'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return ListView(
          children: snapshot.data.docs
              .map((DocumentSnapshot<Map<String, dynamic>> document) {
            return VideoItem(
              title: document.data()['name'],
              mainText: document.data()['description'],
              image: document.data()['imagem'],
              externalLink: document.data()['url'],
            );
          }).toList(),
        );
      },
    );
  }
}
