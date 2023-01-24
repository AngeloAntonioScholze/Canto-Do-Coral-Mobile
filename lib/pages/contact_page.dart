import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/coral_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  //funçao asincrona para abrir links externos
  _openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false,
      );
    } else {
      throw 'Não foi possivel abrir o site $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Contato'),
          )
        : AppBar(
            title: Text('Contato'),
          );

    final pageBody = SafeArea(
      child: Card(
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
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              OutlinedButton(
                onPressed: () =>
                    _openBrowser('https://www.facebook.com/coralutfpr'),
                child: Row(
                  children: [
                    Icon(
                      Coral.facebook_1,
                      color: Colors.blue,
                    ),
                    Text(
                      ' /coralutfpr',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () =>
                    _openBrowser('https://www.youtube.com/user/coralutfpr'),
                child: Row(
                  children: [
                    Icon(
                      Coral.youtube_play,
                      color: Colors.red,
                    ),
                    Text(
                      ' /coralutfpr',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => _openBrowser('https://twitter.com/coralutfpr'),
                child: Row(
                  children: [
                    Icon(
                      Coral.twitter_squared,
                      color: Colors.blue,
                    ),
                    Text(
                      ' /coralutfpr',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () =>
                    _openBrowser('https://www.instagram.com/coralutfpr/'),
                child: Row(
                  children: [
                    Icon(
                      Coral.instagram,
                      color: Color.fromRGBO(193, 85, 139, 1),
                    ),
                    Text(
                      ' /coralutfpr',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => _openBrowser(''),
                child: Row(
                  children: [
                    Icon(
                      Coral.phone,
                      color: Colors.blueGrey[600],
                    ),
                    Text(
                      ' (41) 3310-4822',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
