import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List cardList = [
    {
      'image': 'assets/images/coralPlaceholder1.jpeg',
      'nome': 'Coro Juvenil Entrevoz',
      'texto':
          'Repertório nacional (MPB, rock e cancioneiro popular) e internacional (rock, pop e musical).',
      'regencia': 'A regência é do Maestro Fernando da Silva Magalhães.',
    },
    {
      'image': 'assets/images/coralPlaceholder2.jpeg',
      'nome': 'Terça Maior - Grupo de Música Popular',
      'texto': 'Repertório de musica popular de qualquer país.',
      'regencia': 'A regência é do Maestro Daniel Chomiak.',
    },
    {
      'image': 'assets/images/coralPlaceholder3.jpeg',
      'nome': 'Boca do Brilho Vocal Feminino',
      'texto': 'Repertorio pensado para o vozes femininas.',
      'regencia': 'A regência é da Maestrina Priscilla Prueter.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Sobre o Coral'),
          )
        : AppBar(
            title: Text('Sobre o Coral'),
          );
    final pageBody = SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: (MediaQuery.of(context).size.height * 0.8) -
                    appBar.preferredSize.height,
                initialPage: 0,
                autoPlay: false,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
              ),
              items: cardList.map(
                (card) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      MediaQuery.of(context).size.height * 0.02,
                                    ),
                                    topRight: Radius.circular(
                                      MediaQuery.of(context).size.height * 0.02,
                                    ),
                                  ),
                                  child: Image.asset(
                                    card['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05,
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      card['nome'],
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Text(
                                      card['texto'],
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      card['regencia'],
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
          );
  }
}
