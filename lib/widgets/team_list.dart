import 'package:flutter/material.dart';

class TeamList extends StatelessWidget {
  //Lista de integrantes do firebase
  final List teamList;

  TeamList(
    this.teamList,
  );

  //Funçao para transformar a lista de integrantes do firebase em uma String
  String getList(List mbr) {
    String listaIntegrantes = '';
    for (var i = 0; i < mbr.length; i++) {
      listaIntegrantes = listaIntegrantes + mbr[i]['nome'] + ', ';
    }
    if (listaIntegrantes.endsWith(' ')) {
      listaIntegrantes =
          listaIntegrantes.substring(0, listaIntegrantes.length - 2) + '.';
    }
    return listaIntegrantes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        getList(teamList),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
