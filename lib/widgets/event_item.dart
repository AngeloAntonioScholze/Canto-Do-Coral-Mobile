import 'package:flutter/material.dart';

import '../pages/event_page.dart';

class EventItem extends StatelessWidget {
  final String title;
  final String location;
  final String mainContent;
  final String date;
  final String time;
  final List team;
  final List setlist;
  final String image1;
  final Map image2;
  final String imageBot;
  final String buyTickets;

  EventItem({
    this.title,
    this.mainContent,
    this.image1,
    this.image2,
    this.imageBot,
    this.date,
    this.time,
    this.location,
    this.setlist,
    this.team,
    this.buyTickets,
  });

  void _navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return EventPage(
            title: title,
            mainContent: mainContent,
            date: date,
            time: time,
            image1: image1,
            image2: image2,
            location: location,
            setlist: setlist,
            team: team,
            buyTickets: buyTickets,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateTo(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * 0.02,
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    MediaQuery.of(context).size.height * 0.02,
                  ),
                  bottomLeft: Radius.circular(
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
                      fontSize: MediaQuery.of(context).size.height * 0.07,
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
                    maxLines: 2,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date.substring(8) +
                              '/' +
                              date.substring(5, 7) +
                              ' às ' +
                              time,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        buyTickets.isEmpty
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.045,
                              )
                            : Icon(
                                Icons.local_attraction_outlined,
                                color: Colors.green[800],
                                size:
                                    MediaQuery.of(context).size.height * 0.045,
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
    );
  }
}
