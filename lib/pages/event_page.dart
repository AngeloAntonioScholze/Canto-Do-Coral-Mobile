import 'dart:io';

import 'package:canto_coral/widgets/outLinkButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/setlist.dart';
import '../widgets/team_list.dart';

class EventPage extends StatelessWidget {
  final String title;
  final String location;
  final String mainContent;
  final String date;
  final String time;
  final List team;
  final List setlist;
  final String image1;
  final Map image2;
  final String buyTickets;
  static final String onde = 'INGRESSOS';

  EventPage({
    this.title,
    this.mainContent,
    this.image1,
    this.image2,
    this.date,
    this.time,
    this.location,
    this.setlist,
    this.team,
    this.buyTickets,
  });

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Titulo Evento',
            ),
          )
        : AppBar(
            title: Text(
              'Titulo Evento',
            ),
          );

    final botNavBar = BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buyTickets.isEmpty
              ? Container(
                  height: 0,
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025),
                  child: OutLinkButton(
                    onde,
                    buyTickets,
                  ),
                ),
        ],
      ),
    );

    final pageBody = SafeArea(
      child: ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date.substring(8),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              date.substring(5, 7) + '/' + date.substring(0, 4),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.17,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 3,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              location,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    date.substring(8) +
                                        '/' +
                                        date.substring(5, 7) +
                                        ' às ' +
                                        time,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  buyTickets.isEmpty
                                      ? Container()
                                      : Icon(
                                          Icons.local_attraction_outlined,
                                          color: Colors.green[800],
                                          size: 30,
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Descrição do Evento',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        mainContent,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: image1.isEmpty
                      ? Container()
                      : Image.network(
                          image1,
                          fit: BoxFit.fitWidth,
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045,
                  ),
                  child: setlist.isEmpty
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Setlist',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Setlist(
                              setlist,
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045,
                  ),
                  child: team.isEmpty
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Equipe',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TeamList(
                              team,
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: image2.isEmpty
                      ? Container()
                      : Image.network(
                          image2['imagem'],
                          fit: BoxFit.fitWidth,
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Local do Evento',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (buyTickets.isEmpty || Platform.isAndroid)
                        ? Container()
                        : Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.025),
                            child: OutLinkButton(
                              onde,
                              buyTickets,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
            bottomNavigationBar: botNavBar,
          );
  }
}
