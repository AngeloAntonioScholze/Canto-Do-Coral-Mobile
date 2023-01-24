import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:canto_coral/widgets/outLinkButton.dart';

class LearnPage extends StatelessWidget {
  final String title;
  final String mainText;
  final String externalLink;
  static final String onde = 'EXERCÍCIO';

  LearnPage({
    this.title,
    this.mainText,
    this.externalLink,
  });

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(
            title: Text(title),
          );

    final pageBody = SafeArea(
      child: ListView(
        children: [
          Card(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
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
                      'assets/images/notasMusicais.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.025,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      OutLinkButton(onde, externalLink)
                    ],
                  ),
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
          );
  }
}
